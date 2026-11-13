#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/render_lib.sh"

render_wav_usage() {
  cat <<'EOF'
Uso:
  render_wav.sh <archivo.ly|archivo.mid|archivo.midi> [outdir] [sf2_path]

Ejemplos:
  ./render_wav.sh celtic_carol/celtic_carol.ly
  ./render_wav.sh "The First Noel/The First Noel.midi"
  ./render_wav.sh celtic_carol/celtic_carol.ly "" "/ruta/a/otro.sf2"

Salida:
  <carpeta de la partitura>/out/<base>.wav por defecto.
  PDF y MIDI compilados junto al .ly. Un outdir explícito es relativo al cwd.
  Si la entrada ya está en out/, se reutiliza ese directorio.
EOF
}

if [[ $# -lt 1 || "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  render_wav_usage
  exit 0
fi

INPUT="$1"
OUTDIR="${2:-}"
SF2="${3:-$RENDER_DEFAULT_SF2}"

render_wav "$INPUT" "$OUTDIR" "$SF2"
