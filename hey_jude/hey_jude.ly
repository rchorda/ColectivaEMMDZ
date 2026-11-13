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
  title = "Hey Jude"
  composer = ""
  meter = "1"
}


global= {
 
  \key sol \major
  \time 4/4
  %\tempo "Allegro"
  \tempo   4 = 76
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
 
\partial 4
re' \upbow  si2 ~ si8 si (re mi) 
la,2.  la8 (si 
do4) sol'~sol8 sol (fas re)
mi (re16 do si2~ si8) re \upbow
\break
mi8 mi4 mi8\upbow la16 (sol8 fas16~fas sol mi8)
re2 sol,8 (la si mi-4~ mi) re4 \upbow re8 (do si4) fas8
sol2~ sol8 r8 re'4\upbow
\break 

  \mark \markup \box \smaller "A"
\bar ".|:" 
si2~\downbow si8 si (re mi)
la,2. la8 (si
do4) sol'~sol8 sol (fas re)
mi (re16do si2~si8) re \upbow
\break
mi8 mi4 mi8\upbow la16 (sol8 fas16~fas sol mi8)
re2 sol,8 (la si mi~ mi) re4 \upbow re8 (do si4) fas8
sol1
\break
r8 sol \upbow sol'\downbow( mi) mi\upbow\< (re) re\downbow do\upbow\! 

  \mark \markup \box \smaller "B"
mi4 \downbow sol8\downbow mi~\upbow mi4 sol8\upbow do,~\downbow
do4 sol'8\downbow mi\upbow~mi re\downbow do\upbow re~ \downbow
re4 mi8\downbow re\upbow~ re4 do4 \downbow 
(si8 la8 sol2.)

\break
r8 sol \upbow sol'\downbow( mi) mi\upbow (re) re\downbow do\upbow
mi4 \downbow sol8\downbow mi~\upbow mi4 sol8\upbow do,~\downbow
do4 sol'8\downbow mi~mi re\downbow do re~ \downbow
re4 mi8\downbow re~ re4 do4 \downbow 
(si8 la16 sol~sol4~sol8) sol\upbow(re' mi)
\break
\time 2/4
fa4--->\downbow fa --->
\time 4/4
fas!8->(sol) la4---> la2--->
r2 r4 re,16-> \>(mi8.)\!
\bar ":|."
\break
  \mark \markup \box \smaller "C"
si2~si8 si (re mi) 
la,2.  la8 (si 
do4) sol'~sol8 sol (fas re)
mi (re16 do si2~si8) re \upbow
\break
mi8 mi4 mi8\upbow la16 (sol8 fas16~fas sol mi8)
re2 sol,8 (la si mi~ mi) re4 \upbow re8 (do si4) fas8

sol1
  \mark \markup \box \smaller "D/E"
\bar ".|:" 

sol2 si4 (re)
la'16 sol la8 sol2.
la16 sol la8 sol2 fa16 mi8 re16~
re1

sol,2 si4 (re)
la'16 sol la8 sol2.
la16 sol la8 sol2 fa16 mi8 re16~
re1



\bar ":|."

%\bar "|."
}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"

\partial 4
  r4
  <si re>--->\mp <si re>---> <si re>---> <re sol>--->
  <la fas'>_\markup {sim.} <la fas'> <la fas'> <la fas'>
   <mi' sol>  <mi sol>  <mi sol> <do mi>
   <si re> <si re> <si re> <re fa>
   <mi sol>  <mi sol>  <mi sol> <do mi>
   <si re> <si re> <si re> <re sol>
   <fas la> <mi sol> <re fas> <do mi>
   <si re> <si re> re8---> r r4
   
  <si re>--->\mp <si re>---> <si re>---> <re sol>--->
  <la fas'>_\markup {sim.} <la fas'> <la fas'> <la fas'>
   <mi' sol>  <mi sol>  <mi sol> <do mi>
   <si re> <si re> <si re> <re fa>
   <mi sol>  <mi sol>  <mi sol> <do mi>
   <si re> <si re> <si re> <re sol>
   <fas la> <mi sol> <re fas> <do mi>
   <si re> <si re> <si re> <<  {re8~re}  {sol8(fas)}   >>
   <re fa>4 <si re> <re fa> <fa lab>\!
  
   <mi sol>--->\upbow <mi sol>---> <mi sol>---> <mi sol>--->
    <mi sol>_\markup {sim.}  <mi sol> <mi sol> <mi sol>
   <fas la> <mi sol> <re fas> <do mi>
   <si re> <si re> <si re> << {re8~re} {sol8( fas)} >>
   <re fa>4 <si re> <re fa> <fa lab>
     <mi sol>  <mi sol>  <mi sol>  <mi sol>
       <mi sol>  <mi sol>  <mi sol>  <mi sol>
   <fas la> <mi sol> <re fas> <do mi>
   <si re> <si re> <si re> si'8 (do)

 re4---> re re8->(mi) fas4---> fas2--->
 las8->(mi) do4---> \>do2---> \! 

  <si, re>4--->\mp <si re>---> <si re>---> <re sol>--->
  <la fas'>_\markup {sim.} <la fas'> <la fas'> <la fas'>
   <mi' sol>  <mi sol>  <mi sol> <do mi>
   <si re> <si re> <si re> <re fa>
   <mi sol>  <mi sol>  <mi sol> <do mi>
   <si re> <si re> <si re> <re sol>
   <fas la> <mi sol> <re fas> <do mi>
las8 (si~si2.)
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
