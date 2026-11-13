\version "2.24.0"
\language "espanol"

% Fuente: ../../celtic_carol.ly, Violín 1. Petición [29,33).
% Copia controlada de 29–32; regenerar medios NO resincroniza las notas.
% Contexto: clave de sol, sin armadura, 12/8, negra con puntillo = 120,
% ff al inicio, f en la cuarta corchea de 29 y 31. No se añaden notas previas.
% Instrumento MIDI implícito como en la fuente antes del 37; el render usa
% el SoundFont de violín del proyecto. Se conserva ese contexto para mantener
% la calibración de velocidades MIDI del original.
% Un compás de preparación: 2 s, cuatro pulsos con subdivisión ternaria.
% No hay ligaduras ni reguladores abiertos en los extremos.
% Regenerar desde raíz: python3 celtic_carol/estudio/render_12_8.py c029-c032

\header {
  title = "Celtic Carol"
  subtitle = "Violín 1 · Estudio de los compases 29–32"
  composer = "Lindsey Stirling"
  arranger = "Adaptación: Sean O'Loughlin"
  tagline = ##f
}

#(set-global-staff-size 19)
\paper {
  #(set-paper-size "a5landscape")
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

global = {
  \clef treble
  \time 12/8
  \tempo "Misterioso" 4. = 120
}

entrada = \absolute {
  \set Score.currentBarNumber = #28
  \once \omit Score.BarNumber
  \override NoteHead.style = #'cross
  si'4.^\markup { \small \bold "Entrada" } si'4. si'4. si'4. |
  \revert NoteHead.style
}

fragmento = \absolute {
  \set Score.currentBarNumber = #29
  \barNumberCheck #29
  la''8\ff-^ la''-^ la''-^ la''16\upbow\f->( sol'' fa'' mi''-0 re''8-.) mi''4-> re''8\upbow-> ~ re'' do''4\upbow-> | % 29
  \barNumberCheck #30
  do''8\downbow-. la'-. re''-. la'-. mi''-. la'-. do''16\downbow( si' la' sol' mi'8-.) do'8\upbow( si la) | \break % 30
  \barNumberCheck #31
  la''8\ff-^ la''-^ la''-^ la''16\upbow\f->( sol'' fa'' mi'' re''8-.) mi''4-> re''8\upbow-> ~ re'' do''4\upbow-> | % 31
  \barNumberCheck #32
  do''8\downbow-. la'-. re''-. la'-. mi''-4-. la''\upbow-. sols''\downbow( mi''-0 si'') la''4-> r8 | % 32
  \barNumberCheck #33
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
  \small "Claqueta solo al inicio. Selección [29,33): compases 29–32, ambos incluidos."
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
