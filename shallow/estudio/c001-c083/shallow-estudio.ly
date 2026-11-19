\version "2.24.4"
\language "espanol"

% Fuente: ../../shallow-musica.ly, voces de ../../shallow.ly, intervalo [1,84).
% Las cuatro partes incluyen la obra completa y un compás previo de claqueta.
% Entrada: cuatro negras en 4/4 a negra = 96. Es el compás interno 0.
% El primer compás de la obra conserva el número 1. Se usan sus notas y signos
% directamente. Los saltos de la partitura general no se aplican a las partes.
% Regeneración desde esta carpeta: lilypond shallow-estudio.ly

\include "../../shallow-musica.ly"

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

\book {
  \bookOutputSuffix "violin-i"
  \header { subtitle = "Violín I · Partichela de estudio" }
  \score {
    \new Staff { \entrada "treble" si' \removeWithTag #'inicio \violinUno \bar "|." }
  }
}

\book {
  \bookOutputSuffix "violin-ii"
  \header { subtitle = "Violín II · Partichela de estudio" }
  \score {
    \new Staff { \entrada "treble" si' \removeWithTag #'inicio \violinDos \bar "|." }
  }
}

\book {
  \bookOutputSuffix "viola"
  \header { subtitle = "Viola · Partichela de estudio" }
  \score {
    \new Staff { \entrada "alto" do' \removeWithTag #'inicio \viola \bar "|." }
  }
}

\book {
  \bookOutputSuffix "chelo"
  \header { subtitle = "Chelo · Partichela de estudio" }
  \score {
    \new Staff { \entrada "bass" re \removeWithTag #'inicio \chelo \bar "|." }
  }
}
