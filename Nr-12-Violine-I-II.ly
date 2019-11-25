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
   
  \repeat volta 2 { 
  \partial 8
  re8
  re( si) sol-.~ sol-.
  sol4.sols8
  la(sols) la-.-0(re-.-3)
  do4 (si8)re-1
  re(si) sol-. sol-.
  sol sol'4 fas8
  \break
  
  \slashedGrace {fas8} mi re mi fas
  }
  \alternative{
    {	re4 r}
    { 	re}
  }
  
  
 

  \bar ".|:"
  \repeat volta 2 { 
  re8-.-3 \downbow re-. 
  mi8 r si-. \upbow \p si-.
  do r la-. la-.
  do16 (si la si)do8 si
  sols(la) si \f si
  \break
  mi8 r si \p si 
  do r la la 
  si si la la
  si si dos dos 
  re16-2(mi) re dos re(mi)fas re
  dos-2(re) dos si dos(re)mi dos
  \break
  re16-2(mi) re dos re(mi)fas re
  dos-2(re) dos si dos(re)mi dos
  re4 r8 re-1
  re(si) sol-.(sol-.)
  sol4. sols8
  \slashedGrace {si8} la(sols) la-.-0(re-.-3)
  \break
  do4(si8) re-1
  re(si)sol-.(sol-.)
  sol4. sols8
  \slashedGrace{ si8} la8 sol! la si 
  sol4 r8 sol8-1 \p \upbow
  \slashedGrace {re'}do si do re
  \slashedGrace {do} si la si do
  \slashedGrace {si} la sol la re
  \break
  si4 r8 si
  \slashedGrace {re8} do si do re
  \slashedGrace {do8} si la si do
  \slashedGrace {si8} la sol la si 
  sol4 r
  la-2 \f \downbow la
  si r
  la2 \upbow \p
  }
  \alternative{
    {	sol4 }
    { 	sol4 r}
  }
  
  

  \bar "|."
  
}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"
  \set Staff.midiPanPosition = -1
  
 
  
  
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