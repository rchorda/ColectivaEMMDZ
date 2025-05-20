\version "2.24.2"
\language "español"
\include "articulate.ly"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")

ritpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "poco rit")
atempo =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "a tempo")
subir = ^\markup \char #8593
bajar = ^\markup \char #8595
primera =  _\markup {\bold "I"}
segunda =  _\markup {\bold "II"}
tercera =  _\markup {\bold "III"}
cuarta =  _\markup {\bold "IV"}
quinta =  _\markup {\bold "V"}
sexta =  _\markup {\bold "VI"}

\header {
  title = "Prueba.- Kayser 11"
  composer = "Heinrich Ernst Kayser"
  meter = "1"
}


global= {
 
  \key sib \major
  \time 3/4
  %\tempo "Allegro"
  \tempo   4 = 50
}


violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
  \override TextSpanner.dash-fraction = 1
  \override Staff.TextSpanner.bound-details =
    #`((left . ((Y . 0)
                (attach-dir . ,LEFT)
(padding . 0)
(text . ,(make-draw-line-markup
(cons 0 -1.)))
(stencil-align-dir-y . ,RIGHT))) )
 \tupletSpan 8
 
sol'4. \<(la16 sib do re mib! fa!)
solb4.- \> (fa16 mib re do sib la)\! 
 
sol4. \<(la16 sib do re mib! fa!)
solb4.- \> (fa16 mib re do sib la)\! 
 
sol4. \<(la16 sib do re mib! fa!)
solb4.- \> (fa16 mib re do sib la)\! 
 
sol4. \<(la16 sib do re mib! fa!)
solb4.- \> (fa16 mib re do sib la)\! 
 
sol4. \<(la16 sib do re mib! fa!)
solb4.- \> (fa16 mib re do sib la)\! 
 
sol4. \<(la16 sib do re mib! fa!)
solb4.- \> (fa16 mib re do sib la)\! 
\bar "|." 

}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"

 sol16 r16 r8  sol16 r16 r8 sol16 r16 r8 

 sol16 r16 r8  sol16 r16 r8 sol16 r16 r8 

 sol16 r16 r8  sol16 r16 r8 sol16 r16 r8 

 sol16 r16 r8  sol16 r16 r8 sol16 r16 r8 

 sol16 r16 r8  sol16 r16 r8 sol16 r16 r8 

 sol16 r16 r8  sol16 r16 r8 sol16 r16 r8 

 sol16 r16 r8  sol16 r16 r8 sol16 r16 r8 

 sol16 r16 r8  sol16 r16 r8 sol16 r16 r8 

 sol16 r16 r8  sol16 r16 r8 sol16 r16 r8 

 sol16 r16 r8  sol16 r16 r8 sol16 r16 r8 

 sol16 r16 r8  sol16 r16 r8 sol16 r16 r8 

 sol16 r16 r8  sol16 r16 r8 sol16 r16 r8 



  
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
