\version "2.19.83"
\language "español"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")


\header {
  title = "We Whish you a Merry Christmas"
  composer = "Traditional West Country"
  arranger = "Sheila M. Nelson"
  %meter = "15"
}


global= {
 
  \key sol \major
  \time 3/4
  \tempo  "Allegro" 4 = 120

}

melA = \relative {
\partial 4 re'4^ \markup \bold  "A"  \f
      sol sol8 la sol fas 
      mi4 do mi 
      la la8 si la sol 
      fas4 re re 
      \break
      si' si8 do si la 
      sol4 mi re8 re 
      mi4 la fas 
      sol2 
}

melB = \relative {
      sol''2.^ \markup \bold "B" \p 
      la2( si4)
      si2(sol4)
      sol2 r4 
      \break
      r2.
      r4 r re,8 \upbow \mf re
      mi4 la fas
      sol 2
}


melAp = \relative {
\partial 4 re''4^ \markup \bold  "A\'"  \f
      sol sol8 la sol fas 
      mi4 do r 
      mi \upbow mi mi
      la2 r4
      \break
      fas \upbow fas fas 
      sol2 re8 \upbow \f  re
      mi 2 la fas
      sol2. \downbow(sol2 \upbow)
      
}

violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"

  \mark \markup \smaller "Flautas"
  \melA 
  \mark \markup \smaller "Orquesta"
  \melA 
  \mark \markup \smaller "Orquesta y coro"
  \mf \melA
  r4 \melB
  \melA
  r4 \melB
  \melA
  \melAp
  
  \bar "|." 

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
  \layout { }
  \midi { }
}
