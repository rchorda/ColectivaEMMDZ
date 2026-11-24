\version "2.24.4"
\language "espanol"

% Fuente: ../../shallow-musica.ly, voces de ../../shallow.ly, intervalo [1,84).
% Las cuatro partes incluyen la obra completa y un compás previo de claqueta.
% Entrada: cuatro negras en 4/4 a negra = 96. Es el compás interno 0.
% El primer compás de la obra conserva el número 1. Las partes de violín
% añaden digitaciones sobre copias cotejadas. Se conservan las notas y signos.
% Regeneración de PDF y vídeo desde la raíz: python3 shallow/estudio/c001-c083/render.py

\include "../../shallow-musica.ly"
\include "shallow-digitaciones.ily"

\header {
  title = "Shallow"
  arranger = "Arr. Norbert Kurunci"
  copyright = "Unique Sheet Music"
  tagline = ##f
}

#(set-global-staff-size 20)

\paper {
  #(set-paper-size "a4")
  top-margin = 13\mm
  bottom-margin = 13\mm
  left-margin = 14\mm
  right-margin = 14\mm
  indent = 0\mm
  ragged-last = ##f
  ragged-last-bottom = ##f
  system-system-spacing.basic-distance = #12
}

entrada =
#(define-music-function (clave pulso) (string? ly:pitch?)
  #{
    \clef #clave
    \omit Score.BarNumber
    \set Score.currentBarNumber = #0
    \metroShallow
    \tempo "Entrada" 4 = 96
    \improvisationOn
    $pulso 4-\markup \small "1"
    $pulso 4-\markup \small "2"
    $pulso 4-\markup \small "3"
    $pulso 4-\markup \small "4"
    \improvisationOff
    \bar "||"
    \noBreak
    \undo \omit Score.BarNumber
    \once \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \barNumberCheck #1
  #})

\layout {
  \context {
    \Score
    barNumberVisibility = #all-bar-numbers-visible
  }
}

violinesEstudioUno = { \entrada "treble" si' \removeWithTag #'inicio \violinUnoEstudio \bar "|." }
violinesEstudioDos = { \entrada "treble" si' \removeWithTag #'inicio \violinDosEstudio \bar "|." }
violaEstudio = { \entrada "alto" do' \removeWithTag #'inicio \viola \bar "|." }
cheloEstudio = { \entrada "bass" re \removeWithTag #'inicio \chelo \bar "|." }

\book {
  \bookOutputSuffix "violin-i"
  \header { subtitle = "Violín I · Partichela de estudio" }
  \score {
    \new Staff \violinesEstudioUno
    \layout { }
    \midi { }
  }
}

\book {
  \bookOutputSuffix "violin-ii"
  \header { subtitle = "Violín II · Partichela de estudio" }
  \score {
    \new Staff \violinesEstudioDos
    \layout { }
    \midi { }
  }
}

\book {
  \bookOutputSuffix "viola"
  \header { subtitle = "Viola · Partichela de estudio" }
  \score {
    \new Staff \violaEstudio
  }
}

\book {
  \bookOutputSuffix "chelo"
  \header { subtitle = "Chelo · Partichela de estudio" }
  \score {
    \new Staff \cheloEstudio
  }
}

\book {
  \bookOutputSuffix "cuarteto"
  \header { subtitle = "Cuarteto · Partitura de estudio" }
  \paper {
    #(layout-set-staff-size 17.5)
    indent = 16\mm
    short-indent = 13\mm
    ragged-last-bottom = ##t
  }
  \score {
    \new StaffGroup <<
      \new Staff \with { instrumentName = "Violín I" shortInstrumentName = "Vln. I" }
        \violinesEstudioUno
      \new Staff \with { instrumentName = "Violín II" shortInstrumentName = "Vln. II" }
        \violinesEstudioDos
      \new Staff \with { instrumentName = "Viola" shortInstrumentName = "Vla." }
        \violaEstudio
      \new Staff \with { instrumentName = "Chelo" shortInstrumentName = "Vc." }
        \cheloEstudio
    >>
    \layout { }
    \midi { }
  }
}
