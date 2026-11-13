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
 
  \key mib \major
  \time 2/4
  %\tempo "Allegro"
  \tempo   8 = 60
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
 \omit TupletBracket
  \tupletDown \tuplet 3/2 {
    
  \set baseMoment = #(ly:make-moment 1/16)
  \set beatStructure = 2,2,2,2
 %main
mib16 \mf \< fa sol lab sib do re mib fa sol lab sib \!
 }
 \omit TupletNumber
  \tupletDown \tuplet 3/2 {
 %main
lab16 \> sol fa mib re do sib lab sol fa mib re-0 \!
do \< re-4 mib fa sol la-0 si do re mib fa sol \!
\break
fas \>  mib re do sib! lab! sol fa mib re-4 do sib \!

lab\< sib do re-0 mib fa sol lab sib do re mib   \!
re \>do  sib \startTextSpan la-4 sol fa \stopTextSpan
 mib\startTextSpan  re-4 do sib \stopTextSpan la do \!
 \break
sib \< do re-0 mib fa sol\!\startTextSpan  lab! \> sol sib lab \stopTextSpan fa re-0 \!
 mib \< sol lab sib do re\startTextSpan  mib \> re fa mib \stopTextSpan do la-0 \!
 
 sib\< la-0 do sib re do mib re fa mi-0 sol fa \! \startTextSpan 
 
 lab\f sol sib lab \stopTextSpan mi-0 sol \decresc  fa \startTextSpan  do mib re \stopTextSpan la-0 do
sib \startTextSpan  sol  sib lab! \stopTextSpan mi \startTextSpan sol fa \stopTextSpan lab mib re-0 la do \! 
 sib \p\< do re-0 mib fa sol lab! sib do re mib fa \!
  }
 

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
