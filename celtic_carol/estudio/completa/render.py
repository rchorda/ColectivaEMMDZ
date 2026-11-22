#!/usr/bin/env python3
"""Regenera la edición completa de Celtic Carol a 60, 90 o 120."""

import argparse
from fractions import Fraction
from pathlib import Path
import re
from runpy import run_path
import subprocess
import sys
import tempfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
REFERENCE = HERE / "celtic-carol-estudio-120.ly"
ORIGINAL = HERE.parents[1] / "celtic_carol.midi"
TEMPOS = (60, 90, 120)
START_TEMPO = re.compile(r'(\\tempo "[^"]+" 4\. = )(\d+)')
HIDDEN_TEMPO = re.compile(r'\\tempo 4\. = (\d+)')

helpers = run_path(str(HERE.parent / "render_tempos.py"))
count_in = helpers["count_in"]
midi_events = helpers["midi_events"]
run = helpers["run"]


def variant_source(source, bpm):
    ratio = Fraction(bpm, 120)
    source = source.replace("negra con puntillo = 120", f"negra con puntillo = {bpm}")
    source = START_TEMPO.sub(lambda m: m[1] + str(int(int(m[2]) * ratio)), source)

    def hidden_tempo(match):
        rate = int(match[1]) * ratio * Fraction(3, 8)
        return (r"\set Score.tempoWholesPerMinute = "
                f"#(ly:make-moment {rate.numerator} {rate.denominator})")

    return HIDDEN_TEMPO.sub(hidden_tempo, source)


def precision_tempos(path, bpm, reference):
    """Corrige la cuantización de LilyPond y compara los eventos con la obra."""
    data = path.read_bytes()
    events, tempos = midi_events(path)
    original_events, original_tempos = midi_events(ORIGINAL)
    expected_events = [(at + 6, status, payload) for at, status, payload in original_events]
    if events != expected_events:
        raise ValueError(f"Eventos musicales distintos en {path.name}")

    original_pulses = [int(m[2]) for m in START_TEMPO.finditer(reference)]
    original_pulses += [int(m[1]) for m in HIDDEN_TEMPO.finditer(reference)][1:]
    positions = [0, *(at + 6 for at, _ in original_tempos[1:])]
    if [at for at, _ in tempos] != positions or len(original_pulses) != len(tempos):
        raise ValueError(f"Mapa de tempos inesperado en {path.name}: {tempos}")

    expected_tempos = [(at, round(Fraction(40_000_000 * 120, pulse * bpm)))
                       for at, pulse in zip(positions, original_pulses)]
    cursor = iter(expected_tempos)
    updated, count = re.subn(
        rb"\xff\x51\x03.{3}",
        lambda _: b"\xff\x51\x03" + next(cursor)[1].to_bytes(3, "big"),
        data, flags=re.S,
    )
    if count != len(tempos):
        raise ValueError(f"No se localizaron todos los tempos en {path.name}")
    path.write_bytes(updated)
    if midi_events(path) != (expected_events, expected_tempos):
        raise ValueError(f"Error al ajustar la precisión MIDI de {path.name}")
    return expected_tempos


def render(bpm):
    reference = REFERENCE.read_text()
    base = HERE / f"celtic-carol-estudio-{bpm}"
    source = base.with_suffix(".ly")
    if source != REFERENCE:
        source.write_text(variant_source(reference, bpm))
    log = subprocess.check_output(["lilypond", "-o", base, source],
                                  stderr=subprocess.STDOUT, text=True)
    if "warning:" in log.lower():
        raise ValueError(log)
    pdf, midi, wav = (base.with_suffix(suffix) for suffix in (".pdf", ".midi", ".wav"))
    precision_tempos(midi, bpm, reference)
    info = subprocess.check_output(["pdfinfo", pdf], text=True)
    if not re.search(r"^Pages:\s+3\s*$", info, re.M):
        raise ValueError("La partitura debe tener tres páginas para el pase de hojas")
    with tempfile.TemporaryDirectory(prefix=f"celtic-carol-{bpm}-") as temp:
        work = Path(temp)
        run("bash", ROOT / "render_wav.sh", midi, work)
        click = work / "claqueta.wav"
        count_in(click, bpm, 12)
        run("sox", "-m", work / wav.name, click, "-b", "16", wav, "gain", "-n", "-3")
    run(sys.executable, ROOT / "render_compas_activo.py", "celtic-carol", str(bpm))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bpm", type=int, nargs="*", metavar="BPM")
    args = parser.parse_args()
    if set(args.bpm).difference(TEMPOS):
        parser.error("Tempos disponibles: 60 90 120")
    for bpm in dict.fromkeys(args.bpm or TEMPOS):
        render(bpm)
