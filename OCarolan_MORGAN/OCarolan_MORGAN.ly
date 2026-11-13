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

G    =   <sol' si' re''>1^G
Am =   <la' do'' mi''>1^Am
D    =   <re'' fas'' la''>1^D
Em =   <mi' sol' si'>1^Em
C =      <do'' mi'' sol''>1^C
Bm =   <si' re'' fas''>1^Bm

Gd    =   <sol' si' re''>2^G
Amd =    <la' do'' mi''>2^Am
Dd    =     <re'' fas'' la''>2^D
Emd =    <mi' sol' si'>2^Em
Cd =    <do'' mi'' sol''>2^C
Bmd =   <si' re'' fas''>2^Bm

\header {
  title = "(20) Morgan"
  %composer = "O'Carolan"
  %meter = "1"
}


global= {
 
  \key sol \major
  \time 4/4
  %\tempo "Allegro"
  \tempo   4 = 110
}


violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
 
 re'1-1 \tercera re mi-2 la-1
 \break
 re,-1 si-3 sol'-4 la-1
\break
re,2 la' re,1 mi-2 fas2-3\subir sol-4\bajar
\break
re1 sol2-4 la re, la' re,1
\break
re si-3 re sol2-4 la 
\break
re,1 mi2 re mi1 la
\break
sol sol la la re,
\break
fas2 la re, la' re,1
\bar "|."
}

violinTwo = \new Voice {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"

  \G \G \Am \D 
  \G \Em \C \D
  \Gd \Dd \G \Am \Bmd \Cd
  \G \Cd \Dd \Gd \Dd \G
  \G \Em \G \Cd \Dd
  \G \Amd \Gd \Am \D
  \C \C \D \D \G
  \Cd \Dd \Gd \Dd \G

  
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
