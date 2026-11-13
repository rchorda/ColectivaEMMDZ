\version "2.18.2"

\header {
  title = "Ejemplo de Digitación para Violín"
  composer = "Tu Nombre"
}

\score {
  \new Staff \relative c' {
    \key c \major
    \time 4/4

    % Melodía con digitación
    \partial 4
    g8-1 g a4-2 a b4-3 b |
    c4-4 c d4-0 d e4-1 e f4-4 f |
  }
  \layout { }
  %\midi { }
}
