#!/usr/bin/env python3
"""Regenera este ejercicio y mezcla la claqueta con la preparación anacrúsica.

No extrae ni actualiza notas desde la obra. Requiere los scripts de la raíz.
La preparación usa el 6/8 de destino, negra con puntillo = 60 (2 s).
Mi–fa conserva su duración real y se escribe como dos semicorcheas.
El compás 52 comienza a los 2 s, manteniendo la métrica y el tempo.
"""

from array import array
import math
from pathlib import Path
import subprocess
import sys
import tempfile
import wave


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
BASE = "c052-c059"
RATE = 44100


def run(*args):
    subprocess.run([str(arg) for arg in args], check=True)


def write_count_in(path):
    """Seis corcheas del 6/8 de destino, con acentos en la primera y cuarta."""
    samples = array("h", [0]) * (2 * RATE * 2)
    beats = ((0, 1500, .42), (1 / 3, 1050, .20), (2 / 3, 1050, .20),
             (1, 1500, .38), (4 / 3, 1050, .20), (5 / 3, 1050, .20))
    for onset, frequency, amplitude in beats:
        start = round(onset * RATE)
        for offset in range(round(0.065 * RATE)):
            t = offset / RATE
            envelope = min(t / 0.0015, 1.0) * math.exp(-75 * t)
            value = round(32767 * amplitude * envelope
                          * math.sin(2 * math.pi * frequency * t))
            index = 2 * (start + offset)
            samples[index] = value
            samples[index + 1] = value
    if sys.byteorder != "little":
        samples.byteswap()
    with wave.open(str(path), "wb") as output:
        output.setparams((2, 2, RATE, 0, "NONE", "not compressed"))
        output.writeframes(samples.tobytes())


def main():
    out = HERE / "out"
    out.mkdir(exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="c052-c059-") as temporary:
        work = Path(temporary)
        # El render común conserva PDF y MIDI junto al .ly.
        run("bash", ROOT / "render_wav.sh", HERE / f"{BASE}.ly", work)
        count_in = work / "claqueta.wav"
        write_count_in(count_in)
        # El MIDI ya incluye mi–fa al final del 51 y el 52 a los 2 s.
        # Mezclar sin desplazarlo ni añadir otro compás de preparación.
        mixed = work / "mezcla.wav"
        run("sox", "-m", work / f"{BASE}.wav", count_in,
            "-b", "16", mixed, "gain", "-n", "-3")
        run("sox", mixed, out / f"{BASE}.wav")
    # El camino PDF reutiliza el WAV final y no elimina la claqueta.
    run("bash", ROOT / "render_mp4.sh", HERE / f"{BASE}.pdf")


if __name__ == "__main__":
    main()
