#!/usr/bin/env bash
set -euo pipefail

# --- Locale fijo para evitar coma decimal (ffmpeg requiere punto) ---
export LC_ALL=C
export LANG=C

# --- Config: tu SoundFont SF2 ---
DEFAULT_SF2="/Users/usuario/DocuLocal/Casa/ColectivaEMMDZ/Violin STR VI (5,353KB).sf2"

usage() {
  cat <<'EOF'
Uso:
  render_mp4.sh <archivo.ly|archivo.pdf> [outdir] [sf2_path] [T]

T puede ser:
  (vacío)     -> AUTO: T_por_hoja = duracion_wav / num_hojas
  6           -> hoja 1 dura 6s; el resto del tiempo se reparte equitativamente entre hojas 2..N
  4,5         -> hojas 1 y 2 fijas; el resto del tiempo se reparte equitativamente entre hojas 3..N
  4,5,7.25    -> prefijo fijo de 3 hojas; el resto se reparte entre hojas restantes
  t1,t2,...,tN-> si das N valores (uno por hoja), se usan tal cual

Notas:
  - El separador de lista es coma. Para decimales usa punto: 4.5,6,7.25
  - Si la suma de tiempos fijos supera la duración del WAV => error.

Ejemplos:
  ./render_mp4.sh pieza.ly
  ./render_mp4.sh pieza.ly out "/ruta/Violin STR VI (5,353KB).sf2"
  ./render_mp4.sh pieza.ly out "/ruta/Violin STR VI (5,353KB).sf2" 6
  ./render_mp4.sh pieza.ly out "/ruta/Violin STR VI (5,353KB).sf2" 20,40
  ./render_mp4.sh pieza.pdf out "" 10

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

# ---------------------------
# 1) Generación de PDF+WAV
# ---------------------------
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
  # Para PDF directo necesitas WAV ya existente con el mismo base
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

# ---------------------------
# 2) PDF -> PNGs (multipágina)
# ---------------------------
rm -f "$OUTDIR/${BASE}_"*.png

echo ">> PDF → PNGs (multipágina)..."
magick -density 200 "$PDF" -quality 95 "$OUTDIR/${BASE}_%03d.png"

# Lista de páginas (guardamos SOLO el basename para evitar out/out)
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
# Normaliza por si acaso
WAV_DUR_C="$(LC_ALL=C printf "%.6f" "$WAV_DUR" 2>/dev/null || echo "$WAV_DUR")"

echo ">> Hojas: $PAGE_COUNT | Duración WAV: ${WAV_DUR_C}s"

# --------------------------------------------
# 3) Duraciones por hoja (reglas solicitadas)
# --------------------------------------------
DURATIONS=()

if [[ -z "$T_SPEC" ]]; then
  # AUTO: todas iguales
  PER="$(LC_ALL=C awk -v d="$WAV_DUR_C" -v n="$PAGE_COUNT" 'BEGIN{ if(n<=0){print 0}else{printf "%.6f", d/n} }')"
  i=0
  while [[ $i -lt $PAGE_COUNT ]]; do
    DURATIONS+=("$PER")
    i=$((i+1))
  done
  echo ">> Modo: AUTO  (T_por_hoja = ${PER}s)"
else
  # Prefijo fijo: 1 valor => hoja1 fija; 2 valores => hojas1-2 fijas; etc.
  FIXED=()
  if echo "$T_SPEC" | grep -q ","; then
    OLDIFS="$IFS"
    IFS=',' read -r -a FIXED <<< "$T_SPEC"
    IFS="$OLDIFS"
  else
    FIXED=("$T_SPEC")
  fi

  # Trim + valida
  k=0
  while [[ $k -lt "${#FIXED[@]}" ]]; do
    FIXED[$k]="$(echo "${FIXED[$k]}" | sed 's/^ *//; s/ *$//')"
    if ! is_number "${FIXED[$k]}"; then
      echo "Tiempo inválido: '${FIXED[$k]}' (usa punto decimal, ej 4.5)" >&2
      exit 1
    fi
    k=$((k+1))
  done

  if [[ "${#FIXED[@]}" -gt "$PAGE_COUNT" ]]; then
    echo "Demasiados tiempos: diste ${#FIXED[@]} pero hay $PAGE_COUNT hojas." >&2
    exit 1
  fi

  # Suma fijos
  SUM_FIXED="0.000000"
  k=0
  while [[ $k -lt "${#FIXED[@]}" ]]; do
    SUM_FIXED="$(LC_ALL=C awk -v a="$SUM_FIXED" -v b="${FIXED[$k]}" 'BEGIN{printf "%.6f", a+b}')"
    k=$((k+1))
  done

  if [[ "${#FIXED[@]}" -eq "$PAGE_COUNT" ]]; then
    # Caso: N valores => 1 por hoja
    k=0
    while [[ $k -lt "$PAGE_COUNT" ]]; do
      DURATIONS+=("$(LC_ALL=C printf "%.6f" "${FIXED[$k]}")")
      k=$((k+1))
    done
    echo ">> Modo: ARRAY completo (1 tiempo por hoja)"
  else
    # Caso: K valores => K hojas fijas + resto equitativo
    REMAIN="$(LC_ALL=C awk -v d="$WAV_DUR_C" -v s="$SUM_FIXED" 'BEGIN{printf "%.6f", d-s}')"
    NEG="$(LC_ALL=C awk -v r="$REMAIN" 'BEGIN{print (r < -0.0005) ? 1 : 0}')"
    if [[ "$NEG" -eq 1 ]]; then
      echo "Los tiempos fijos (${SUM_FIXED}s) superan la duración del WAV (${WAV_DUR_C}s)." >&2
      exit 1
    fi

    # Copia los fijos
    k=0
    while [[ $k -lt "${#FIXED[@]}" ]]; do
      DURATIONS+=("$(LC_ALL=C printf "%.6f" "${FIXED[$k]}")")
      k=$((k+1))
    done

    left=$((PAGE_COUNT - ${#FIXED[@]}))
    PER_REST="$(LC_ALL=C awk -v r="$REMAIN" -v n="$left" 'BEGIN{ if(n<=0){print 0}else{printf "%.6f", r/n} }')"

    i=0
    while [[ $i -lt "$left" ]]; do
      DURATIONS+=("$PER_REST")
      i=$((i+1))
    done

    echo ">> Modo: PREFIJO fijo (${#FIXED[@]} hojas) + resto equitativo"
    echo "   fijos: ${T_SPEC}"
    echo "   resto total: ${REMAIN}s -> ${left} hojas -> ${PER_REST}s/hoja"
  fi
fi

# ---------------------------
# 4) Archivo concat + MP4
# ---------------------------
rm -f "$CONCAT"
touch "$CONCAT"

i=0
while [[ $i -lt $PAGE_COUNT ]]; do
  p="${PAGES[$i]}"
  p_esc="$(escape_for_ffconcat "$p")"
  dur="${DURATIONS[$i]}"
  dur="$(echo "$dur" | sed 's/,/./g')"   # por si acaso
  echo "file '$p_esc'" >> "$CONCAT"
  echo "duration $dur" >> "$CONCAT"
  i=$((i+1))
done

# Repite última imagen para aplicar su duración final
last="${PAGES[$((PAGE_COUNT-1))]}"
last_esc="$(escape_for_ffconcat "$last")"
echo "file '$last_esc'" >> "$CONCAT"

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
