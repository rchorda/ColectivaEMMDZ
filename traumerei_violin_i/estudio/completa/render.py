#!/usr/bin/env python3
"""Genera Träumerei completo con claqueta y seguimiento de la repetición."""

import argparse
from fractions import Fraction
from pathlib import Path
import re
from runpy import run_path
from tempfile import TemporaryDirectory

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
REFERENCE = HERE / "traumerei-estudio-72.ly"
ORIGINAL = HERE.parents[1] / "traumerei_violin_i.midi"
TEMPOS = (36, 54, 72)
shared = run_path(str(ROOT / "render_compas_activo.py"))
click = run_path(str(ROOT / "celtic_carol/estudio/render_tempos.py"))["count_in"]
midi_events, render_video, run = (shared[key] for key in ("midi_events", "render_video", "run"))


def variant_source(source, bpm):
    source = source.replace("negra = 72", f"negra = {bpm}")
    source = source.replace(r'\tempo "Flowing and smooth" 4 = 72',
                            rf'\tempo "Flowing and smooth" 4 = {bpm}')

    def scale_hidden(match):
        pulse = Fraction(int(match[1]) * bpm, 72 * 4)
        return (r"\set Score.tempoWholesPerMinute = "
                f"#(ly:make-moment {pulse.numerator} {pulse.denominator})")

    return re.sub(r'\\tempo 4 = (\d+)', scale_hidden, source)


def mapped_playback(original_events):
    # Índices grabados: entrada, anacrusa, cc. 1–7, dos casillas de c. 8, cc. 9–24.
    result = [(0, 0), (1, 4)]
    for pass_index in range(2):
        start = 5 + pass_index * 32
        result.extend((bar + 1, start + (bar - 1) * 4) for bar in range(1, 8))
        result.append((9 + pass_index, start + 28))
    grace = next(at for at, status, payload in original_events
                 if 96 < at < 97 and status & 0xf0 == 0x90 and payload[0] == 60 and payload[1])
    for bar in range(9, 25):
        # La fermata del 22 añade una negra al MIDI; el último compás también la suma.
        beat = grace + 4 if bar == 17 else 69 + (bar - 9) * 4 + (bar >= 23)
        result.append((bar + 2, beat))
    result.append((None, 134))
    return result


def verify_and_tune(midi, bpm, original_events, original_tempos):
    events, tempos = midi_events(midi)
    # LilyPond mantiene los cambios de programa iniciales en cero.
    expected = sorted((at + 4 if at or status & 0xf0 in (0x80, 0x90) else at, status, payload)
                      for at, status, payload in original_events)
    if events != expected:
        raise ValueError(f"La música MIDI de {midi.name} difiere de la fuente")
    positions = [0, *(at + 4 for at, _ in original_tempos[1:])]
    if [at for at, _ in tempos] != positions:
        raise ValueError(f"Posiciones de tempo inesperadas en {midi.name}")
    original_bpms = [round(60_000_000 / micros) for _, micros in original_tempos]
    exact_rates = [round(Fraction(60_000_000 * 72, pulse * bpm)) for pulse in original_bpms]
    rates = iter(exact_rates)
    data = midi.read_bytes()
    locations = rb"\xff\x51\x03.{3}"
    if len(re.findall(locations, data, flags=re.S)) != len(exact_rates):
        raise ValueError(f"No se localizaron los eventos de tempo de {midi.name}")
    midi.write_bytes(re.sub(locations, lambda _: b"\xff\x51\x03" + next(rates).to_bytes(3, "big"),
                            data, flags=re.S))
    if midi_events(midi) != (expected, list(zip(positions, exact_rates))):
        raise ValueError(f"No se pudieron verificar los tempos exactos de {midi.name}")


def render(bpm):
    base = HERE / f"traumerei-estudio-{bpm}"
    ly, pdf, midi, wav, mp4 = (base.with_suffix(extension)
                               for extension in (".ly", ".pdf", ".midi", ".wav", ".mp4"))
    if bpm != 72:
        ly.write_text(variant_source(REFERENCE.read_text(), bpm))
    log = run("lilypond", "-o", base, ly)
    if "warning:" in log.lower():
        raise ValueError(log)
    original_events, original_tempos = midi_events(ORIGINAL)
    verify_and_tune(midi, bpm, original_events, original_tempos)
    with TemporaryDirectory(prefix="traumerei-estudio-") as temp:
        folder = Path(temp)
        run("bash", ROOT / "render_wav.sh", midi, folder)
        count_in = folder / "claqueta.wav"
        click(count_in, bpm, 4, subdivisions=1)
        run("sox", "-m", folder / wav.name, count_in, "-b", "16", wav, "gain", "-n", "-3")
    render_video("traumerei", ly, pdf, midi, wav, mp4, playback=mapped_playback(original_events))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bpm", metavar="BPM", nargs="*", type=int)
    args = parser.parse_args()
    if set(args.bpm).difference(TEMPOS):
        parser.error("Tempos disponibles: 36 54 72")
    for bpm in dict.fromkeys(args.bpm or TEMPOS):
        render(bpm)
