#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/render_lib.sh"

render_mp4_usage() {
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
  ./render_mp4.sh celtic_carol/celtic_carol.ly
  ./render_mp4.sh celtic_carol/celtic_carol.ly "" "/ruta/otro.sf2" 20,40
  ./render_mp4.sh celtic_carol/celtic_carol.pdf "" "" 10
  ./render_mp4.sh celtic_carol/celtic_carol.ly /tmp/video

Salida:
  <carpeta de la partitura>/out/<base>.mp4 por defecto, junto al WAV.
  PDF y MIDI compilados junto al .ly. Un outdir explícito es relativo al cwd.
  Si la entrada ya está en out/, se reutiliza ese directorio.
EOF
}

if [[ $# -lt 1 || "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  render_mp4_usage
  exit 0
fi

INPUT="$1"
OUTDIR="${2:-}"
SF2="${3:-$RENDER_DEFAULT_SF2}"
T_SPEC="${4:-}"   # vacío => AUTO

render_mp4 "$INPUT" "$OUTDIR" "$SF2" "$T_SPEC"
