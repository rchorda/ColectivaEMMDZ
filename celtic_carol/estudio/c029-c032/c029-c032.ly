\version "2.24.0"
\language "espanol"
\include "esquema-digitacion.ily"

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
  system-system-spacing.basic-distance = #16
}

#(define (celtic-dynamic-volume name)
  (or (assoc-ref '(("ppp" . 0.20) ("pp" . 0.30) ("p" . 0.42)
                   ("mp" . 0.54) ("mf" . 0.68) ("f" . 0.92)
                   ("ff" . 0.96)) name)
      (default-dynamic-absolute-volume name)))

subir = ^\markup { \with-color #red \char #8593 }

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
  la''8-3\ff-^ la''-3-^ la''-3-^ \once \override NoteHead.color = #(x11-color 'ForestGreen) la''16-\tweak color #(x11-color 'ForestGreen) -3\upbow\f->( sol''-2 fa''-1 mi''-0 re''8-\tweak color #blue -3-.) mi''4-\tweak color #blue -0-> re''8-\tweak color #blue -3\upbow-> ~ re'' do''4-2\upbow-> | % 29
  \barNumberCheck #30
  do''8-2\downbow-. la'-0-. re''-3-. la'-0-. mi''-\tweak color #blue -0-. la'-\tweak color #blue -0-. \once \override NoteHead.color = #(x11-color 'ForestGreen) do''16-\tweak color #(x11-color 'ForestGreen) -2\downbow( si'-1 la'-0 sol'-\tweak color #blue -3 mi'8-1-.) do'8-\tweak color #blue -3\upbow( si-2 la-1) | \break % 30
  \barNumberCheck #31
  la''8-\tweak color #blue -3\ff-^ la''-3-^ la''-3-^ \once \override NoteHead.color = #(x11-color 'ForestGreen) la''16-\tweak color #(x11-color 'ForestGreen) -3\upbow\f->( sol''-2 fa''-1 mi''-0 re''8-\tweak color #blue -3-.) mi''4-\tweak color #blue -0-> re''8-\tweak color #blue -3\upbow-> ~ re'' do''4-2\upbow-> | % 31
  \barNumberCheck #32
  do''8-2\downbow-. la'-0-. re''-3-. la'-0-. mi''-4-. la''-\tweak color #blue -3\upbow-. sols''-\tweak color #red -2\subir\downbow( mi''-0 si''-4) la''4-3-> r8 | % 32
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

\markup \esquemaDigitacion

\score {
  \new Staff { \global r1. \fragmento }
  \midi {
    \context {
      \Score
      dynamicAbsoluteVolumeFunction = #celtic-dynamic-volume
    }
  }
}
