\version "2.19.83"
\language "español"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")


\header {
  title = "III Posizione"
  %composer = "Edward Elgar"
  meter = "15"
}


global= {
 
  \key sol \major
  \time 3/4

}

violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"

  \key sol \major		mi16-3 \downbow \mp (sol-1) si---3 mi---2 sol4 (fas8 sol)
  mi16-2(fas) sol-- mi-- la4-1(si8 do)
  si16(do) si-- la-- sol8 fas mi(res)
  mi16(res) mi-- fas-- sol--  fas--sol--la--si4--
  \break
  si16(la) fas res si4 (do8 si)
  mi16(res)mi fas sol la si do si4--
  re16(do)la fas re4(mi8 fas)
  sol16(fas)sol la si8 do re4--
  \break
  do8 si16 la do8 la do(mi,)
  si' la16 do si la sol fas sol8(sol,)
  la sol16la si8 la16do si la sol fas
  mi8 fas16 res mi8 fas16 mi res dos res fas
  mi4 r r 
  
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