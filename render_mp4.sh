#!/usr/bin/env bash
set -euo pipefail

DEFAULT_SF2="/Users/usuario/DocuLocal/Casa/ColectivaEMMDZ/Violin STR VI (5,353KB).sf2"

usage() {
  cat <<'EOF'
Uso:
  render_mp4.sh <archivo.ly|archivo.pdf> [outdir] [sf2_path] [T]

T puede ser:
  (vacío)     -> AUTO: T_por_hoja = duracion_wav / num_hojas
  6           -> 6 segundos por hoja (todas iguales)
  4,5,7.25    -> array: un tiempo por hoja (num elementos == num_hojas)

Ejemplos:
  ./render_mp4.sh pieza.ly
  ./render_mp4.sh pieza.ly out "/ruta/Violin STR VI (5,353KB).sf2"
  ./render_mp4.sh pieza.ly out "/ruta/Violin STR VI (5,353KB).sf2" 6
  ./render_mp4.sh pieza.ly out "/ruta/Violin STR VI (5,353KB).sf2" 4,5,7.25
  ./render_mp4.sh pieza.pdf out "" 5

Salida:
  outdir/<base>.mp4
EOF
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Falta '$1'. Instala con: brew install $2" >&2
    exit 1
  }
}

escape_for_ffconcat() {
  # Escapa comillas simples para archivos concat de ffmpeg:  ' -> '\''
  printf "%s" "$1" | sed "s/'/'\\\\''/g"
}

get_wav_duration() {
  local wav="$1"
  if command -v soxi >/dev/null 2>&1; then
    soxi -D "$wav"
  else
    ffprobe -v error -show_entries format=duration -of default=nk=1:nw=1 "$wav"
  fi
}

is_number() {
  echo "$1" | grep -E '^[0-9]+([.][0-9]+)?$' >/dev/null 2>&1
}

if [[ $# -lt 1 || "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

INPUT="$1"
OUTDIR="${2:-out}"
SF2="${3:-$DEFAULT_SF2}"
T_SPEC="${4:-}"   # vacío => AUTO

if [[ ! -f "$INPUT" ]]; then
  echo "No existe el archivo de entrada: $INPUT" >&2
  exit 1
fi

need_cmd ffmpeg "ffmpeg"
need_cmd ffprobe "ffmpeg"
need_cmd magick "imagemagick"
need_cmd gs "ghostscript"

mkdir -p "$OUTDIR"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WAV_SCRIPT="$SCRIPT_DIR/render_wav.sh"

FILENAME="$(basename "$INPUT")"
EXT="${FILENAME##*.}"
BASE="${FILENAME%.*}"

PDF=""
MIDI=""
WAV="$OUTDIR/$BASE.wav"
MP4="$OUTDIR/$BASE.mp4"
CONCAT="$OUTDIR/${BASE}_images.concat.txt"

if [[ "$EXT" == "ly" ]]; then
  need_cmd lilypond "lilypond"

  if [[ ! -x "$WAV_SCRIPT" ]]; then
    echo "No encuentro ejecutable $WAV_SCRIPT (debe estar junto a render_mp4.sh y ser ejecutable)." >&2
    echo "Haz: chmod +x render_wav.sh" >&2
    exit 1
  fi
  if [[ ! -f "$SF2" ]]; then
    echo "No existe el SoundFont SF2: $SF2" >&2
    exit 1
  fi

  echo ">> Compilando LilyPond: $INPUT"
  lilypond -o "$OUTDIR/$BASE" "$INPUT"

  PDF="$OUTDIR/$BASE.pdf"
  if [[ -f "$OUTDIR/$BASE.midi" ]]; then
    MIDI="$OUTDIR/$BASE.midi"
  elif [[ -f "$OUTDIR/$BASE.mid" ]]; then
    MIDI="$OUTDIR/$BASE.mid"
  else
    echo "No encontré MIDI en $OUTDIR para base '$BASE'." >&2
    exit 1
  fi

  echo ">> Generando WAV desde MIDI..."
  "$WAV_SCRIPT" "$MIDI" "$OUTDIR" "$SF2"

elif [[ "$EXT" == "pdf" ]]; then
  PDF="$INPUT"
  if [[ -f "$OUTDIR/$BASE.wav" ]]; then
    WAV="$OUTDIR/$BASE.wav"
  elif [[ -f "$(dirname "$INPUT")/$BASE.wav" ]]; then
    WAV="$(dirname "$INPUT")/$BASE.wav"
  else
    echo "Me diste un PDF pero no encuentro el WAV correspondiente ($BASE.wav)." >&2
    echo "Genera primero WAV con render_wav.sh o usa la vía .ly." >&2
    exit 1
  fi
else
  echo "Extensión no soportada: .$EXT (usa .ly o .pdf)" >&2
  exit 1
fi

if [[ ! -s "$WAV" ]]; then
  echo "WAV inexistente o vacío: $WAV" >&2
  exit 1
fi
if [[ ! -f "$PDF" ]]; then
  echo "PDF no encontrado: $PDF" >&2
  exit 1
fi

# 1) PDF -> PNGs (multipágina)
rm -f "$OUTDIR/${BASE}_"*.png

echo ">> PDF → PNGs (multipágina)..."
magick -density 200 "$PDF" -quality 95 "$OUTDIR/${BASE}_%03d.png"

# Lista de páginas (bash 3.2 compatible)
PAGES=()
while IFS= read -r line; do
  PAGES+=("$(basename "$line")")
done < <(ls -1 "$OUTDIR/${BASE}_"*.png 2>/dev/null | sort)

PAGE_COUNT="${#PAGES[@]}"
if [[ "$PAGE_COUNT" -lt 1 ]]; then
  echo "No se generaron PNGs desde el PDF. Revisa ImageMagick/Ghostscript." >&2
  exit 1
fi

WAV_DUR="$(get_wav_duration "$WAV")"
echo ">> Hojas: $PAGE_COUNT | Duración WAV: ${WAV_DUR}s"

# 2) Duraciones por hoja (AUTO / fijo / array)
DURATIONS=()

if [[ -z "$T_SPEC" ]]; then
  PER="$(LC_ALL=C awk -v d="$WAV_DUR" -v n="$PAGE_COUNT" 'BEGIN{ if(n<=0){print 0}else{printf "%.6f", d/n} }')"
  i=0
  while [[ $i -lt $PAGE_COUNT ]]; do
    DURATIONS+=("$PER")
    i=$((i+1))
  done
  echo ">> Modo: AUTO  (T_por_hoja = ${PER}s)"
else
  if echo "$T_SPEC" | grep -q ","; then
    # array
    OLDIFS="$IFS"
    IFS=',' read -r -a DURATIONS <<< "$T_SPEC"
    IFS="$OLDIFS"

    if [[ "${#DURATIONS[@]}" -ne "$PAGE_COUNT" ]]; then
      echo "T array debe tener exactamente $PAGE_COUNT valores (uno por hoja)." >&2
      echo "Recibí ${#DURATIONS[@]} valores: $T_SPEC" >&2
      exit 1
    fi

    for t in "${DURATIONS[@]}"; do
      t_trim="$(echo "$t" | sed 's/^ *//; s/ *$//')"
      if ! is_number "$t_trim"; then
        echo "Valor de tiempo inválido en array: '$t'" >&2
        exit 1
      fi
    done
    echo ">> Modo: ARRAY (tiempos por hoja: $T_SPEC)"
  else
    # fijo
    if ! is_number "$T_SPEC"; then
      echo "T inválido: '$T_SPEC' (usa 6 o 4,5,7.25 o vacío para AUTO)" >&2
      exit 1
    fi
    i=0
    while [[ $i -lt $PAGE_COUNT ]]; do
      DURATIONS+=("$T_SPEC")
      i=$((i+1))
    done
    echo ">> Modo: FIJO  (T_por_hoja = ${T_SPEC}s)"
  fi
fi

# 3) Concat file (duración por hoja)
rm -f "$CONCAT"
touch "$CONCAT"

i=0
while [[ $i -lt $PAGE_COUNT ]]; do
  p="${PAGES[$i]}"
  p_esc="$(escape_for_ffconcat "$p")"
  echo "file '$p_esc'" >> "$CONCAT"
  dur="${DURATIONS[$i]}"
  dur="$(echo "$dur" | sed 's/,/./g')"   # decimal con punto para ffmpeg
  echo "duration $dur" >> "$CONCAT"
  i=$((i+1))
done

# Repite la última imagen para aplicar su duración
last="${PAGES[$((PAGE_COUNT-1))]}"
last_esc="$(escape_for_ffconcat "$last")"
echo "file '$last_esc'" >> "$CONCAT"

# 4) MP4
rm -f "$MP4"
echo ">> Creando MP4 con pase de hojas..."

if ffmpeg -y -f concat -safe 0 -i "$CONCAT" -i "$WAV" \
  -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" \
  -c:v libx264 -pix_fmt yuv420p -r 30 \
  -c:a aac -b:a 192k -shortest -movflags +faststart "$MP4"
then
  :
else
  echo ">> libx264 falló; probando h264_videotoolbox..."
  rm -f "$MP4"
  ffmpeg -y -f concat -safe 0 -i "$CONCAT" -i "$WAV" \
    -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" \
    -c:v h264_videotoolbox -b:v 4000k -pix_fmt yuv420p -r 30 \
    -c:a aac -b:a 192k -shortest -movflags +faststart "$MP4"
fi

echo "OK -> $MP4"
