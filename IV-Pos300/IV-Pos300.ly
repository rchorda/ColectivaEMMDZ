\version "2.20.0"
\language "español"
\include "articulate.ly"
rallpoco =
#(make-music 'CrescendoEvent
             'span-direction START
             'span-type 'text
             'span-text "rall. poco a poco")


\header {
  title = "Cuarta posición nº 300"
  %composer = "G.F. Handel"
  meter = "35"
}
 subirDedo = ^\markup \char #8593
 bajarDedo = ^\markup \char #8595

global= {
 
  \key fa \major
  \time 2/4
  \tempo "Vivo" 8 = 60
}


violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
  
  \repeat volta 2 {
    re16-1 (fa) fa(mi) mi (sol) sol (fa)
    fa (la) la(sol) sol(sib)sib(la)
    la-1(dos\subirDedo) dos(si-2\subirDedo) si(re) re(dos)
    dos(mi-1) mi(re) re(fa-2) fa(mi)
    mi(sol-3) sol(fa) fa(la-4)la (sol-3)
    \break
    sol-3(sib-1)sib (la) la (dos-2) dos (si)
    si (re-3)re (dos) dos (mi-4) mi(re)
    re4 r
  
    fa16-5\upbow (re-3) re-3(mi-4) mi-4(do!-2) do-2(re-3)
    re-3(sib-1)\bajarDedo sib-1(do-2)do-2(la-4)la-4(sib-1)
    \break
    sib-1 (sol-3) sol-3(la-4) la-4(fa-2) fa-2(sol-3)
    sol-3(mi-1) mi-1(fa-2) fa-2(re-4)re-4 (mi-1)
    mi-1(do-3)do-3(re-4)re-4(sib-2)sib-2(do-3)
    do-3(la-1)la-1(sib-2)sib-2(sol-4)sol-4(la-1)
    la-1(fa-3)fa-3(sol-4)sol-4(mi-2)mi-2(re-1)
    re4 r
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
  
  \unfoldRepeats 
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
