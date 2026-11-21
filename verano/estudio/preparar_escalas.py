#!/usr/bin/env python3
"""Copia controlada de seis pasajes concretos de verano.ly; no es extractor universal.
Compila los ejercicios y mezcla una claqueta de 3/4 subdividida en semicorcheas.
"""
from pathlib import Path
from array import array
import json, math, re, subprocess, tempfile, wave

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]
SOURCE=HERE.parent/'verano.ly'
RANGES=[(10,19),(21,28),(38,40),(64,66),(101,108),(113,114)]
RATE=44100
PULSOS = 3
SUBDIVISIONES = 4
GOLPE = 0.05

def run(*cmd):
 p=subprocess.run([str(c) for c in cmd],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
 if p.returncode: raise RuntimeError(' '.join(map(str,cmd))+'\n'+p.stdout[-6000:])
 return p.stdout

def click(path, bpm):
    step = 60 / bpm / SUBDIVISIONES
    samples = array('h', [0]) * (round(PULSOS * 60 / bpm * RATE) * 2)
    for index in range(PULSOS * SUBDIVISIONES):
        start = round(index * step * RATE)
        if index == 0:
            amplitude, frequency = .36, 1600
        elif index % SUBDIVISIONES == 0:
            amplitude, frequency = .28, 1350
        else:
            amplitude, frequency = .15, 1050
        for offset in range(round(GOLPE * RATE)):
            time = offset / RATE
            envelope = min(time / .0015, 1) * math.exp(-80 * time)
            sample = round(32767 * amplitude * envelope * math.sin(2 * math.pi * frequency * time))
            samples[2 * (start + offset)] = samples[2 * (start + offset) + 1] = sample
    with wave.open(str(path), 'wb') as output:
        output.setparams((2, 2, RATE, 0, 'NONE', 'not compressed'))
        output.writeframes(samples.tobytes())


def check_click(path, bpm):
    """Comprueba los 12 golpes y los acentos en el WAV mezclado."""
    with wave.open(str(path), 'rb') as audio:
        rate = audio.getframerate()
        channels = audio.getnchannels()
        step = rate * 60 / bpm / SUBDIVISIONES
        samples = array('h', audio.readframes(round(PULSOS * SUBDIVISIONES * step)))
    peaks = []
    for index in range(PULSOS * SUBDIVISIONES):
        start = round(index * step)
        end = start + round(GOLPE * rate)
        next_start = round((index + 1) * step)
        peaks.append(max(map(abs, samples[start * channels:end * channels])))
        gap = samples[end * channels:next_start * channels]
        if max(map(abs, gap)) > peaks[-1] * .15:
            raise ValueError(f'{path}: señal inesperada tras el golpe {index + 1}')
    strong = peaks[::SUBDIVISIONES]
    weak = [value for index, value in enumerate(peaks) if index % SUBDIVISIONES]
    if min(weak) < 1000 or min(strong) <= max(weak) or strong[0] <= max(strong[1:]):
        raise ValueError(f'{path}: subdivisión o acentos de claqueta incorrectos: {peaks}')

def main():
 original=SOURCE.read_text()
 tempo=re.search(r'\\tempo\s+"Presto"\s+4\s*=\s*(\d+)',original)
 if tempo is None: raise ValueError('No se encontró el tempo de Verano')
 bpm=int(tempo[1])
 lines=original.splitlines()
 bars={}
 for line in lines:
  match=re.search(r'\|\s*(?:\\break\s*)?%\s*(\d+)\s*$',line)
  if match:
   number=int(match.group(1))
   if number in bars: raise ValueError(f'Compás duplicado {number}')
   bars[number]=line
 for a,b in RANGES:
  if any(n not in bars for n in range(a,b+1)): raise ValueError(f'Compases no identificados en {a}–{b}')
  if any('R2.' in bars[n] or '\\repeat' in bars[n] for n in range(a,b+1)): raise ValueError('Revisión musical adicional necesaria')
 # Marcas editoriales en una copia independiente de la partitura íntegra.
 marked=original
 for a,b in RANGES:
  old=bars[a]
  assert marked.count(old)==1
  marked=marked.replace(old,f'  \\mark \\markup \\box "Estudio {a}-{b}"\n'+old,1)
 marked=marked.replace('title = "Verano"','title = "Verano — pasajes de estudio"',1)
 (HERE/'verano_pasajes_marcados.ly').write_text(marked)
 run('lilypond','-o',HERE/'verano_pasajes_marcados',HERE/'verano_pasajes_marcados.ly')
 with tempfile.TemporaryDirectory(prefix='verano-estudio-') as tmp:
  tmp=Path(tmp); clickfile=tmp/'claqueta.wav'; click(clickfile,bpm)
  for a,b in RANGES:
   base=f'c{a:03d}-c{b:03d}'; folder=HERE/base; out=folder/'out'; out.mkdir(parents=True,exist_ok=True)
   notes=[]
   for n in range(a,b+1):
    line=bars[n]
    line=re.sub(r'\\(?:pageBreak|break)\b','',line)
    notes.append(line)
   src=f'''\\version "2.24.0"
\\language "espanol"
% Fuente: ../../verano.ly; voz única de violín; intervalo [{a},{b+1}).
% Copia controlada: regenerar los medios NO actualiza las notas desde la obra.
% Clave de sol, si bemol mayor, 3/4, negra = {bpm} y dinámica f.
% Entrada: 12 golpes de semicorchea en 3/4 sobre un compás de silencio MIDI.
% Una pasada. Los extremos han sido revisados para no añadir notas de otros compases.
% Regenerar desde la raíz: python3 verano/estudio/preparar_escalas.py
\\header {{ title = "Verano" subtitle = "Estudio · compases {a}–{b}" tagline = ##f }}
#(set-global-staff-size 17)
\\paper {{ #(set-paper-size "a5landscape") page-count = 1 indent = 0\\mm ragged-last = ##f }}
\\score {{
  \\new Staff \\with {{ midiInstrument = "violin" }} \\absolute {{
    \\clef treble \\key sib \\major \\time 3/4 \\tempo "Presto" 4 = {bpm}
    \\set Score.currentBarNumber = #{a-1}
    \\once \\omit Score.BarNumber
    R2.^\\markup {{ \\small \\bold "Entrada · claqueta en semicorcheas" }}
    \\bar "||"
    \\set Score.currentBarNumber = #{a}
    \\override Score.BarNumber.break-visibility = ##(#t #t #t)
    \\set Score.barNumberVisibility = #all-bar-numbers-visible
    \\dynamicUp
'''+ '\n'.join(notes)+'''\n    \\once \\omit Score.BarNumber
    \\bar "|."
  }
  \\layout {} \\midi {}
}
'''
   # Si el primer compás no declara dinámica, restaurar la vigente.
   if not re.search(r'\\(?:f|p|mf|ff|mp)\b',notes[0]):
    first=notes[0]
    # La indicación se aplica al primer evento de nota o silencio, no a una directiva.
    modified=re.sub(r'((?:sol|do|re|mi|fa|la|si|r)(?:es|is|b|s)?[\',]*\d*)',r'\1\\f',first,count=1)
    src=src.replace(first,modified,1)
   ly=folder/(base+'.ly'); ly.write_text(src)
   log=run('lilypond','-I',folder,'-o',folder/base,ly)
   (folder/'compilacion.log').write_text(log)
   info=run('pdfinfo',folder/(base+'.pdf'))
   pages=int(re.search(r'^Pages:\s+(\d+)',info,re.M).group(1))
   if pages!=1: raise ValueError(f'{base}: {pages} páginas; necesita tiempos por página')
   run('bash',ROOT/'render_wav.sh',folder/(base+'.midi'),tmp)
   run('sox','-m',tmp/(base+'.wav'),clickfile,'-b','16',out/(base+'.wav'),'gain','-n','-3')
   check_click(out/(base+'.wav'),bpm)
   run('bash',ROOT/'render_mp4.sh',folder/(base+'.pdf'))
   meta=json.loads(run('ffprobe','-v','error','-show_entries','stream=codec_type,duration:format=duration','-of','json',out/(base+'.mp4')))
   assert {s['codec_type'] for s in meta['streams']}=={'audio','video'}
   print(base,'PDF 1 página; MP4',meta['format']['duration'],'s',flush=True)
if __name__=='__main__': main()
