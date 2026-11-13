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
  title = "Gloria in Excelsis Deo"
  composer = "Jerry Estes"
  meter = "1"
}


global= {
 
  \key fa \major
  \time 4/4
  %\tempo "Allegro"
  \tempo   4 = 110
}


violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
 
 %main
 la'8-3 \segunda \downbow la sol la4 sol8 la4
 sib la sol2

 %main
 la8 \downbow la sol la4 sol8 la4
 sib la sol2

 %main 8ª up
 la'8-2 \downbow la sol la4 sol8 la4
 sib la sol2

\break

fa,8-1 fa fa fa sol-2 sol do-1 do
do do fa-4 fa  do'4-4 r
 r la,-3 \downbow r8 la4 \upbow la8 \upbow
 r4 fa-1 \downbow r8 fa4 \upbow fa8 \upbow
 r4 fa-1 \downbow r8 fa4 \upbow fa8 \upbow
 r4 sol-2 \downbow r8 sol4. \upbow 
 \break
 r4 la-3 \downbow r8 la4 \upbow la8 \upbow
 r4 fa-1 \downbow r8 fa4 \upbow fa8 \upbow
 r4 fa-1 \downbow r8 fa4 \upbow fa8 \upbow
 r4 <sol-2 mi-4> r8 <sol mi>4  <sol mi>8 
 
 r4 lab-3 \downbow r8 lab4 \upbow lab8 \upbow
 r4 lab-3 \downbow r8 lab4 \upbow lab8 \upbow
 \break
 
 r4 lab-3 \downbow r8 lab4 \upbow lab8 \upbow
 r4 lab-3 \downbow r sol \upbow
 
 r8 \p la-3 \downbow do-1 fa-4~ fa sol,8-2do fa-4~
fa sib,-4(do)fa-4 ~
fa la,-3(do)fa  -4~
fa sol,-2(do)fa-4~
fa sol,-2(do)fa-4~
fa sol,-2(do)mi-3 ~
mi sol,-2(do)mi-3
  
  do2-1\downbow do
  do do 
  do1
  (do2.) r4
  
  r8 \primera do, mib lab~
lab sib,! mib lab~
lab reb,(mib)lab~
lab do, mib lab~
lab sib,! mib lab~
lab   sib, mib lab
 sol sib,! mi sib sol'2 
 r4 \segunda sol8-2 sol (sol2)
 
 fa8-1  fa fa fa sol-2 sol do-1 do
do do fa-4 fa  do'4-4 r
  
 r la,-3 \downbow r8 la4 \upbow la8 \upbow
 r4 fa-1 \downbow r8 fa4 \upbow fa8 \upbow
 r4 fa-1 \downbow r8 fa4 \upbow fa8 \upbow
 r4 sol-2 \downbow r8 sol4. \upbow 
 %\break
 r4 la-3 \downbow r8 la4 \upbow la8 \upbow
 r4 fa-1 \downbow r8 fa4 \upbow fa8 \upbow
 r4 fa-1 \downbow r8 fa4 \upbow fa8 \upbow
 \break
 r4 <sol-2 mi-4> r8 <sol mi>4  <sol mi>8  
  
  r4 lab-3 \downbow r8 lab4 \upbow lab8 \upbow
 r4 lab-3 \downbow r8 lab4 \upbow lab8 \upbow
 r4 lab-3 \downbow r8 lab4 \upbow lab8 \upbow
 r4 lab-3 \downbow r sol \upbow

fa8 r r4 r2 
\break
 la'8-2 la la la~ la la la4
la,8-0 r r4 r2 
 la'8 la la la~la la la4
%la,8 r r4 r2

 fa,8-1 fa fa fa sol-2 sol do-1 do
do do fa-4 fa  do'4-4 r

sol8-1 la-2 la r r2
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
