\version "2.24.2"
\language "español"

\header {
  title = "Ejemplo para violín"
  subtitle = "En re mayor"
  instrument = "Violín"
  composer = "Ejemplo"
}

violin = \relative do'' {
  \key re \major
  \time 4/4
  \clef treble

  re4 mi fas sol |
  la2 fas |
  sol4 la si la |
  fas2 re |

  mi4 fas sol mi |
  re2 la' |
  si4 la sol fas |
  mi2 re \bar "|."
}

\score {
  \new Staff \with {
    instrumentName = "Violín"
  } {
    \violin
  }

  \layout { }
  \midi {
    \tempo 4 = 96
  }
}
