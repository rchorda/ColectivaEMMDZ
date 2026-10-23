#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/render_lib.sh"

render_wav_usage() {
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

if [[ $# -lt 1 || "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  render_wav_usage
  exit 0
fi

INPUT="$1"
OUTDIR="${2:-out}"
SF2="${3:-$RENDER_DEFAULT_SF2}"

render_wav "$INPUT" "$OUTDIR" "$SF2"
