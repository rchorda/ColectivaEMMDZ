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
 \tupletSpan 8
 
%r1 r1 r1
r4 r8 dos' \upbow \mf dos4-- dos 
dos2. \downbow re8 si~si2 r8 si4\upbow(la8)
si4-- si8(la) dos4-- mi,8 fas~fas4 dos'8 dos dos dos dos4

dos2. \downbow re8 si~si2 r8 si4\upbow(la8)
si4-- si si dos8 la ~la fas4.~fas8 r r4

re8-.\downbow \mp re-. re-. r re-. r re-. mi-.
r mi-. r mi-. mi-. r mi-. r

mi8-.\downbow mi-. mi-. r mi-. r mi-. dos-.
r dos-. r dos-. dos-. r dos-. r

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
