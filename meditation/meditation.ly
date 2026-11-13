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
  title = "Meditation"
  subtitle = "Ave Maria"
  composer = "J.SBach / Ch. Gounod"
  meter = "1"
}


global= {
 
  \key do \major
  \time 4/4
  %\tempo "Allegro"
  \tempo   4 = 60
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
 
 
 
 
 \mark \markup \box \smaller "D"
% <<   { do2 do }     { r16 mi8.~mi4 r16 mi8.~mi4 }     { r8 sol16 do mi sol, do mi r8 sol,16 do mi sol, do mi }   >>

R1*4
\break
mi1 \upbow \p
fa
sol2.(re4)
mi2~mi4 r
\break
la2-4\downbow ~la8 la,\upbow(si do)
re4..-2 \tercera (mi16)  re2
sol2-3 \primera ~sol8 sol,(la si)
do4.. (re16)  do2
\break
do'2-4 \tercera ~do8do,-1( re mi)
fas4.(mi8) re4(la-1 \primera)
si2~si8 r re4 \upbow \mp
\break
\mark \markup \box \smaller "E"
mi2 ~mi8 mi (fa! sol )
la2-4 la,4 r
re2 ~re8 re(mi fa) 
sol2 sol,4 r
\break
do2 \p ~do8 \< do (re mi) \!
fa2 ~fa8 \< fa (sol la) \!
si4. \mf(la8) sol4 \> (re)
mi2 \! ~mi4 r8. mi16-. \upbow \mf
\break
\mark \markup \box \smaller "F"
sol2 \cresc mi4 r8. mi16 \upbow
la2 la,4 r8. la'16 \upbow
la2 do,4 r8. la'16\upbow

do2 mib,4-1\bajar r8. do'16\upbow \f
do2 re,4-0 r8. re16-4  \upbow \p
\break
re2 ~re8 re (do si) 
sol'4. (mi8) do4 r
\break
fa2 \mf ~fa8 fa (mi re)
re'4. (si8) sol2
la2-0 \f ~la8 \< la (si do)
mi2-0 \ff ~mi8\> do (sol mi)
\break

re2 ~re8  la' (si la)
la re si sol \! fa \downbow (re) si sol 
do1 \upbow ~do \downbow
sol'1 \upbow ~sol \downbow

%\bar ":|."

%\bar "|."
}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"


    <<
    \new Voice = "Voz 1" { \voiceOne do2 do }
    \new Voice = "Voz 2" { \voiceTwo r16 mi8.~mi4 r16 mi8.~mi4 }
    \new Voice = "Voz 3" { \voiceThree r8 sol16 do mi sol,16 do mi r8 sol,16 do mi sol,16 do mi }
  >>
  <<
    \new Voice = "Voz 1" { \voiceOne do,2 do }
    \new Voice = "Voz 2" { \voiceTwo r16 re8.~re4 r16 re8.~re4 }
    \new Voice = "Voz 3" { \voiceThree r8 la'16 re fa la,16 re fa r8 la,16 re fa la,16 re fa }
  >>
  <<
    \new Voice = "Voz 1" { \voiceOne si,,2 si }
    \new Voice = "Voz 2" { \voiceTwo r16 re8.~re4 r16 re8.~re4 }
    \new Voice = "Voz 3" { \voiceThree r8 sol16 re' fa sol,16 re' fa r8 sol,16 re' fa sol,16 re' fa }
  >>
    <<
    \new Voice = "Voz 1" { \voiceOne do,2 do }
    \new Voice = "Voz 2" { \voiceTwo r16 mi8.~mi4 r16 mi8.~mi4 }
    \new Voice = "Voz 3" { \voiceThree r8 sol16 do mi sol,16 do mi r8 sol,16 do mi sol,16 do mi }
  >>
  
    <<
    \new Voice = "Voz 1" { \voiceOne do,2 do }
    \new Voice = "Voz 2" { \voiceTwo r16 mi8.~mi4 r16 mi8.~mi4 }
    \new Voice = "Voz 3" { \voiceThree r8 sol16 do mi sol,16 do mi r8 sol,16 do mi sol,16 do mi }
  >>
  <<
    \new Voice = "Voz 1" { \voiceOne do,2 do }
    \new Voice = "Voz 2" { \voiceTwo r16 re8.~re4 r16 re8.~re4 }
    \new Voice = "Voz 3" { \voiceThree r8 la'16 re fa la,16 re fa r8 la,16 re fa la,16 re fa }
  >>
  <<
    \new Voice = "Voz 1" { \voiceOne si,,2 si }
    \new Voice = "Voz 2" { \voiceTwo r16 re8.~re4 r16 re8.~re4 }
    \new Voice = "Voz 3" { \voiceThree r8 sol16 re' fa sol,16 re' fa r8 sol,16 re' fa sol,16 re' fa }
  >>
    <<
    \new Voice = "Voz 1" { \voiceOne do,2 do }
    \new Voice = "Voz 2" { \voiceTwo r16 mi8.~mi4 r16 mi8.~mi4 }
    \new Voice = "Voz 3" { \voiceThree r8 sol16 do mi sol,16 do mi r8 sol,16 do mi sol,16 do mi }
  >>
  \oneVoice % Restablece las plicas a su posición predeterminada
 
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
