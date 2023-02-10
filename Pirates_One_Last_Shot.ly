\version "2.19.83"
\language "español"
\include "articulate.ly"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")


\header {
  title = "3 Menuetto - Violin I"
  composer = "G.F. Handel"
  meter = "4"
}


global= {
 
  \key do \major
  \time 3/4
  %\compressFullBarRests
}


violinOne = \new Voice \relative do'  {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
  %\markup \box "167"
  
  \compressMMRests {
  \set Score.currentBarNumber = #167
  \mark \markup \box \smaller "167"
  %\mark \markup "One Last Shot" 
  \tempo "Slow Rubato"
  R1*3/4*5 |
  r8 \p \< si (mi si') mi (sol) 
  \time 4/4
  la4-1_\markup {\bold "III"}  \f la8(si-2) do4-3 do8(mi-4) 
  %\break
  si4-2 la8-3_\markup {\bold "I"} (sol-2) sol16(la8.) mi8(sol)
  la4-3 la8-1_\markup {\bold "III"} (si) do4 do8(re-4)
  si4-4_\markup {\bold "I"} la8(sol) la2-1_\markup {\bold "III"}
  (la4) la8 do-2 re do sib la
  sol-4 fa-3 fa-3 mi-2 re4-1 re8-1 do-4
  re-1 mi fa sol la-1 re,-1 re fa-3
  mi1-2 \downbow \upbow
  \break
  \key fa \major
  \mark \markup \box \smaller "181"
  \tempo  "Modelately Fast With Drive" 4 = 150
  \time 12/8
  R1*12/8
  r2. r4. r8 la,, \ff do
  re4-. re-4-. re8 mi fa4-. fa-. fa8 sol
  mi4-. mi-. re8 do do \accent re r r la do
  \break
  re4-. re-. re8 mi fa4-.  fa-. fa8 sol
  mi4-. mi-. re8 do re4-.  r8 r8 la \downbow do
  re4-. re-. re8fa sol4-. sol-. sol8 la
  \break
  sib4-.  sib-. la8 sol la re, r r re mi 
  fa4-. fa-.  sol-. la8 re, r r re fa
   mi4-.mi-.  fa8 re mi4-. r8 r la \downbow do 
  \mark \markup \box \smaller "191"
   re4-. re-. re8 mi fa4-. fa-. fa8 sol
   \break
   mi4-. mi-. re8 do do \accent re r r la do
   re4-. re-. re8 mi fa4-. fa-. fa8 sol
   mi4-. mi-.  re8 do re4-. r8 r la\downbow do
   re4-. re-. re8 fa sol4-. sol-. sol8 la
   \break
  sib!4-.-4 sib-. la8 sol la re, r r re mi
  fa4-. fa-. sol-. la8 re,  r r re \downbow fa
  mi4-. mi-. fa8 mi re4-. r8 r4.
  \mark \markup \box \smaller "199"
  la'4\accent \downbow r8 r4. sib4\accent \downbow r8 r4.
  \break
  la4\accent \downbow la\accent  la \accent  la8\accent  sol\accent  r8 r4.
  sol4\accent \downbow r8 r4. fa4\accent \downbow r8 r4.
  mi4\accent \downbow fa\accent mi \accent re\accent  r8 re-1_\markup {\bold "III"}\upbow mi  fa
  la4-1 \accent r8 re,-1 mi fa sib4-4 \accent r8 re,-1 mi fa
  
  \break
  la4-1\accent \downbow la\accent  do-3 \accent  la8-3_\markup {\bold "I"}\accent  sol-2\accent  r8 r4.
  \mark \markup \box \smaller "205"
  la,,4-1 \mp \< si dos re mi fa
  fas sol sols la si dos
  re mi fa fas sol sols
  \break
  la \accent \downbow \ff r8 r4. sib4 \accent \downbow r8 r4.
  r4. la \accent \downbow sol4 \accent fa\accent fa8\accent\upbow mi\accent\upbow
  re4. \accent\downbow r sol,4\accent\downbow _"rit." fa \accent fa8\accent mi\accent
  re1.\accent \fermata
  
   \bar "|." 
  }
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
