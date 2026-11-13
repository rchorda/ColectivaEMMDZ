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
  title = "The First Noel"
  composer = "Trad. Eng. Carol by Dans Forres"
  meter = "1"
}


global= {
 
  \key re \major
  \time 3/4
  %\tempo "Allegro"
  \tempo  "Rubato, with warmth and wonder" 4 = 76
}


violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
    \mark \markup \box \smaller "Intro."
 la''8 \p \downbow(re,)re2~
 re2.
 fas, \mp la si la\<   la 

 re4\downbow \!  \mf (dos) si
 la2. si2 (sol4)
 %\break
 mi2.~
 \break
mi2
 
  \mark \markup \box \smaller "A"
  fas8\upbow(mi)
% \break 
  re4.(mi8) fas(sol)
  la2 si8(dos)
  re4(dos) si
  la2 si8(dos)
  re4\downbow dos si
  la si dos
  re(la) sol
  fas2 fas8\upbow(mi)
  %\break
  re4.(mi8) fas(sol)
  la2 si8(dos)
  re4(dos)si 
  la2 si8\upbow (dos)
  re4\downbow dos si 
  la si dos
  re (la) sol
  \break
  fas2

\mark \markup \box \smaller "B"
  fas8\upbow(mi)
  re4.(mi8) fas (sol)
  %\break
  la2 re8(dos) 
  si2 si4
  la2~la4
  re\upbow  dos si 
  la(si) dos
  re(la) sol
  \break
  fas2

\mark \markup \box \smaller "B"
  fas8\upbow(mi)
  re4.(mi8) fas (sol)
  %\break
  la2 re8(dos) 
  si2 si4
  la2~la4
  re\upbow  dos si 
  la(si) dos
  re(la) sol
  \break
  fas2

  \mark \markup \box \smaller "A"
  fas8\upbow(mi)
% \break 
  re4.(mi8) fas(sol)
  la2 si8(dos)
  re4(dos) si
  la2 si8(dos)
  re4\downbow dos si
  la si dos
  re(la) sol
  fas2 fas8\upbow(mi)
  %\break
  re4.(mi8) fas(sol)
  la2 si8(dos)
  re4(dos)si 
  la2 si8\upbow (dos)
  re4\downbow dos si 
  la si dos
  re (la) sol
  \break
  fas2

\mark \markup \box \smaller "B"
  fas8\upbow(mi)
  re4.(mi8) fas (sol)
  %\break
  la2 re8(dos) 
  si2 si4
  la2~la4
  re \upbow dos si 
  la(si) dos
  re(la) sol
  \break
  fas2

\mark \markup \box \smaller "B'"
  fas'8-3 \tercera\upbow(mi)
  re4.(mi8) fas (sol)
  %\break
  la2 re8(dos) 
  si2 si4
  la2~la4
  re \upbow dos si 
  la(si) dos
  re(la) sol
  \break
  fas2 r4
 \mark \markup \box \smaller "Coda" 
  re'-4 \upbow\tercera dos si 
  la(si) dos
  re(re) re
  re2

 
 
  
  
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
