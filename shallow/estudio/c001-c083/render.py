#!/usr/bin/env python3
"""Regenera las ediciones de estudio de los violines con el audio existente."""

from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import sys
from tempfile import TemporaryDirectory

FOLDER = Path(__file__).resolve().parent
ROOT = FOLDER.parents[2]
sys.path.insert(0, str(ROOT))

from render_compas_activo import midi_events, render_video, run

SOURCE = FOLDER / "shallow-estudio.ly"
PARTS = ("violin-i", "violin-ii")
BOOKS = (*PARTS, "cuarteto")
PLAYBACK = [(bar, 4 * bar) for bar in range(84)] + [(None, 336)]


def audio_hash(path):
    return run("ffmpeg", "-nostdin", "-v", "error", "-i", path, "-map", "0:a:0",
               "-c", "copy", "-f", "hash", "-hash", "sha256", "-")


def render_book(book, stage):
    score = stage / f"shallow-estudio-{book}"
    if book == "cuarteto":
        out = FOLDER.parents[1] / "out"
        originals = [out / f"shallow-vpo-solo-{part}.mp4" for part in PARTS]
        audio = originals[0]
    else:
        out = FOLDER / "out"
        originals = [out / f"{score.name}{suffix}.mp4"
                     for suffix in ("", "-str-vi-vpo", "-vpo", "-vpo-conjunto")]
        audio = out / f"{score.name}-vpo.wav"
    picture = stage / f"imagen-{book}.mp4"
    render_video("shallow", SOURCE, score.with_suffix(".pdf"), score.with_suffix(".midi"),
                 audio, picture, playback=PLAYBACK, book=book,
                 staves=4 if book == "cuarteto" else 1)

    outputs = [score.with_suffix(".pdf")]
    for original in originals:
        updated = stage / original.name
        run("ffmpeg", "-nostdin", "-v", "error", "-i", picture, "-i", original,
            "-map", "0:v:0", "-map", "1:a:0", "-c", "copy", "-movflags", "+faststart", updated)
        if audio_hash(updated) != audio_hash(original):
            raise ValueError(f"La pista de audio ha cambiado en {original.name}")
        outputs.append(updated)
    return {item: FOLDER / item.name if item.suffix == ".pdf" else out / item.name
            for item in outputs}


def main():
    with TemporaryDirectory(prefix=".shallow-render-", dir=FOLDER) as temp:
        stage = Path(temp)
        run("lilypond", "-o", stage / "shallow-estudio", SOURCE)
        unmarked = stage / "referencia.ly"
        unmarked.write_text(
            SOURCE.read_text().replace("../../shallow-musica.ly", str(FOLDER.parents[1] / "shallow-musica.ly"))
            .replace('\\include "shallow-digitaciones.ily"', "")
            .replace(r"\violinUnoEstudio", r"\violinUno")
            .replace(r"\violinDosEstudio", r"\violinDos")
        )
        run("lilypond", "-dno-print-pages", "-o", stage / "referencia", unmarked)
        for book in BOOKS:
            actual = midi_events(stage / f"shallow-estudio-{book}.midi")
            expected = midi_events(stage / f"referencia-{book}.midi")
            if actual != expected or actual[1] != [(0, 625_000)]:
                raise ValueError(f"Notas, eventos o tempo inesperados en {book}")

        with ThreadPoolExecutor(max_workers=len(BOOKS)) as pool:
            outputs = list(pool.map(lambda book: render_book(book, stage), BOOKS))
        for edition in outputs:
            for staged, destination in edition.items():
                staged.replace(destination)


if __name__ == "__main__":
    main()
