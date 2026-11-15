\version "2.24.0"
\language "espanol"

% Fuente: ../../celtic_carol.ly, Violín 1. Petición [68,76).
% Copia controlada de 68–75; regenerar medios NO resincroniza las notas.
% Contexto: clave de sol, sin armadura, 12/8, negra con puntillo = 120.
% Dinámicas f en 68 y mf en 72; se conservan las notas de adorno del 73.
% Sin anacrusa ni ligaduras o reguladores abiertos en los extremos.
% Un compás de preparación: 2 s, cuatro pulsos con subdivisión ternaria.
% Regenerar desde raíz: python3 celtic_carol/estudio/render_12_8.py c068-c075
% Vídeos 1/2 y 3/4: python3 celtic_carol/estudio/render_tempos.py c068-c075

\header {
  title = "Celtic Carol"
  subtitle = "Violín 1 · Estudio de los compases 68–75"
  composer = "Lindsey Stirling"
  arranger = "Adaptación: Sean O'Loughlin"
  tagline = ##f
}

#(set-global-staff-size 19)
\paper {
  #(set-paper-size "a4landscape")
  top-margin = 8\mm
  bottom-margin = 8\mm
  left-margin = 10\mm
  right-margin = 10\mm
  indent = 0\mm
  ragged-last = ##f
  ragged-bottom = ##t
  print-page-number = ##f
  system-system-spacing.basic-distance = #22
}

#(define (celtic-dynamic-volume name)
  (or (assoc-ref '(("ppp" . 0.20) ("pp" . 0.30) ("p" . 0.42)
                   ("mp" . 0.54) ("mf" . 0.68) ("f" . 0.92)
                   ("ff" . 0.96)) name)
      (default-dynamic-absolute-volume name)))

semitono = -\tweak self-alignment-X #LEFT _\markup { \teeny "½ t." }

global = {
  \clef treble
  \time 12/8
  \tempo "Double time" 4. = 120
  \set Staff.midiInstrument = "violin"
}

entrada = \absolute {
  \set Score.currentBarNumber = #67
  \once \omit Score.BarNumber
  \override NoteHead.style = #'cross
  si'4.^\markup { \small \bold "Entrada" } si'4. si'4. si'4. |
  \revert NoteHead.style
}

fragmento = \absolute {
  \set Score.currentBarNumber = #68
  \barNumberCheck #68
  la''8\f-^ la'-. la''-^ fa''16\upbow->( sol'' fa'' mi'' re''8-.) mi''4-> re''8\upbow-> ~ re'' do''4\upbow-> | % 68
  \barNumberCheck #69
  do''8\downbow-. la'-. re''-. la'-. mi''-. la'-. do''16\downbow( re'' do'' la'-0 mi'8-.) do'8( si la) | \break % 69
  \barNumberCheck #70
  la''8-^ la'-. la''-^ fa''16\upbow->( sol'' fa'' mi'' re''8-.) mi''4-> re''8\upbow-> ~ re'' do''4\upbow-> |  % 70
  \barNumberCheck #71
  do''8\downbow-. la'-. re''-. la'-. mi''-. la'-. sols''\downbow( mi'' si'') la''4-> r8 | % 71
  \barNumberCheck #72
  do''4.\mf\downbow si'8( do'' la') mi'4 la'8\upbow-4 ~ la' mi'\upbow-. ( la'\upbow-.) | \break % 72
  \barNumberCheck #73
  do''8( si' do'') re''( \grace { do''16 re'' } do''8 si') la'4( mi'8) la'4( si'8) |  % 73
  \barNumberCheck #74
  do''4.\downbow si'8( do'' la') mi'4 la'8\upbow-4 ~ la' mi'\upbow-.( la'-.) | % 74
  \barNumberCheck #75
  do''8( si' do'') re''( do'' si') la'4( mi'8) la'( si' la') | % 75
  \barNumberCheck #76
  \bar "|."
}

\score {
  \new Staff { \global \autoLineBreaksOff \entrada \fragmento }
  \layout {
    \context {
      \Score
      barNumberVisibility = #all-bar-numbers-visible
      \override BarNumber.break-visibility = ##(#f #t #t)
    }
  }
}

\markup \column {
  \vspace #0.6
  \small "Entrada: cuatro pulsos de negra con puntillo, con subdivisión en corcheas."
  \small "Claqueta solo al inicio. Selección [68,76): compases 68–75, ambos incluidos."
}

\score {
  \new Staff { \global r1. \fragmento }
  \midi {
    \context {
      \Score
      dynamicAbsoluteVolumeFunction = #celtic-dynamic-volume
    }
  }
}
