\version "2.24.2"
\language "español"
\include "articulate.ly"
#(set-global-staff-size 17)  % Ajusta el número para cambiar el tamaño

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

g    =   re''1-1
am =   mi''1-2
d    =   la''1-1
em =   si'1-3
c =      sol''1-4
bm =   fas''1-3\subir

gd    =   re''2-1
amd =   mi''2-2
dd    =   la''2-1
emd =   si'2-3
cd =      sol''2-4
bmd =   fas''2-3\subir

\header {
  title = "(19) EL MAR DEL ARPA"
  %composer = "O'Carolan"
  %meter = "1"
}


global= {
 
  \key sol \major
  \time 4/4
  %\tempo "Allegro"
  \tempo   4 = 110
}


violinOne = \new Voice  {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"

 R1 \tercera \em \em \em \em
\break 
\em \d \em \em \g 
\break
\g \am \am \cd \bmd \em
\break
\cd \bmd \em \bar ":|.|:" \em \d \g 
\break
\d \cd \bmd \em \cd \bmd \em \bar ":|."
\break
\em \em \em \em \em
\break
\d \em \em \g \g 
\break
\am \am \cd \bmd \em \cd \bmd 
\break
\em \cd \ritpoco \bmd \em \! \bar "|."

 
}

violinTwo = \new Voice {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"

R1 \Em \Em \Em \Em
\Em \D \Em \Em \G
\G \Am \Am \Cd \Bmd \Em
\Cd \Bmd \Em \bar ":|.|:" \Em \D \G 
\D \Cd \Bmd \Em \Cd \Bmd \Em \bar ":|."
\Em \Em \Em \Em \Em
\D \Em \Em \G \G 
\Am \Am \Cd \Bmd \Em \Cd \Bmd 
\Em \Cd  \Bmd \Em
 
  
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
