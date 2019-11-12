\version "2.19.83"
\language "español"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")


\header {
  title = "Violine I/II"
  composer = "Nr. 12"
  % meter = "Allegro"
}


global= {
  \time 2/4
  \key sol \major
  \tempo "Menuetto"

}

violinOne = \new Voice \relative do'' {
  \set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
  \set Staff.midiPanPosition = 1
  
  \partial 8
  re8
  re( si) sol-.~ sol-.
  
  
  \bar ":..:"
  
  
  \bar ":..:"
  %\key do \major 
  
  \break
  
  \break
  
  \bar ":..:"
  
  \break
 

  \bar ":|."
}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"
  \set Staff.midiPanPosition = -1
  
  \partial 8
  r8
  
  \bar ":..:"
  
  \bar ":..:"
  %\key do \major 
  
  \bar ":..:"
  \tuplet 3/2 { sol8(si)re }  fa4(mi)
  si2(do4)
  \break
  
  
  \bar ":|." 
}


viola = \new Voice \relative do' {
  \set Staff.instrumentName = #"Viola "
  \set Staff.midiInstrument = "viola"
  \set Staff.midiPanPosition = -1
  
}


\score {
  \new StaffGroup <<
    \new Staff << \global \violinOne >>
    \new Staff << \global \violinTwo >>
    %\new Staff << \global \viola >>
    %\new Staff << \global \cello >>
  >>
  \layout { }
  \midi { }
}