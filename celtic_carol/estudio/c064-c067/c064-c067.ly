\version "2.24.0"
\language "espanol"

% Fuente: ../../celtic_carol.ly, Violín 1. Petición [64,68).
% Copia controlada de 64–67; regenerar medios NO resincroniza las notas.
% Contexto: clave de sol, sin armadura, 12/8, negra con puntillo = 120,
% mf heredado del 60 (se explicita al empezar). No se añaden notas previas.
% Un compás de preparación: 2 s, cuatro pulsos con subdivisión ternaria.
% Cierre de estudio: crescendo del 67 hacia f al final del fragmento,
% tomando como referencia el f del 68 excluido. Sin notas añadidas del 68.
% Regenerar desde raíz: python3 celtic_carol/estudio/render_12_8.py c064-c067

\header {
  title = "Celtic Carol"
  subtitle = "Violín 1 · Estudio de los compases 64–67"
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

semitono = -\tweak self-alignment-X #LEFT _\markup { \teeny "½ t." }

global = {
  \clef treble
  \time 12/8
  \tempo "Double time" 4. = 120
  \set Staff.midiInstrument = "violin"
}

entrada = \absolute {
  \set Score.currentBarNumber = #63
  \once \omit Score.BarNumber
  \override NoteHead.style = #'cross
  si'4.^\markup { \small \bold "Entrada" } si'4. si'4. si'4. |
  \revert NoteHead.style
}

fragmento = \absolute {
  \set Score.currentBarNumber = #64
  \barNumberCheck #64
  la'8\mf\downbow-0( mi''-0 la'' si'') do''\upbow mi''\downbow la''\upbow-1->( mi''-0) si''->( mi'') do'''-3->( mi''-0) | % 64
  \barNumberCheck #65
  sol'8-3( re'' sol'' la'') si'-3 re''-1 sol''\upbow->( re'') la''->( re'') si''->( re'''-2) | \break % 65
  \barNumberCheck #66
  fa'''8\downbow\semitono( mi''' re''') do'''-3\semitono( si'' la'') sols''\downbow( fa''?\semitono mi'') re''( do''\semitono si') | % 66
  \barNumberCheck #67
  la'2.\< mi''2. \tag #'layout { <>\! } \tag #'midi { <>\f } | % 67
  \barNumberCheck #68
  \bar "|."
}

\score {
  \new Staff { \global \autoLineBreaksOff \entrada \keepWithTag #'layout \fragmento }
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
  \small "Cierre de estudio: el crescendo del 67 alcanza f al final del fragmento."
  \small "Claqueta solo al inicio. Selección [64,68): compases 64–67, ambos incluidos."
}

\score {
  \new Staff { \global r1. \keepWithTag #'midi \fragmento }
  \midi {
    \context {
      \Score
      dynamicAbsoluteVolumeFunction = #celtic-dynamic-volume
    }
  }
}
