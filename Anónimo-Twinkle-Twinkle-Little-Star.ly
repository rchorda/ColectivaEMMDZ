\version "2.20.0"
\language "español"
\include "articulate.ly"

rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")
subir = ^\markup \char #8593
bajar = ^\markup \char #8595
primera =  _\markup {\bold "I"}
segunda =  _\markup {\bold "II"}
tercera =  _\markup {\bold "III"}
cuarta =  _\markup {\bold "IV"}
quinta =  _\markup {\bold "V"}
sexta =  _\markup {\bold "VI"}


\header {
  title = "Twinkle, Twinkle, Little Star"
  subtitle = "Violín"
  composer = "Anónimo"
}

global= {
 
  \key do \major
  \time 4/4
  %\compressFullBarRests
}

violinOne = \new Voice \relative do'  {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = 1,1,1,1
  \tempo  4 = 100

  % Primera línea
  do4 do sol' sol | la4 la sol2 |
  fa4 fa mi mi | re4 re do2 |

  % Segunda línea
  sol'4 sol fa fa | mi4 mi re2 |
  sol4 sol fa fa | mi4 mi re2 |

  % Tercera línea
  do4 do sol' sol | la4 la sol2 |
  fa4 fa mi mi | re4 re do2 |
}



\score {
  
  %\unfoldRepeats 
  %\articulate <<
  \new StaffGroup <<
    \new Staff << \global \violinOne >>
    %\new Staff << \global \violinTwo >>
    %\new Staff << \global \viola >>
    %\new Staff << \global \cello >>
  >>
  %>>
  %\layout { }
  \layout {
  \context {
    \Voice
    \consists "Horizontal_bracket_engraver"
  }
}
  \midi { }
}
