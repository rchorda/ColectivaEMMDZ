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
  title = "The Winner Takes It All"
  %subtitle = "Ave Maria"
  composer = "ABBA"
  %meter = "1"
}


global= {
 
  \key sol \major
  \time 4/4
  %\tempo "Allegro"
  \tempo   4 = 120
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
 %\tupletSpan 2
 
 
 
 
% \mark \markup \box \smaller "D"
% <<   { do2 do }     { r16 mi8.~mi4 r16 mi8.~mi4 }     { r8 sol16 do mi sol, do mi r8 sol,16 do mi sol, do mi }   >>
    \bar ".|:"
    \repeat volta 2 { 
re8 sol re sol re sol re sol 
re si re si mib-1 \bajar  si-3 la-2\bajar mib'-1 
si-2 \subir mi-1 si mi si mi si mi 
\break
si-2 sol-0 si sol si-2 sols-1\bajar si sols
do mi la mi la mi la mi
do mi do mi do mi do mi
\break
re-0 la re la re la re la 
    }
    \alternative {
      {fas'8 la, fas' la, fas'2}
      {fas8 la fas la fas2}
    }
    fas1
    \break
    \set Score.currentBarNumber = #18
    \repeat volta 2 {
    r4 si4. \downbow la
    do si8 ~si2
    r4 re,4.-4 \downbow dos
    mi re8~re2
    \break
    r4 do4. \downbow si
    re do8 ~do2
    r4 fas4. mi
    sol fas8~fas2
    \break
    r4 si4. \downbow la
    do si8 ~si2
    r4 re,4.-4 \downbow dos
    mi re8~re2
    \break
    r4 do4. \downbow si
    re do8 ~do2
    r4 fas4. mi
    sol re8 \upbow re(do'-4)do8.(si16)
    \break
    si2. r4
    r r8 si, si (la') la (sol)
    sol2. r4
    r r8 mi \upbow mi(re') re (do) 
    \break
    do1
    ~do4 do4\upbow ~do8 (si) la \downbow si\upbow
    do1 \downbow
    
    }
 %  \alternative {
 %     {   \set Score.repeatCommands = #'((volta "1")) do4\downbow  r re,8 (mi) fas (sol)}
 %     { \set Score.repeatCommands = #'((volta "2,3")) 
 %       do4\downbow r re,8 (do') do8. (sol16)} 
 %   }
  \alternative {
    { do4\downbow  r re,8 (mi) fas (sol)}  % Casilla 1
    { do4\downbow r re,8 (do') do8. (sol16) }  % Casillas 2 y 3
  }
    \bar "||"
    si2. r4
     r r8 si, \upbow si (la') la (sol)
    \break
    
    sol2. r4
    r r8 mi mi(re') re (do) 
    %\break
    do1    
    ~do4 r8 do8 \upbow do (si) la (si)
    do1
    ~do4 r8 re,\upbow re (mi) fas8. (sol16)
\bar ":|."

%\bar "|."
}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"


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
