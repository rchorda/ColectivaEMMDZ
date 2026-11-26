\version "2.24.0"
\language "espanol"
\include "esquema-digitacion.ily"
\include "miniatura-digitacion.ily"

% Fuente: ../../celtic_carol.ly, Violín 1. Petición [64,68).
% Copia controlada de 64–67; regenerar medios NO resincroniza las notas.
% Contexto: clave de sol, sin armadura, 12/8, negra con puntillo = 30,
% mf heredado del 60 (se explicita al empezar). No se añaden notas previas.
% Un compás de preparación: 8 s, cuatro pulsos con subdivisión ternaria.
% Cierre de estudio: crescendo del 67 hacia f al final del fragmento,
% tomando como referencia el f del 68 excluido. Sin notas añadidas del 68.
% Regenerar desde raíz: compilar esta variante y mezclar claqueta de 12 corcheas a 4. = 30

\header {
  title = "Celtic Carol"
  subtitle = "Violín 1 · Estudio de los compases 64–67"
  composer = "Lindsey Stirling"
  arranger = "Adaptación: Sean O'Loughlin"
  subsubtitle = "Tempo de estudio: 1/4 del original"
  tagline = ##f
}

#(set-global-staff-size 17)
\paper {
  #(set-paper-size "a5landscape")
  page-count = 1
  top-margin = 8\mm
  bottom-margin = 8\mm
  left-margin = 10\mm
  right-margin = 10\mm
  indent = 0\mm
  ragged-last = ##f
  ragged-bottom = ##t
  print-page-number = ##f
  system-system-spacing.basic-distance = #14
  score-markup-spacing.basic-distance = #8
}

#(define (celtic-dynamic-volume name)
  (or (assoc-ref '(("ppp" . 0.20) ("pp" . 0.30) ("p" . 0.42)
                   ("mp" . 0.54) ("mf" . 0.68) ("f" . 0.92)
                   ("ff" . 0.96)) name)
      (default-dynamic-absolute-volume name)))

semitono = -\tweak self-alignment-X #LEFT _\markup { \teeny "½ t." }

subir = ^\markup { \with-color #red \char #8593 }

global = {
  \clef treble
  \time 12/8
  \tempo "Double time" 4. = 30
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
  la'8\mf\downbow-0\miniaturaDigitacionMarcaI( mi''-\tweak color #blue -0 la''-3 si''-4) do''-\tweak color #blue -2\upbow mi''-\tweak color #blue -0\downbow la''\miniaturaDigitacionMarcaIII\upbow-1->( mi''-0) si''-2->( mi''-0) do'''-3->( mi''-0) | % 64
  \barNumberCheck #65
  sol'8\miniaturaDigitacionMarcaI-\tweak color #blue -3( re''-\tweak color #blue -3 sol''-\tweak color #blue -2 la''-3) si'\miniaturaDigitacionMarcaIII-\tweak color #blue -3 re''-\tweak color #blue -1 sol''-4\upbow->( re''-1) la''-\tweak color #blue -1->( re''-\tweak color #blue -1) si''-\tweak color #blue -2->( re'''\miniaturaDigitacionMarcaV-2) | \break % 65
  \barNumberCheck #66
  \once \override NoteHead.color = #(x11-color 'ForestGreen) fa'''8-\tweak color #(x11-color 'ForestGreen) -4\downbow\semitono( mi'''-3 re'''-2) do'''\miniaturaDigitacionMarcaIII-3\semitono( si''-2 la''-1) sols''-\tweak color #red -2\subir\miniaturaDigitacionMarcaI\downbow( fa''?-1\semitono mi''-0) re''-\tweak color #blue -3( do''-2\semitono si'-1) | % 66
  \barNumberCheck #67
  la'2.-0\< mi''2.-\tweak color #blue -0 \tag #'layout { <>\! } \tag #'midi { <>\f } | % 67
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

\markup \esquemaDigitacion

\score {
  \new Staff { \global r1. \keepWithTag #'midi \fragmento }
  \midi {
    \context {
      \Score
      dynamicAbsoluteVolumeFunction = #celtic-dynamic-volume
    }
  }
}
