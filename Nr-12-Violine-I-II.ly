\version "2.19.83"
\language "español"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")


\header {
  title = "Violine I/II Nr. 12"
  composer = "Mozart"
  meter = "Nr. 12"

}

  global= {
    \time 2/4
    \key sol \major
    \tempo "Allegro"

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
  
  
      \acciaccatura {fas8} mi re mi fas
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
      \acciaccatura si la (sols) la-.-0(re-.-3)
      \break
      do4(si8) re-1
      re(si)sol-.(sol-.)
      sol4. sols8
      \acciaccatura{ si8} la8 sol! la si 
      sol4 r8 sol8-1 \p \upbow
      \acciaccatura {re'}do si do re
      \acciaccatura {do} si la si do
      \acciaccatura {si} la sol la re
      \break
      si4 r8 si
      \acciaccatura {re8} do si do re
      \acciaccatura {do8} si la si do
      \acciaccatura {si8} la sol la si 
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
  
    
    \repeat volta 2 { 
      \partial 8
      r8
      sol8 re' si re
      sol, re' si sol
      re' re fas re
      sol sol, sol r
      si re si re
      dos r re r
  
      sol r la r
    }
    \alternative{
      {	re,4 r}
      { 	re}
    }
  
    
    \repeat volta 2 { 
      si'8-. \f \downbow si-.
      do r sols-. \p \upbow sols-.
      la r fas-. fas-.
      sol (fas16 sol) la8 sol
      mis(fas) si \f si
      do r sols \p sols
      la r re, re
      sol sol re re 
      sol sol mi mi
      fas la fas la
      sol la sol la
    
      fas la fas la
      sol la sol la
      fas r r4
      sol,8 re' si re
      sol, re' si sol
      re' re fas re
    
      sol sol, sol r
      si re si re 
      si re si sol
      re' re fas re
      sol4 r8 sol \p
      la r re, r
      sol r sol, r
      re' r re r
    
      sol, si re sol
      la r re, r
      sol r sol, r
      re' r re r 
      sol, r r4 
      re' \f \downbow re 
      sol r
      re2 \p \upbow
    }
    \alternative{
      {	si4 }
      { 	si r}
    }
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
