#!/usr/bin/env python3
"""Genera vídeos de Verano al 50 % y 75 %, con tempo impreso y claqueta.

Usa fuentes temporales, compara eventos musicales contra el MIDI de referencia y
no modifica las partituras, los MIDI ni los WAV originales de los segmentos.
"""
from pathlib import Path
import argparse, importlib.util, json, re, shutil, subprocess, tempfile

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]

def load(name,path):
 spec=importlib.util.spec_from_file_location(name,path)
 module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
 return module

music=load('midi_tools',ROOT/'celtic_carol/estudio/render_tempos.py')
base=load('verano_base',HERE/'preparar_escalas.py')

def run(*cmd):
 result=subprocess.run([str(c) for c in cmd],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
 if result.returncode:raise RuntimeError(' '.join(map(str,cmd))+'\n'+result.stdout[-4000:])
 return result.stdout

def render(name,ratio,bpm,suffix):
 folder=HERE/name; source=(folder/(name+'.ly')).read_text()
 pattern=r'(\\tempo\s+"Presto"\s+4\s*=\s*)160\b'
 source,count=re.subn(pattern,lambda m:m.group(1).replace('Presto','Estudio')+str(bpm),source)
 if count!=1:raise ValueError(f'Tempo no localizado de forma única en {name}')
 source=source.replace(' tagline = ##f',f' subsubtitle = "Tempo de estudio: {round(ratio*100)} % del original" tagline = ##f',1)
 original,_=music.midi_events(folder/(name+'.midi'))
 output=folder/'out'/f'{name}_{suffix}.mp4'
 with tempfile.TemporaryDirectory(prefix=f'{name}-{suffix}-') as temp:
  work=Path(temp);stem=f'{name}_{suffix}';ly=work/(stem+'.ly');ly.write_text(source)
  log=run('lilypond','-I',work,'-o',work/stem,ly)
  if 'warning:' in log.lower():raise ValueError(f'Advertencia LilyPond en {stem}: {log}')
  midi=work/(stem+'.midi');events,tempos=music.midi_events(midi)
  if events!=original:raise ValueError(f'Eventos musicales distintos en {stem}')
  if len(tempos)!=1 or tempos[0][0]!=0 or abs(tempos[0][1]-60_000_000/bpm)>1:
   raise ValueError(f'Tempo MIDI incorrecto en {stem}: {tempos}')
  pdf=work/(stem+'.pdf')
  info=run('pdfinfo',pdf)
  if int(re.search(r'^Pages:\s+(\d+)',info,re.M).group(1))!=1:raise ValueError(f'{stem} no tiene una página')
  run('bash',ROOT/'render_wav.sh',midi,work)
  click=work/'claqueta.wav';base.click(click,bpm)
  wav=work/(stem+'.wav');mix=work/'mezcla.wav'
  run('sox','-m',wav,click,'-b','16',mix,'gain','-n','-3');mix.replace(wav)
  run('bash',ROOT/'render_mp4.sh',pdf,work)
  video=work/(stem+'.mp4')
  media=json.loads(run('ffprobe','-v','error','-show_entries','stream=codec_type:format=duration','-of','json',video))
  if {s['codec_type'] for s in media['streams']}!={'audio','video'}:raise ValueError('Faltan pistas en '+stem)
  # Comprobar presencia y duración de la claqueta tras la mezcla.
  import wave
  from array import array
  with wave.open(str(wav),'rb') as f:
   samples=array('h',f.readframes(round(3*60/bpm*f.getframerate())))
   rate=f.getframerate();channels=f.getnchannels()
  peaks=[max(abs(x) for x in samples[round((beat*60/bpm+.002)*rate)*channels:round((beat*60/bpm+.045)*rate)*channels]) for beat in range(3)]
  if min(peaks)<1000:raise ValueError(f'Claqueta insuficiente en {stem}: {peaks}')
  shutil.copy2(video,output)
  print(f'{stem}: negra={bpm}, {len(events)} eventos MIDI coincidentes, claqueta {3*60/bpm:.3f} s, MP4 {media["format"]["duration"]} s',flush=True)

def main():
 parser=argparse.ArgumentParser();parser.add_argument('segments',nargs='*');args=parser.parse_args()
 manifest=json.loads((HERE/'segments.json').read_text());available=[s['id'] for s in manifest['segments']]
 selected=args.segments or available
 if any(x not in available for x in selected):parser.error('Segmento desconocido')
 for name in dict.fromkeys(selected):
  for ratio,bpm,suffix in [(0.5,80,'t050'),(0.75,120,'t075')]:render(name,ratio,bpm,suffix)
if __name__=='__main__':main()
