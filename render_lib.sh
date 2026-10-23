#!/usr/bin/env bash

# Funciones compartidas para renderizar partituras LilyPond a audio y video.
: "${RENDER_DEFAULT_SF2:=/Users/usuario/DocuLocal/Casa/ColectivaEMMDZ/Violin STR VI (5,353KB).sf2}"

render_need_cmd() {
  local cmd="$1"
  local package="${2:-$1}"

  command -v "$cmd" >/dev/null 2>&1 || {
    echo "Falta '$cmd'. Instala con: brew install $package" >&2
    return 1
  }
}

render_escape_for_ffconcat() {
  # Escapa comillas simples para archivos concat de ffmpeg:  ' -> '\''
  printf "%s" "$1" | sed "s/'/'\\\\''/g"
}

render_get_wav_duration() {
  local wav="$1"

  if command -v soxi >/dev/null 2>&1; then
    soxi -D "$wav"
  else
    ffprobe -v error -show_entries format=duration -of default=nk=1:nw=1 "$wav"
  fi
}

render_is_number() {
  echo "$1" | grep -E '^[0-9]+([.][0-9]+)?$' >/dev/null 2>&1
}

render_is_wav_file() {
  local wav="$1"
  local head4

  [[ -f "$wav" ]] || return 1
  head4="$(dd if="$wav" bs=1 count=4 2>/dev/null || true)"
  [[ "$head4" == "RIFF" ]]
}

render_find_midi() {
  local outdir="$1"
  local base="$2"

  if [[ -f "$outdir/$base.midi" ]]; then
    printf "%s\n" "$outdir/$base.midi"
  elif [[ -f "$outdir/$base.mid" ]]; then
    printf "%s\n" "$outdir/$base.mid"
  else
    return 1
  fi
}

render_wav() {
  local input="$1"
  local outdir="${2:-out}"
  local sf2="${3:-$RENDER_DEFAULT_SF2}"
  local filename ext base midi wav raw fs_rc

  if [[ ! -f "$input" ]]; then
    echo "No existe el archivo de entrada: $input" >&2
    return 1
  fi
  if [[ ! -f "$sf2" ]]; then
    echo "No existe el SoundFont SF2: $sf2" >&2
    echo "Pasalo como 3er argumento si la ruta cambio." >&2
    return 1
  fi

  render_need_cmd fluidsynth "fluid-synth" || return 1
  render_need_cmd sox "sox" || return 1

  mkdir -p "$outdir"

  filename="$(basename "$input")"
  ext="${filename##*.}"
  base="${filename%.*}"
  midi=""

  if [[ "$ext" == "ly" ]]; then
    render_need_cmd lilypond "lilypond" || return 1
    echo ">> Compilando LilyPond: $input"
    lilypond -o "$outdir/$base" "$input" || return 1

    if ! midi="$(render_find_midi "$outdir" "$base")"; then
      echo "No encontre MIDI generado en $outdir para base '$base'." >&2
      return 1
    fi
  elif [[ "$ext" == "midi" || "$ext" == "mid" ]]; then
    midi="$input"
  else
    echo "Extension no soportada: .$ext (usa .ly, .mid o .midi)" >&2
    return 1
  fi

  wav="$outdir/$base.wav"
  raw="$outdir/$base.raw"

  echo ">> MIDI -> WAV usando SoundFont:"
  echo "   SF2:  $sf2"
  echo "   MIDI: $midi"
  echo "   WAV:  $wav"

  if fluidsynth -ni -T wav -F "$wav" "$sf2" "$midi" >/dev/null 2>&1; then
    fs_rc=0
  else
    fs_rc=$?
  fi

  if [[ $fs_rc -ne 0 ]] || ! render_is_wav_file "$wav"; then
    echo ">> El modo WAV directo no funciono (o no genero WAV valido). Usando fallback RAW -> WAV..."
    rm -f "$wav"

    fluidsynth -ni -F "$raw" "$sf2" "$midi" >/dev/null 2>&1 || return 1
    sox -t raw -r 44100 -e signed -b 16 -c 2 "$raw" "$wav" || return 1
    rm -f "$raw"
  fi

  echo "OK -> $wav"
}

render_mp4() {
  local input="$1"
  local outdir="${2:-out}"
  local sf2="${3:-$RENDER_DEFAULT_SF2}"
  local t_spec="${4:-}"
  local filename ext base pdf midi wav mp4 concat
  local line page_count wav_dur wav_dur_c per oldifs
  local k sum_fixed remain neg left per_rest i p p_esc dur last last_esc
  local -a pages durations fixed

  export LC_ALL=C
  export LANG=C

  if [[ ! -f "$input" ]]; then
    echo "No existe el archivo de entrada: $input" >&2
    return 1
  fi

  render_need_cmd ffmpeg "ffmpeg" || return 1
  render_need_cmd ffprobe "ffmpeg" || return 1
  render_need_cmd magick "imagemagick" || return 1
  render_need_cmd gs "ghostscript" || return 1

  mkdir -p "$outdir"

  filename="$(basename "$input")"
  ext="${filename##*.}"
  base="${filename%.*}"

  pdf=""
  midi=""
  wav="$outdir/$base.wav"
  mp4="$outdir/$base.mp4"
  concat="$outdir/${base}_images.concat.txt"

  if [[ "$ext" == "ly" ]]; then
    render_need_cmd lilypond "lilypond" || return 1

    if [[ ! -f "$sf2" ]]; then
      echo "No existe el SoundFont SF2: $sf2" >&2
      return 1
    fi

    echo ">> Compilando LilyPond: $input"
    lilypond -o "$outdir/$base" "$input" || return 1

    pdf="$outdir/$base.pdf"
    if ! midi="$(render_find_midi "$outdir" "$base")"; then
      echo "No encontre MIDI en $outdir para base '$base'." >&2
      return 1
    fi

    echo ">> Generando WAV desde MIDI..."
    render_wav "$midi" "$outdir" "$sf2" || return 1
  elif [[ "$ext" == "pdf" ]]; then
    pdf="$input"
    if [[ -f "$outdir/$base.wav" ]]; then
      wav="$outdir/$base.wav"
    elif [[ -f "$(dirname "$input")/$base.wav" ]]; then
      wav="$(dirname "$input")/$base.wav"
    else
      echo "Me diste un PDF pero no encuentro el WAV correspondiente ($base.wav)." >&2
      echo "Genera primero WAV con render_wav.sh o usa la via .ly." >&2
      return 1
    fi
  else
    echo "Extension no soportada: .$ext (usa .ly o .pdf)" >&2
    return 1
  fi

  if [[ ! -s "$wav" ]]; then
    echo "WAV inexistente o vacio: $wav" >&2
    return 1
  fi
  if [[ ! -f "$pdf" ]]; then
    echo "PDF no encontrado: $pdf" >&2
    return 1
  fi

  rm -f "$outdir/${base}_"*.png

  echo ">> PDF -> PNGs (multipagina)..."
  magick -density 200 "$pdf" -quality 95 "$outdir/${base}_%03d.png" || return 1

  pages=()
  while IFS= read -r line; do
    pages+=("$(basename "$line")")
  done < <(ls -1 "$outdir/${base}_"*.png 2>/dev/null | sort)

  page_count="${#pages[@]}"
  if [[ "$page_count" -lt 1 ]]; then
    echo "No se generaron PNGs desde el PDF. Revisa ImageMagick/Ghostscript." >&2
    return 1
  fi

  wav_dur="$(render_get_wav_duration "$wav")"
  wav_dur_c="$(LC_ALL=C printf "%.6f" "$wav_dur" 2>/dev/null || echo "$wav_dur")"

  echo ">> Hojas: $page_count | Duracion WAV: ${wav_dur_c}s"

  durations=()
  if [[ -z "$t_spec" ]]; then
    per="$(LC_ALL=C awk -v d="$wav_dur_c" -v n="$page_count" 'BEGIN{ if(n<=0){print 0}else{printf "%.6f", d/n} }')"
    i=0
    while [[ $i -lt $page_count ]]; do
      durations+=("$per")
      i=$((i+1))
    done
    echo ">> Modo: AUTO  (T_por_hoja = ${per}s)"
  else
    fixed=()
    if echo "$t_spec" | grep -q ","; then
      oldifs="$IFS"
      IFS=',' read -r -a fixed <<< "$t_spec"
      IFS="$oldifs"
    else
      fixed=("$t_spec")
    fi

    k=0
    while [[ $k -lt "${#fixed[@]}" ]]; do
      fixed[$k]="$(echo "${fixed[$k]}" | sed 's/^ *//; s/ *$//')"
      if ! render_is_number "${fixed[$k]}"; then
        echo "Tiempo invalido: '${fixed[$k]}' (usa punto decimal, ej 4.5)" >&2
        return 1
      fi
      k=$((k+1))
    done

    if [[ "${#fixed[@]}" -gt "$page_count" ]]; then
      echo "Demasiados tiempos: diste ${#fixed[@]} pero hay $page_count hojas." >&2
      return 1
    fi

    sum_fixed="0.000000"
    k=0
    while [[ $k -lt "${#fixed[@]}" ]]; do
      sum_fixed="$(LC_ALL=C awk -v a="$sum_fixed" -v b="${fixed[$k]}" 'BEGIN{printf "%.6f", a+b}')"
      k=$((k+1))
    done

    if [[ "${#fixed[@]}" -eq "$page_count" ]]; then
      k=0
      while [[ $k -lt "$page_count" ]]; do
        durations+=("$(LC_ALL=C printf "%.6f" "${fixed[$k]}")")
        k=$((k+1))
      done
      echo ">> Modo: ARRAY completo (1 tiempo por hoja)"
    else
      remain="$(LC_ALL=C awk -v d="$wav_dur_c" -v s="$sum_fixed" 'BEGIN{printf "%.6f", d-s}')"
      neg="$(LC_ALL=C awk -v r="$remain" 'BEGIN{print (r < -0.0005) ? 1 : 0}')"
      if [[ "$neg" -eq 1 ]]; then
        echo "Los tiempos fijos (${sum_fixed}s) superan la duracion del WAV (${wav_dur_c}s)." >&2
        return 1
      fi

      k=0
      while [[ $k -lt "${#fixed[@]}" ]]; do
        durations+=("$(LC_ALL=C printf "%.6f" "${fixed[$k]}")")
        k=$((k+1))
      done

      left=$((page_count - ${#fixed[@]}))
      per_rest="$(LC_ALL=C awk -v r="$remain" -v n="$left" 'BEGIN{ if(n<=0){print 0}else{printf "%.6f", r/n} }')"

      i=0
      while [[ $i -lt "$left" ]]; do
        durations+=("$per_rest")
        i=$((i+1))
      done

      echo ">> Modo: PREFIJO fijo (${#fixed[@]} hojas) + resto equitativo"
      echo "   fijos: ${t_spec}"
      echo "   resto total: ${remain}s -> ${left} hojas -> ${per_rest}s/hoja"
    fi
  fi

  rm -f "$concat"
  touch "$concat"

  i=0
  while [[ $i -lt $page_count ]]; do
    p="${pages[$i]}"
    p_esc="$(render_escape_for_ffconcat "$p")"
    dur="${durations[$i]}"
    dur="$(echo "$dur" | sed 's/,/./g')"
    echo "file '$p_esc'" >> "$concat"
    echo "duration $dur" >> "$concat"
    i=$((i+1))
  done

  last="${pages[$((page_count-1))]}"
  last_esc="$(render_escape_for_ffconcat "$last")"
  echo "file '$last_esc'" >> "$concat"

  rm -f "$mp4"
  echo ">> Creando MP4 con pase de hojas..."

  if ffmpeg -y -f concat -safe 0 -i "$concat" -i "$wav" \
    -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" \
    -c:v libx264 -pix_fmt yuv420p -r 30 \
    -c:a aac -b:a 192k -shortest -movflags +faststart "$mp4"
  then
    :
  else
    echo ">> libx264 fallo; probando h264_videotoolbox..."
    rm -f "$mp4"
    ffmpeg -y -f concat -safe 0 -i "$concat" -i "$wav" \
      -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" \
      -c:v h264_videotoolbox -b:v 4000k -pix_fmt yuv420p -r 30 \
      -c:a aac -b:a 192k -shortest -movflags +faststart "$mp4" || return 1
  fi

  echo "OK -> $mp4"
}
