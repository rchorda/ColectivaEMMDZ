\version "2.19.83"
\language "español"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")


\header {
  title = "Concierto para 2 violas en Sol mayor"
  composer = "G.P.Telemman"
  % meter = "Allegro"
}


global= {
  \time 4/4
  \key sol \major
  \tempo "Andante"

}

violinOne = \new Voice \relative do'' {
  \set Staff.instrumentName = #"Violin 1 "

 
}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"

 sol'16 (la) si (do) si8 la sol16 (la) si (do) si8 la
  sol la16 (si) do (si) la (sol) sol8 fas16 (sol) la (si) do (la)
  si (la) sol (la) si8 la sol16(la) si (la) sols (si) la (sols)
  \break
  la-0 (si) do (si) la8 la la16 (do) la (sol) fas (la) sol (fas)
  <<
    { s16  s16 \turn }
    { sol8 sol16 la }
  >> fas8. sol16 sol4 r
  
  
  r1
  sol16 (la) si (do) si8 la sol16(la)si(do)si8 la
  \break
  sol4 r r2
  r1
  r8 la16 \upbow (sol) fas (sol32 la) sol16(fas) sol4 r
  r1
  r1
  sol16 (fas) mi(fas)sol8 fas mi sol16(fas) mi(re')do(si)
  \break
  do16(si)la(si)do8 do res, fas16(mi)res!(fas)mi(res!)
  mi8. (fas16) res8. (mi16--) sol4 r
  si16(fas)sol(la) sol8 fas mi4 r
  r2 sol16(la)si(do)si8 la
  \break
  sol4 r r2
  r1 r1
  si16(la)sol(la) si8 la sol4 r
  \break
  la16(si)do(si)la8 sol fas4 r
  si16(do)re(mi)re8 do si16(do)re(mi) re8 do
  sol8. la16 fas8. sol16 sol2


  \bar "|."

}


viola = \new Voice \relative do' {
  \set Staff.instrumentName = #"Viola "
  \set Staff.midiInstrument = "viola"
  \clef alto



}


\score {
  \new StaffGroup <<
    %\new Staff << \global \violinOne >>
    \new Staff << \global \violinTwo >>
    %\new Staff << \global \viola >>
    %\new Staff << \global \cello >>
  >>
  \layout { }
  \midi { }
}