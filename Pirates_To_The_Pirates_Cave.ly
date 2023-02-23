\version "2.19.83"
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
  %title = "3 Menuetto - Violin I"
  %composer = "G.F. Handel"
  meter = "2"
}


global= {
 
  \key fa \major
  \time 3/4
  %\compressFullBarRests
}


violinOne = \new Voice \relative do'  {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
  %\markup \box "167"
  % Disable beamExceptions because they are definitely
  % defined for 4/4 time
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = 1,1,1
  
  \compressMMRests {
  \set Score.currentBarNumber = #56
  \mark \markup \box \smaller "56"
  \tempo  4 = 100
  %\mark \markup "One Last Shot" 
  R1*3/4*3 |
  %\tempo "Slow Rubato"
  dos4\accent \upbow \mf \< re\accent mi\accent
  re8\f r16 do!16 re8 mi fa la,
  re r16 fa mi8 do re la
  re r16 do re8 mi fa sol
  la\downbow r mi\downbow r do\downbow r
  re \downbow r16 do re8 mi fa r
  re r16 fa mi8 do re la
  re\< r16 do re8 mi fa sol \!
  
  \time 4/4
  % Disable beamExceptions because they are definitely
  % defined for 4/4 time
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = 1,1,1,1
  la\< \downbow\accent r si\downbow\accent r dos\downbow\accent r re16\ff\downbow re mi mi
  \break
  \time 3/4
  % Disable beamExceptions because they are definitely
  % defined for 4/4 time
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = 1,1,1
  fa fa fa fa fa fa sol sol la la la la 
  sol sol sol sol fa fa fa fa mi mi mi mi 
  fa fa fa fa sol sol sol sol la la la la 
  sol sol sol sol sol sol sol sol fa fa sol sol 
  
  
  la la la la la la sol sol fa fa fa fa
  mi2\accent fa4~ \accent
  fa mi2\accent
  \time 4/4
  \mark \markup \box \smaller "75"
  \tempo  "Forcefully" 4 = 100
  re'4-2 \quinta \upbow re re do8-1--\bajar re-^-2
  r re-1 \sexta r fa-3 r sol-4 fa-3-^ r
  \break
  re4-1 \downbow re-1 re-1 do8---4 re-^
  r  fa-3 r lab-4 \bajar r fa-3 re-1-^ r
  re4-1  \downbow re re do8-4--\bajar re-^-1
  r re-1 r fa-3 r sol-4 fa-3-^ r
  
  re4-1 \downbow re-1 re-1 do8---4 re-^
  r re-1 r fa-3 r lab-4 fa-3-^ r
  
  re4-1 \downbow re-1 re-1 do8---4 re-^
  r2sols,8-.-2 \primera \subir \downbow si-.-4 fa-.-1 do-.-2 
  \break
  
  \mark \markup \box \smaller "85"
  re16-1 \downbow \tercera re re re fa8-.-3 r
  re16-1 \downbow  re re re sols8-.-4 si-.-2
  
  re,16-1 \downbow re re re fa8-.-3 r
  sols-.-4\downbow si-.-2 fa-.-3 do-.-4
  
  fa16-3 fa fa fa lab8-.-1\bajar r
  fa16-3 fa fa fa si8-.-2 re-.-4
  
  fa,16-3 fa fa fa lab8-.-1\bajar r
  si-.-2 re-.-4 lab-.-1 mib-.-2
  
  fa16-3 fa fa fa lab8-.-1\bajar r
  fa16-3 fa fa fa si8-.-2 re-.-4
  
  fa,16-3 fa fa fa lab8-.-1\bajar r
  si-.-2 re-.-4 lab-.-1 mib-.-2
  
  \break
  lab16-1 lab lab lab si8-.-2 r
  lab16-1 lab lab lab re8-.-2 fa-.-4 
  
  lab,16-1 lab lab lab si8-.-2 r
  re-.-2\downbow fa-.-4 si,-.-4 solb-.-1
  
  lab16-1 lab lab lab si8-.-2 r
  lab16-1 lab lab lab re8-.-2 fa-.-4 
  
  \break
  lab,16-1 lab lab lab si8-.-2 r
  re-.-2\downbow fa-.-4 si,-.-4 solb-.-1
  
  lab-.-1 r r4 r2
  R1 R R
  
  
  
  
  
  
   \bar "|." 
  }
}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"

  
}


viola = \new Voice \relative do' {
  \set Staff.instrumentName = #"Viola "
  \set Staff.midiInstrument = "viola"
  \clef alto



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
