#!/usr/bin/env python3
"""Crea MP4 al 50 % y 75 % desde las fuentes de los cuatro ejercicios.

Uso: python3 render_tempos.py [c029-c032 c052-c059 c060-c063 c064-c067]
Recompila y sintetiza cada tempo: mantiene alturas, dinámicas y articulaciones.
PDF, MIDI y WAV intermedios son temporales. Los MP4 se guardan en out/.
Requiere los MIDI originales vigentes para verificar la equivalencia musical.
"""

import argparse
from array import array
from fractions import Fraction
import json
import math
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import wave

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
SEGMENTS = {
    "c029-c032": (120, 12), "c052-c059": (60, 6),
    "c060-c063": (120, 12), "c064-c067": (120, 12),
}
RATIOS = ((Fraction(1, 2), "t050"), (Fraction(3, 4), "t075"))
RATE = 44100


def run(*args):
    subprocess.run([str(arg) for arg in args], check=True)


def midi_events(path):
    """Lee eventos de canal y tempo de MIDI estándar para comparar versiones."""
    data = Path(path).read_bytes()
    if data[:4] != b"MThd":
        raise ValueError(f"MIDI inválido: {path}")
    division = int.from_bytes(data[12:14], "big")
    if division & 0x8000:
        raise ValueError("Se requiere resolución MIDI PPQ")
    cursor = 8 + int.from_bytes(data[4:8], "big")
    events, tempos = [], []
    while cursor < len(data):
        length = int.from_bytes(data[cursor + 4:cursor + 8], "big")
        block = data[cursor + 8:cursor + 8 + length]
        cursor += 8 + length
        index = tick = 0
        running = None

        def vlq():
            nonlocal index
            value = 0
            while True:
                byte = block[index]
                index += 1
                value = value * 128 + (byte & 127)
                if byte < 128:
                    return value

        while index < len(block):
            tick += vlq()
            if block[index] >= 128:
                status = block[index]
                index += 1
                if status < 240:
                    running = status
            else:
                if running is None:
                    raise ValueError("Running status MIDI sin evento previo")
                status = running
            if status == 255:
                kind = block[index]
                index += 1
                size = vlq()
                payload = block[index:index + size]
                index += size
                if kind == 81:
                    tempos.append((Fraction(tick, division), int.from_bytes(payload, "big")))
            elif status in (240, 247):
                size = vlq()
                index += size
            else:
                size = 1 if status & 240 in (192, 208) else 2
                payload = tuple(block[index:index + size])
                index += size
                events.append((Fraction(tick, division), status, payload))
    return sorted(events), sorted(tempos)


def variant_source(source, bpm, ratio, base):
    pattern = r'(\\tempo\s+"[^"\n]*"\s+4\.\s*=\s*)\d+'
    text, count = re.subn(pattern, lambda match: match[1] + str(bpm), source)
    if count != 1:
        raise ValueError("Se esperaba una sola indicación de tempo con negra con puntillo")
    text = text.replace('  tagline = ##f',
                        f'  subsubtitle = "Tempo de estudio: {ratio} del original"\n  tagline = ##f')
    if base == "c052-c059":
        text = text.replace('Mi-fa: dos semicorcheas en la última corchea, con su duración original.',
                            'Mi-fa: dos semicorcheas en la última corchea; entrada al tempo de estudio.')
        text = text.replace('Adaptación del 51: corcheas a 120 = semicorcheas a 60 (negra con puntillo).',
                            f'Entrada del 51 adaptada: corcheas a {bpm * 2} = semicorcheas a {bpm} (negra con puntillo).')
    return text


def count_in(path, bpm, eighths):
    step = 60 / (bpm * 3)
    samples = array("h", [0]) * (round(eighths * step * RATE) * 2)
    for beat in range(eighths):
        main = beat % 3 == 0
        frequency = 1500 if main else 1050
        amplitude = .42 if beat == 0 else ((.38 if eighths == 6 else .34) if main
                                          else (.20 if eighths == 6 else .17))
        start = round(beat * step * RATE)
        for offset in range(round(.065 * RATE)):
            time = offset / RATE
            envelope = min(time / .0015, 1) * math.exp(-75 * time)
            value = round(32767 * amplitude * envelope * math.sin(2 * math.pi * frequency * time))
            index = 2 * (start + offset)
            samples[index] = samples[index + 1] = value
    if sys.byteorder != "little":
        samples.byteswap()
    with wave.open(str(path), "wb") as output:
        output.setparams((2, 2, RATE, 0, "NONE", "not compressed"))
        output.writeframes(samples.tobytes())


def render(base, ratio, suffix):
    original_bpm, eighths = SEGMENTS[base]
    bpm = original_bpm * ratio
    if bpm.denominator != 1:
        raise ValueError("El tempo resultante debe ser entero")
    bpm = int(bpm)
    folder = HERE / base
    baseline, _ = midi_events(folder / f"{base}.midi")
    name = f"{base}_{suffix}"
    source = variant_source((folder / f"{base}.ly").read_text(), bpm, ratio, base)
    with tempfile.TemporaryDirectory(prefix=f"{name}-") as temporary:
        work = Path(temporary)
        score = work / f"{name}.ly"
        score.write_text(source)
        run("lilypond", "-I", work, "-o", work / name, score)
        midi = work / f"{name}.midi"
        events, tempos = midi_events(midi)
        if events != baseline:
            raise ValueError(f"Eventos musicales distintos del original: {name}")
        expected_tempo = 40_000_000 / bpm  # negra = 1,5 × negra con puntillo
        if len(tempos) != 1 or tempos[0][0] != 0:
            raise ValueError(f"Tempo MIDI inesperado: {tempos}")
        # LilyPond 2.24.4 redondea la negra 67,5 a 67 cuando 4. = 45.
        # Escribir el tempo SMF en microsegundos conserva la proporción pedida.
        exact_tempo = round(expected_tempo)
        if tempos[0][1] != exact_tempo:
            data = midi.read_bytes()
            before = b"\xff\x51\x03" + tempos[0][1].to_bytes(3, "big")
            after = b"\xff\x51\x03" + exact_tempo.to_bytes(3, "big")
            if data.count(before) != 1:
                raise ValueError("No se puede localizar de forma única el tempo MIDI")
            midi.write_bytes(data.replace(before, after, 1))
            events, tempos = midi_events(midi)
        if events != baseline or abs(tempos[0][1] - expected_tempo) > .5:
            raise ValueError("La corrección de tempo no superó la verificación")
        run("bash", ROOT / "render_wav.sh", midi, work)
        click = work / "claqueta.wav"
        count_in(click, bpm, eighths)
        mixed = work / "mezcla.wav"
        run("sox", "-m", work / f"{name}.wav", click, "-b", "16", mixed, "gain", "-n", "-3")
        mixed.replace(work / f"{name}.wav")
        run("bash", ROOT / "render_mp4.sh", work / f"{name}.pdf", work)
        video = work / f"{name}.mp4"
        media = json.loads(subprocess.check_output([
            "ffprobe", "-v", "error", "-show_entries", "stream=codec_type,duration,width,height",
            "-of", "json", str(video)]))
        if {stream["codec_type"] for stream in media["streams"]} != {"audio", "video"}:
            raise ValueError(f"Falta una pista en {name}")
        out = folder / "out"
        out.mkdir(exist_ok=True)
        shutil.copy2(video, out / video.name)
        note_ons = [(t, args) for t, status, args in events if status & 240 == 144 and args[1] > 0]
        print("VERIFICADO " + json.dumps({
            "file": str(out / video.name), "ratio": str(ratio), "bpm_dotted_quarter": bpm,
            "notes": len(note_ons), "count_in_seconds": eighths * 20 / bpm,
            "first_note_seconds": float(note_ons[0][0]) * tempos[0][1] / 1_000_000,
            "streams": media["streams"], "channel_events_match_original": True,
        }), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("segments", nargs="*", metavar="SEGMENTO")
    args = parser.parse_args()
    selected = args.segments or list(SEGMENTS)
    if any(name not in SEGMENTS for name in selected):
        parser.error("Segmentos admitidos: " + ", ".join(SEGMENTS))
    for base in dict.fromkeys(selected):
        for ratio, suffix in RATIOS:
            render(base, ratio, suffix)


if __name__ == "__main__":
    main()
