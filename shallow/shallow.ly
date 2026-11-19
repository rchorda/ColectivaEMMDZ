\version "2.24.4"
\language "espanol"

\header {
  title = "Shallow"
  subtitle = \markup { \italic "From the movie «A Star Is Born»" }
  arranger = "Arr. Norbert Kurunci"
  copyright = "Unique Sheet Music"
  tagline = ##f
}

\include "shallow-musica.ly"

saltosPartitura = {
  s1*5 \break
  s1*5 \break
  s1*5 \pageBreak
  s1*5 \break
  s1*5 \break
  s1*5 \pageBreak
  s1*6 \break
  s1*6 \break
  s1*5 \pageBreak
  s1*5 \break
  s1*6 \break
  s1*5 \pageBreak
  s1*4 \break
  s1*4 \break
  s1*5 \pageBreak
  s1*5 \break
  s1*2 \bar "|."
}

#(set-global-staff-size 17.5)

\paper {
  #(set-paper-size "a4")
  top-margin = 13\mm
  bottom-margin = 13\mm
  left-margin = 13\mm
  right-margin = 13\mm
  ragged-last-bottom = ##t
}

\score {
  \new StaffGroup <<
    \new Staff \with {
      instrumentName = "Violín I"
      shortInstrumentName = "Vln. I"
    } << \violinUno \saltosPartitura >>
    \new Staff \with {
      instrumentName = "Violín II"
      shortInstrumentName = "Vln. II"
    } \violinDos
    \new Staff \with {
      instrumentName = "Viola"
      shortInstrumentName = "Vla."
    } \viola
    \new Staff \with {
      instrumentName = "Chelo"
      shortInstrumentName = "Vc."
    } \chelo
  >>
  \layout { }
}
