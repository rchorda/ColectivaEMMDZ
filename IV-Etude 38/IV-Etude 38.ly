\version "2.24.2"
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
  title = "4th pos. Etude"
  composer = ""
  meter = "38"
}


global= {
 
  \key do \major
  \time 3/4
  \tempo "Allegro"
}


violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
  
  do mi sol,   
  do'-3 \f mi sol
  mi8 do si2
  re4-4 mi-1 fa
  sol8 la sol2
  mi'4-4 sol,-3 do-2
  la8-4 sol fa2
  la,4-1 si re 
  do2 r4
  \break
  do8-3 \mf _\markup {\italic legato} (re mi-1 fa sol la-4)
  sib4-1\bajar (sol-3 mi-1)
  fa8 (sol la-4 sib-1 do re)
  mib4 (do-2 la-4)
  sib8-1 re fa,2-2
  mi8-1sol sib,2
  la8-1(do-3 fa-2 la-4 sol fa)
  mi-1 \<  _\markup {\italic poco rit.}(re) re-4(do) do-3(si)  \!
  
  
  do4-3 \f_\markup {\italic a tempo} mi sol
  \break
  mi8 do si2
  re4-4 mi-1 fa
  sol8 la sol2
  mi'4-4 sol,-3 do-2
  la8-4 sol fa2
  la,4-1 si re 
  do2 r4
  
  
 \bar "|." 

}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"

  r1

  
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
    \new Staff << \global \violinTwo >>
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
