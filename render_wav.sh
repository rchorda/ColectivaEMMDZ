#!/usr/bin/env bash
set -euo pipefail

# --- Config: tu SoundFont SF2 (tal cual la indicaste) ---
DEFAULT_SF2="/Users/usuario/DocuLocal/Casa/ColectivaEMMDZ/Violin STR VI (5,353KB).sf2"

usage() {
  cat <<'EOF'
Uso:
  render_wav.sh <archivo.ly|archivo.mid|archivo.midi> [outdir] [sf2_path]

Ejemplos:
  ./render_wav.sh pieza.ly
  ./render_wav.sh pieza.midi out
  ./render_wav.sh pieza.ly out "/ruta/a/otro.sf2"

Salida:
  outdir/<base>.wav
EOF
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Falta '$1'. Instala con: brew install $2" >&2
    exit 1
  }
}

if [[ $# -lt 1 || "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

INPUT="$1"
OUTDIR="${2:-out}"
SF2="${3:-$DEFAULT_SF2}"

if [[ ! -f "$INPUT" ]]; then
  echo "No existe el archivo de entrada: $INPUT" >&2
  exit 1
fi

if [[ ! -f "$SF2" ]]; then
  echo "No existe el SoundFont SF2: $SF2" >&2
  echo "Pásalo como 3er argumento si la ruta cambió." >&2
  exit 1
fi

need_cmd fluidsynth "fluid-synth"
need_cmd sox "sox"

mkdir -p "$OUTDIR"

# Determina base (sin extensión) y extensión
FILENAME="$(basename "$INPUT")"
EXT="${FILENAME##*.}"
BASE="${FILENAME%.*}"

MIDI=""

# Si es .ly, compila con LilyPond al OUTDIR
if [[ "$EXT" == "ly" ]]; then
  need_cmd lilypond "lilypond"
  echo ">> Compilando LilyPond: $INPUT"
  lilypond -o "$OUTDIR/$BASE" "$INPUT"

  # LilyPond suele generar .midi (a veces .mid)
  if [[ -f "$OUTDIR/$BASE.midi" ]]; then
    MIDI="$OUTDIR/$BASE.midi"
  elif [[ -f "$OUTDIR/$BASE.mid" ]]; then
    MIDI="$OUTDIR/$BASE.mid"
  else
    echo "No encontré MIDI generado en $OUTDIR para base '$BASE'." >&2
    exit 1
  fi
elif [[ "$EXT" == "midi" || "$EXT" == "mid" ]]; then
  MIDI="$INPUT"
else
  echo "Extensión no soportada: .$EXT (usa .ly, .mid o .midi)" >&2
  exit 1
fi

WAV="$OUTDIR/$BASE.wav"
RAW="$OUTDIR/$BASE.raw"

echo ">> MIDI → WAV usando SoundFont:"
echo "   SF2:  $SF2"
echo "   MIDI: $MIDI"
echo "   WAV:  $WAV"

# Intento 1: salida WAV directa
set +e
fluidsynth -ni -T wav -F "$WAV" "$SF2" "$MIDI" >/dev/null 2>&1
FS_RC=$?
set -e

# Valida cabecera RIFF (WAV)
is_wav=0
if [[ -f "$WAV" ]]; then
  head4="$(dd if="$WAV" bs=1 count=4 2>/dev/null || true)"
  if [[ "$head4" == "RIFF" ]]; then
    is_wav=1
  fi
fi

if [[ $FS_RC -ne 0 || $is_wav -ne 1 ]]; then
  echo ">> El modo WAV directo no funcionó (o no generó WAV válido). Usando fallback RAW → WAV..."
  rm -f "$WAV"

  # Fallback: fluidsynth a RAW + sox lo envuelve en WAV
  fluidsynth -ni -F "$RAW" "$SF2" "$MIDI" >/dev/null 2>&1

  # Ajustes típicos: 44.1kHz, 16-bit, signed, stereo
  sox -t raw -r 44100 -e signed -b 16 -c 2 "$RAW" "$WAV"
  rm -f "$RAW"
fi

echo "OK -> $WAV"
