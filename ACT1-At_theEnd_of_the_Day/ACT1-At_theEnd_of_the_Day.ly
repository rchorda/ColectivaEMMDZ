\version "2.24.2"
\language "español"
\include "articulate.ly"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")
rall =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall.")

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
  title = "ACT1 At the End of th Day"
  composer = "Heinrich Ernst Kayser"
  meter = "1"
}


global= {
 
  \key la \major
  \time 4/4
  %\tempo "Allegro"
  \tempo   4 = 90
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
% \tupletSpan 8
 
la''16(fas mi dos) la'16(fas mi dos) la'16(fas mi dos) la'16(fas mi dos)
la'16(fas mi dos) la'16(fas mi dos) la'16(fas mi dos) la'16(fas mi dos)
la'16(fas mi dos) la'16(fas mi dos) la'16(fas mi dos) la'16(fas mi dos)
la'16(fas mi dos) la'16(fas mi dos) la'16(fas mi dos) la'16(fas mi dos)
la'16(fas mi dos) la'16(fas mi dos) la'16(fas mi dos) la'16(fas mi dos)
\time 2/4
la'16(fas mi re) la'16(fas mi re) la'16(fas mi re) la'16(fas mi re)
si'\rall (fas mi re) si'(fas mi re)\!
\break
\time 12/8
do4 do8 r do do do4 do8 mi do do
do si do re4. si'8 r r mi, re mi 
\break
\time 6/8
fas mi fas sol4 r8 
\time 12/8
do,4 do8 r do do do4 do8 r do do do si re do2.  r4. 
\time 6/8
fas8 mi fas sol fas sol
\time 12/8
la, mi  dos r si'fas dos' la mi r re' dos 
\time 9/8
mi si fas fas' dos sols sols' re dos
\break
\time 12/8
fas dos fas, r fas' dos fas dos fas, r fas' dos 
fas dos fas, r fas' dos fas dos fas, r fas' dos
\break
  \mark \markup \box \smaller "A"
r fas, sols la si dos dos si la la sols fas 
sols fas4 r4. r2.
\break
r8 fas sols la si dos dos si la la sols fas 
fas4. r4. r r8 la si
\break
dos4 dos8~dos si la si4. r8 la si 
dos dos dos dos si la si4 si8 r la si
\break
dos4 dos8~dos si la si4. si8 la sols 
fas4. r r2.
\time 6/8 r8 fas fas fas la sols
\break
\time 12/8
sols8 fas4~fas8 fas sols sols(fas)sols' sols(fas)sols
r fas, sols la si dos dos si la la sols fas 
\break
sols fas4 r4. r2.
r8 fas sols la si dos dos si la la sols fas 
\break
fas4. r4. r r8 la si
dos4 dos8~dos si la si4. r8 la si 
\break
dos4 dos8 dos si la si4 si8 r la si
dos dos dos dos si la si4. si8 la sols
\break
fas4. r r2.
\time 6/8
r8 fas fas fas la sols
\time 12/8
sols fas4 r4. r2.
\break
 \mark \markup \box \smaller "B"
\key fa \major
r8 fa sol la sib do do sib la la sol fa 
sol fa4 r4. r2.
\break
r8 fa sol la sib do do sib la la sol fa 
fa4. r4. r r8 la sib
\break

\mark \markup \box \smaller "SOPRANOS"
la4 fa'8~fa  fa fa mi4. do4 do8
do do do do sib la do4 do8 r4.
\break 
reb solb fas reb 
reb solb fa4 r8 r4 reb8
\break
\time 6/8
mib8 mib mib mib(reb)do
\time 12/8
mib2.(<sol mib>)
\time 6/8
r8 sib, sib sib lab sol


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
