#!/usr/bin/env python3
"""Regenera los ejercicios 29–32, 60–63 y 64–67, en 12/8 y 4. = 120.

Uso: python3 render_12_8.py [c029-c032] [c060-c063] [c064-c067]
Sin argumentos genera los tres. Reutiliza el renderizado común del proyecto.
No extrae ni actualiza notas; las fuentes contienen un silencio inicial de 2 s.
"""

import argparse
from array import array
import math
from pathlib import Path
import subprocess
import sys
import tempfile
import wave

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
RATE = 44100
SEGMENTS = ("c029-c032", "c060-c063", "c064-c067")


def run(*args):
    subprocess.run([str(arg) for arg in args], check=True)


def write_count_in(path):
    """12 corcheas en 2 s; pulsos acentuados en 1, 4, 7 y 10."""
    samples = array("h", [0]) * (2 * RATE * 2)
    for index in range(12):
        start = round(index * RATE / 6)
        main = index % 3 == 0
        frequency = 1500 if main else 1050
        amplitude = .42 if index == 0 else (.34 if main else .17)
        for offset in range(round(.065 * RATE)):
            t = offset / RATE
            envelope = min(t / .0015, 1) * math.exp(-75 * t)
            value = round(32767 * amplitude * envelope
                          * math.sin(2 * math.pi * frequency * t))
            sample = 2 * (start + offset)
            samples[sample] = samples[sample + 1] = value
    if sys.byteorder != "little":
        samples.byteswap()
    with wave.open(str(path), "wb") as output:
        output.setparams((2, 2, RATE, 0, "NONE", "not compressed"))
        output.writeframes(samples.tobytes())


def render(base):
    folder = HERE / base
    out = folder / "out"
    out.mkdir(exist_ok=True)
    with tempfile.TemporaryDirectory(prefix=f"{base}-") as temporary:
        work = Path(temporary)
        run("bash", ROOT / "render_wav.sh", folder / f"{base}.ly", work)
        click = work / "claqueta.wav"
        write_count_in(click)
        # La fuente ya incluye el compás de preparación: no desplazar el MIDI.
        run("sox", "-m", work / f"{base}.wav", click,
            "-b", "16", out / f"{base}.wav", "gain", "-n", "-3")
    run("bash", ROOT / "render_mp4.sh", folder / f"{base}.pdf")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("segments", nargs="*", metavar="SEGMENTO")
    args = parser.parse_args()
    selected = args.segments or SEGMENTS
    if any(name not in SEGMENTS for name in selected):
        parser.error("Segmentos admitidos: " + ", ".join(SEGMENTS))
    for base in dict.fromkeys(selected):
        render(base)


if __name__ == "__main__":
    main()
