#!/usr/bin/env python3
"""Regenera los vídeos a tempos alternativos de los segmentos de Verano."""

import argparse
import json
from pathlib import Path
import re
from runpy import run_path
import shutil
import sys
import tempfile

from preparar_escalas import HERE, ROOT, check_click, click, run

midi_events = run_path(str(ROOT / 'celtic_carol/estudio/render_tempos.py'))['midi_events']


def render(name, source_bpm, bpm, suffix):
    folder = HERE / name
    source = (folder / f'{name}.ly').read_text()
    pattern = rf'(\\tempo\s+"Presto"\s+4\s*=\s*){source_bpm}\b'
    source, count = re.subn(pattern, lambda match: f'{match[1]}{bpm}', source)
    if count != 1:
        raise ValueError(f'El tempo de {name} no coincide con el manifiesto')
    source = source.replace(f'negra = {source_bpm} y dinámica', f'negra = {bpm} y dinámica')
    original, _ = midi_events(folder / f'{name}.midi')
    stem = f'{name}{suffix}'

    with tempfile.TemporaryDirectory(prefix=f'{stem}-') as temp:
        work = Path(temp)
        ly = work / f'{stem}.ly'
        ly.write_text(source)
        log = run('lilypond', '-I', work, '-o', work / stem, ly)
        if 'warning:' in log.lower():
            raise ValueError(f'Advertencia LilyPond en {stem}: {log}')

        midi = work / f'{stem}.midi'
        events, tempos = midi_events(midi)
        if events != original:
            raise ValueError(f'Eventos musicales distintos en {stem}')
        if len(tempos) != 1 or tempos[0][0] != 0 or abs(tempos[0][1] - 60_000_000 / bpm) > 1:
            raise ValueError(f'Tempo MIDI incorrecto en {stem}: {tempos}')

        pdf = work / f'{stem}.pdf'
        if not re.search(r'^Pages:\s+1\s*$', run('pdfinfo', pdf), re.M):
            raise ValueError(f'{stem} no tiene una página')
        clickfile = work / 'claqueta.wav'
        click(clickfile, bpm)
        run('bash', ROOT / 'render_wav.sh', midi, work)
        wav = work / f'{stem}.wav'
        mix = work / 'mezcla.wav'
        run('sox', '-m', wav, clickfile, '-b', '16', mix, 'gain', '-n', '-3')
        mix.replace(wav)
        check_click(wav, bpm)
        video = work / f'{stem}.mp4'
        run(sys.executable, ROOT / 'render_compas_activo.py', 'verano', '--segmento', ly, pdf, midi, wav, video)
        media = json.loads(run('ffprobe', '-v', 'error', '-show_entries',
                               'stream=codec_type:format=duration', '-of', 'json', video))
        if {stream['codec_type'] for stream in media['streams']} != {'audio', 'video'}:
            raise ValueError(f'Faltan pistas en {stem}')
        shutil.copy2(ly, folder / ly.name)
        shutil.copy2(pdf, folder / pdf.name)
        shutil.copy2(video, folder / 'out' / video.name)
        print(f'{stem}: negra = {bpm}, {len(events)} eventos MIDI coincidentes, '
              f'12 golpes de claqueta, MP4 {media["format"]["duration"]} s', flush=True)


def main():
    manifest = json.loads((HERE / 'segments.json').read_text())
    segments = {entry['id']: entry for entry in manifest['segments']}
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('segments', nargs='*', metavar='SEGMENTO')
    args = parser.parse_args()
    for name in args.segments:
        if name not in segments:
            parser.error(f'Segmento desconocido: {name}')
    for name in dict.fromkeys(args.segments or segments):
        entry = segments[name]
        source_bpm = entry['tempo']['bpm']
        for video in entry['videos']:
            if video.get('suffix'):
                bpm = round(source_bpm * video['ratio'])
                render(name, source_bpm, bpm, video['suffix'])


if __name__ == '__main__':
    main()
