\version "2.19.83"
\language "español"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")


\header {
  title = "3 Menuetto - Violin I"
  composer = "G.F. Handel"
  meter = "4"
}


global= {
 
  \key fa \major
  \time 3/4
  \tempo "Grazioso"
}


violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
\repeat volta 2 {
la'' \mf la la \upbow
la2 \mordent la,4
re re8 fa mi (re)
dos4 si8 dos la4
fa' fa fa \upbow
  \break
  fa4.  \trill (mi16 fa) sol4
  \acciaccatura fa8 mi4 re dos\upbow
   <re re,>2. 
}
\repeat volta 2 {
   fa4 \f \downbow fa fa \upbow fa4. \trill (mi16 fa) sol4
  \acciaccatura fa8 mi4 re8 do re4
  \break
  si4. \trill (  la16 si) do4
  la' la la \upbow
  la 4. \trill (sol16 la) sib4
  \acciaccatura la8 sol4 fa mi \upbow
  <fa la,> 2.
  mi8. \p ( fa16 sol4) fa
  r2.
  \break
  mi8. \cresc (fa16 sol8) fa mi re
   dos4 \trill si8 dos mi4
   fa \f fa fa \upbow
   fa4. (mi16 fa) sol4 
   \acciaccatura fa8 mi4 re dos \upbow 
   <re re,>2.


}
  
 % \bar "|." 

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
  \new StaffGroup <<
    \new Staff << \global \violinOne >>
    %\new Staff << \global \violinTwo >>
    %\new Staff << \global \viola >>
    %\new Staff << \global \cello >>
  >>
  %\layout { }
  \layout {
  \context {
    \Voice
    \consists "Horizontal_bracket_engraver"
  }
}
  \midi { }
}
