#!/usr/bin/env python3
"""Renderiza obras y segmentos de estudio con el compás activo sobre el PDF."""

import argparse
from collections import defaultdict
from fractions import Fraction
from itertools import accumulate, pairwise
import json
from pathlib import Path
import re
from runpy import run_path
import subprocess
from tempfile import TemporaryDirectory
from xml.etree import ElementTree

from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parent
midi_events = run_path(str(ROOT / "celtic_carol/estudio/render_tempos.py"))["midi_events"]
FPS = 15
# Comienzo de cada sistema y límite exclusivo de la última línea de cada página.
SYSTEMS = {
    "celtic-carol": (
        (0, 8, 14, 18, 22, 26, 30, 37),
        (37, 42, 46, 51, 57, 62, 65, 68, 71, 74),
        (74, 77, 81, 85, 89, 95, 101, 107, 113),
    ),
    "verano": (
        (0, 3, 6, 10, 12, 16, 20),
        (20, 21, 25, 29, 32, 35, 38, 41),
        (41, 45, 49, 55, 58, 61, 64, 67),
        (67, 70, 74, 85, 89, 93, 97, 101),
        (101, 105, 109, 113, 117, 120),
        (120, 121, 124, 127, 131),
    ),
    "intermezzo": ((-3, 1, 5, 9, 14, 20, 27, 32, 38, 43, 49),),
}
MULTIRESTS = {
    "celtic-carol": ((33, 36),),
    "verano": ((49, 54), (74, 84), (98, 100), (117, 119)),
    "intermezzo": (),
}
TEMPOS = {
    "celtic-carol": (60, 90, 120),
    "verano": (80, 90, 100, 110, 120),
    "intermezzo": (36, 54, 72),
}
FOLDERS = {
    "celtic-carol": ROOT / "celtic_carol/estudio/completa",
    "verano": ROOT / "verano/estudio/completa",
    "intermezzo": ROOT / "intermezzo/estudio/completa",
}
TRANSLATE = re.compile(r"translate\(([-.\d]+),\s*([-.\d]+)\)")


def run(*command):
    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    if result.returncode:
        raise RuntimeError(result.stdout)
    return result.stdout


def seconds_at(quarter, tempos):
    bounds = [start for start, _ in tempos[1:]] + [quarter]
    return sum((min(end, quarter) - start) * rate
               for (start, rate), end in zip(tempos, bounds) if start < quarter) / 1_000_000


def start_beat(work, bar):
    if work == "celtic-carol":
        return bar * 6 - max(0, min(8, bar - 52)) * 3
    if work == "intermezzo":
        return (bar + 3) * 3
    return bar * 3


def score_geometry(svg):
    root = ElementTree.parse(svg).getroot()
    _, _, width, height = map(float, root.attrib["viewBox"].split())
    staff_lines = []
    barlines = defaultdict(list)
    for group in root:
        transform = TRANSLATE.fullmatch(group.get("transform", ""))
        if not transform or not len(group):
            continue
        x, y = map(float, transform.groups())
        item = group[0]
        if (item.tag.endswith("}line") and item.get("y1") == item.get("y2") == "0"
                and float(item.get("x2", 0)) - float(item.get("x1", 0)) > width / 2):
            staff_lines.append((y, x))
        if item.tag.endswith("}rect") and item.get("y") == "-2.0000" and item.get("height") == "4.0000":
            barlines[y].append(x + float(item.get("x", 0)))
    lines = sorted(staff_lines)
    if len(lines) % 5:
        raise ValueError(f"Pentagramas incompletos en {svg.name}")
    return width, height, lines, barlines


def raster_staff_lines(image):
    """Ubica las líneas del PDF: el backend SVG puede variar el espaciado vertical."""
    px = image.load()
    xs = range(image.width * 55 // 100, image.width * 90 // 100, 4)
    rows = []
    for y in range(image.height):
        if sum(px[x, y] < 205 for x in xs) > len(xs) * .85:
            if rows and y == rows[-1][-1] + 1:
                rows[-1].append(y)
            else:
                rows.append([y])
    return [sum(row) / len(row) for row in rows]


def raster_barline(gray, x, center, step, tolerance):
    px = gray.load()
    middle = round(x)
    ys = range(round(center - 1.75 * step), round(center + 1.75 * step))
    candidates = range(middle - 6, middle + 7)
    best = max(candidates, key=lambda col: (sum(255 - px[col, y] for y in ys), -abs(col-middle)))
    if sum(px[best, y] < 215 for y in ys) >= len(ys) * .65:
        return best
    # En el PDF, una etiqueta puede redistribuir el espacio de la entrada.
    for distance in range(7, tolerance + 1):
        for col in (middle + distance, middle - distance):
            if 0 <= col < gray.width and sum(px[col, y] < 215 for y in ys) >= len(ys) * .85:
                return col
    raise ValueError(f"No se localizó la barra del PDF junto a x={middle}, y={center:g}")


def engraved_barlines(columns):
    edges = []
    for x in sorted(columns):
        if edges and x - edges[-1] < 1:
            edges[-1] = x
        else:
            edges.append(x)
    return edges


def measure_regions(work, svg, image, systems, *, segment=False):
    width, _, lines, barlines = score_geometry(svg)
    gray = image.convert("L")
    rows = raster_staff_lines(gray)
    if len(rows) != len(lines) or len(lines) != 5 * (len(systems) - 1):
        raise ValueError(f"Número de sistemas inesperado en {svg.name}")
    multirests = () if segment else MULTIRESTS[work]
    compressed = {bar: start for start, end in multirests for bar in range(start + 1, end + 1)}
    for index, ((start, end), (y, left)) in enumerate(zip(pairwise(systems), lines[2::5])):
        center = rows[5 * index + 2]
        step = (rows[5 * index + 4] - rows[5 * index]) / 4
        edges = engraved_barlines(barlines[y])
        visible_bars = [bar for bar in range(start, end) if bar not in compressed]
        if len(edges) != len(visible_bars):
            raise ValueError(f"{svg.name}, compases {start}–{end-1}: {len(edges)} barras para {len(visible_bars)} compases impresos")
        tolerance = round(image.width * .025) if segment or (work == "verano" and start == 0) else 6
        edges = [raster_barline(gray, x / width * image.width, center, step, tolerance) for x in edges]
        first = round((left + (11.8 if work != "intermezzo" and start == 0 else 3.1)) / width * image.width)
        if first >= edges[0] or edges != sorted(set(edges)):
            raise ValueError(f"Barras desordenadas en {svg.name}, sistema de {start}")
        rects = dict(zip(visible_bars, zip([first, *edges[:-1]], edges)))
        for bar in range(start, end):
            x1, x2 = rects[compressed.get(bar, bar)]
            label = any(low <= bar <= high for low, high in multirests)
            coords = (x1, round(center - 6.3 * step), x2, round(center + 6.3 * step))
            yield bar, coords, label


def mark_measure(page, coords, bar, label):
    x1, y1, x2, y2 = coords
    layer = Image.new("RGBA", (x2-x1, y2-y1))
    scale = page.width / 1654
    draw = ImageDraw.Draw(layer)
    draw.rounded_rectangle((0, 0, layer.width-2, layer.height-1),
                           radius=round(9*scale), fill=(255, 205, 43, 46))
    draw.rounded_rectangle((0, 4, round(6*scale), layer.height-5),
                           radius=round(3*scale), fill=(192, 121, 12, 185))
    if label:
        font = ImageFont.load_default(size=round(24*scale))
        draw.text((layer.width//2, layer.height-10), f"Compás {bar}",
                  font=font, anchor="mb", fill=(95, 60, 6, 255))
    frame = page.copy()
    frame.alpha_composite(layer, (x1, y1))
    return frame.convert("RGB")


def segment_layout(source, svg_pages):
    match = re.fullmatch(r"c(\d+)-c(\d+)(?:_t\d+)?", source.stem)
    meters = set(re.findall(r"\\time\s+(\d+)/(\d+)", source.read_text()))
    if not match or len(meters) != 1:
        raise ValueError(f"No se pudo identificar el intervalo y la métrica de {source.name}")
    first, last = map(int, match.groups())
    numerator, denominator = map(int, meters.pop())
    quarter_beats = Fraction(4 * numerator, denominator)
    # La entrada ocupa un compás completo, incluso cuando contiene anacrusa.
    current = first - 1
    pages = []
    for svg in svg_pages:
        _, _, lines, barlines = score_geometry(svg)
        sizes = [len(engraved_barlines(barlines[y])) for y, _ in lines[2::5]]
        if not sizes or not all(sizes):
            raise ValueError(f"Hay sistemas sin barras de compás en {svg.name}")
        boundaries = tuple(accumulate(sizes, initial=current))
        pages.append(boundaries)
        current = boundaries[-1]
    if current != last + 1:
        raise ValueError(f"La partitura {source.name} acaba antes del compás {current}, se esperaba {last+1}")
    return pages, lambda bar: (bar - first + 1) * quarter_beats


def render_video(work, source, pdf, midi, wav, output, *, segment=False):
    events, tempos = midi_events(midi)
    if not tempos or tempos[0][0] != 0:
        raise ValueError(f"Falta el tempo inicial de {midi.name}")
    duration = float(run("ffprobe", "-v", "error", "-show_entries", "format=duration",
                         "-of", "csv=p=0", wav))
    output.parent.mkdir(parents=True, exist_ok=True)
    with TemporaryDirectory(prefix=".compas-", dir=output.parent) as temp:
        folder = Path(temp)
        run("lilypond", "-dbackend=svg", "-dno-point-and-click", "-o", folder / "mapa", source)
        dpi = "130" if work == "verano" and not segment else "200"
        run("pdftoppm", "-r", dpi, "-png", pdf, folder / "pagina")
        pdf_pages = sorted(folder.glob("pagina-*.png"))
        svg_pages = sorted(folder.glob("mapa*.svg"))
        if segment:
            layout, beat = segment_layout(source, svg_pages)
        else:
            layout = SYSTEMS[work]
            def beat(bar):
                return start_beat(work, bar)
        if len(pdf_pages) != len(svg_pages) or len(svg_pages) != len(layout):
            raise ValueError(f"Número de páginas inesperado en {source.name}")
        last_bar = layout[-1][-1]
        score_end = seconds_at(beat(last_bar), tempos)
        last_event = seconds_at(events[-1][0], tempos)
        if not 0 <= score_end - last_event < 6 or not 0 < duration - score_end < 8:
            raise ValueError(f"El WAV y el mapa de compases no coinciden para {source.name}")

        frames = ["ffconcat version 1.0"]
        for image_path, svg, systems in zip(pdf_pages, svg_pages, layout):
            with Image.open(image_path) as raw:
                page = raw.convert("RGBA")
            for bar, coords, label in measure_regions(work, svg, page, systems, segment=segment):
                start = seconds_at(beat(bar), tempos)
                end = (duration if bar + 1 == last_bar
                       else seconds_at(beat(bar + 1), tempos))
                filename = f"compas-{bar:03}.png"
                mark_measure(page, coords, bar, label).save(folder / filename, compress_level=1)
                frames.extend((f"file '{filename}'", "option framerate 1000", f"duration {float(end-start):.6f}"))
        frames.extend((f"file '{filename}'", "option framerate 1000"))
        concat = folder / "marcas.txt"
        concat.write_text("\n".join(frames) + "\n")
        staged = folder / output.name
        print(f"Codificando {output.name} · {len(pdf_pages)} páginas · {duration:.2f} s", flush=True)
        run("ffmpeg", "-nostdin", "-v", "error", "-f", "concat", "-safe", "0", "-i", concat,
            "-i", wav, "-map", "0:v:0", "-map", "1:a:0",
            "-vf", f"fps={FPS},crop=trunc(iw/2)*2:trunc(ih/2)*2",
            "-t", str(duration), "-c:v", "libx264", "-preset", "veryfast", "-threads", "4",
            "-pix_fmt", "yuv420p", "-c:a", "aac", "-b:a", "192k", "-movflags", "+faststart", staged)
        metadata = json.loads(run("ffprobe", "-v", "error", "-show_entries",
                                  "stream=codec_type,duration", "-of", "json", staged))
        tracks = {track["codec_type"]: float(track["duration"]) for track in metadata["streams"]}
        if set(tracks) != {"audio", "video"} or any(abs(track - duration) > .12 for track in tracks.values()):
            raise ValueError(f"Pistas o duración inesperadas: {staged.name}")
        staged.replace(output)
    print(f"Verificado {output.name} · {output.stat().st_size / 1_000_000:.2f} MB", flush=True)


def render_edition(work, bpm):
    base = FOLDERS[work] / f"{work}-estudio-{bpm}"
    output = base.with_suffix(".mp4")
    if work != "intermezzo":
        render_video(work, base.with_suffix(".ly"), base.with_suffix(".pdf"),
                     base.with_suffix(".midi"), base.with_suffix(".wav"), output)
        return

    reference = ROOT / "intermezzo/intermezzo"
    score, count = re.subn(r'(\\tempo "Andante sostenuto" 4 = )72\b',
                           lambda match: match[1] + str(bpm), reference.with_suffix(".ly").read_text())
    if count != 1:
        raise ValueError("No se encontró el tempo de Intermezzo")
    with TemporaryDirectory(prefix="intermezzo-compas-") as temp:
        edition = Path(temp) / base.name
        source = edition.with_suffix(".ly")
        source.write_text(score)
        run("lilypond", "-o", edition, source)
        midi = edition.with_suffix(".midi")
        events, tempos = midi_events(midi)
        if events != midi_events(reference.with_suffix(".midi"))[0] or tempos[0] != (0, int(Fraction(60_000_000, bpm))):
            raise ValueError(f"Eventos o tempo inesperados en {source.name}")
        run("bash", ROOT / "render_wav.sh", midi, edition.parent)
        render_video(work, source, edition.with_suffix(".pdf"), midi, edition.with_suffix(".wav"), output)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("obra", choices=TEMPOS)
    parser.add_argument("bpm", nargs="*", type=int)
    parser.add_argument("--segmento", nargs=5, type=lambda value: Path(value).resolve(),
                        metavar=("LY", "PDF", "MIDI", "WAV", "MP4"))
    args = parser.parse_args()
    if args.segmento:
        if args.bpm:
            parser.error("El tempo del segmento se toma de su MIDI")
        render_video(args.obra, *args.segmento, segment=True)
        return
    if set(args.bpm) - set(TEMPOS[args.obra]):
        parser.error(f"Tempos disponibles para {args.obra}: {TEMPOS[args.obra]}")
    for bpm in dict.fromkeys(args.bpm or TEMPOS[args.obra]):
        render_edition(args.obra, bpm)


if __name__ == "__main__":
    main()
