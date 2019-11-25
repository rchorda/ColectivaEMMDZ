\version "2.19.83"
\language "español"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")


\header {
  title = "Violine I/II"
  composer = "Nr. 11"
  % meter = "Allegro"
}


global= {
  \time 3/4
  \key sol \major
  \tempo "Menuetto"

}

violinOne = \new Voice \relative do'' {
  \set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
  \set Staff.midiPanPosition = 1
  sol la8 (si do si)
  si(la) la4 la
  la si8-1(do re do)
  do(si) si 4 si 
  si do8(re mi re)
  \break
  dos(la) do4.(si8)
  si-3 (la) la\( (sol) la (si)\)
  sol4 r r
  \bar ":..:"
  
  la-0 si8(do re do)
  las8-1(si-1)si4 r
  \break 
  re8(si)sol'(re do si)
  re(si)la4 r
  sol-1 la8(si do si)
  la4 si8-1 (do re do)
  si(re) sol,4--(fas--)
  sol r r
  \bar ":..:"
  \key do \major 
  
  \break
  \tempo "Trio"
  sol2.
  sols8(la)la4.(re8)
  do (si la-0 sol!-1 la si)
  do mi(re do si la)
  sols2 la8-0(mi'-4)
  
  \break
  fas,2 sol!8(re')
  re(do) do\((la) sol (fas)\) 
  sol4 r r 
  \bar ":..:"
  si2 \downbow (do4)
  \tuplet 3/2 { re8(si)sol} fa!4(mi)
  
  \break
  si'2(do4)
  \tuplet 3/2 { re8(si )sol } fa4(mi)
  sol2.
  sols8(la)la4.(re8)
  do8(si la-0 sol!-1 la si)
  do4 r r
 

  \bar ":|."
}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"
  \set Staff.midiPanPosition = -1
  r4 r sol \upbow
  re' r8 re(dos re)
  re4 r re
  
  sol r8sol8(re la)
  sol4 r sol'8(fas)
  
  mi(la mi fas) sol4
  sol8(re) r4 re
  sol,8(sol') re si sol4
  \bar ":..:"
  fas'8(re fas re fas re)
  sol (re sol re sol re)
  sol(re) si' (re, sol re)
  si'-1 (sol) fas4 re
  r sol, sol'(sol) fas8(mi)fas4
  sol si, re
  sol re sol,
  \bar ":..:"
  \key do \major 
  mi' r mi
  fa r fa 
  re sol fa
  mi r r
  r8 re-2 \downbow (mi re dos4)
  r8 do!-1(re do si4)
  do r re 
  sol,8(sol') re si sol4
  \bar ":..:"
  \tuplet 3/2 { sol8(si)re }  fa4(mi)
  si2(do4)
  \break
  \tuplet 3/2 {sol8(si)re} fa4(mi)
  si2(do4)
  mi do mi 
  fa do fa
  re sol--(sol,--)
  do8(mi)sol mi do4

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