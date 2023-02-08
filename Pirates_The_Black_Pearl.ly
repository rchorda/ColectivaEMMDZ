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
 
  \key fa \major
  \time 3/4
  %\compressFullBarRests
}


violinOne = \new Voice \relative do'  {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
  %\markup \box "167"
  
  \set Score.currentBarNumber = #96
  \mark \markup \box \smaller "96"
  %\mark \markup "One Last Shot" 
  \tempo  "Faster and Driving" 4 = 150
  re4-. \downbow \mf re8-. \downbow mib-. re8-.  mib-.
  re4-. \downbow \mf re8-. \downbow mib-. re8-.  mib-.
  re4-. \downbow \mf re8-. \downbow mib-. re8-.  mib-.
 \break
  re4-. \downbow \mf re8-. \downbow mib-. fa8-.  mib-.
  
  re4-. \downbow \mf re8-. \downbow mib-. re8-.  mib-.
  re4-. \downbow \mf re8-. \downbow mib-. re8-.  mib-.
  re4-. \downbow \mf re8-. \downbow mib-. re8-.  mib-.
  re4-. \downbow \mf re8-. \downbow mib-. fa8-.  mib-.
 
  re4-.  re-.\upbow re-. \downbow
  \break
   <re re'>2. \<  \accent
   <mi mi'> \accent
   <fa fa '> \accent
   <sol sol'>4  <la la'>  <sib! sib'!>
   <la-0 la'-1>4^\markup {\bold "III"}  <sib!-1 sib'!-2>  <dos-2 dos'-3>
   
  \mark \markup \box \smaller "110"
  %\mark \markup "One Last Shot" 
  \tempo  "A Little Faster" 4 = 150
   <re-3 re'-4> \accent \ff \downbow re,8 \downbow\f mi fa re
   mi4-. re-.\upbow do-.\upbow
   \break
   re \accent  \downbow re8\upbow mi fa re
   mi4-.\upbow fa-. \downbow sol-.\upbow
   sol \accent  \downbow sol8\upbow la sib re,
   fa4-. \upbow mi-. \downbow re-.\upbow
   mi4-. re-.\upbow do-.\upbow
   re8 \downbow\mf \< re fa fa la la
   \break
   \mark \markup \box \smaller "118"
   re4 \accent\f  \downbow re8\upbow mi fa re
   mi4-. \upbow re-.\downbow do-.\upbow 
   re4 \accent\f  \downbow re8\upbow mi fa re
   mi4-.\upbow fa-. \downbow sol-.\upbow
   sol \accent  \downbow sol8\upbow la sib re,
   fa4-. \upbow mi-. \downbow re-.\upbow
   \break
   mi4-. re-.\upbow do-.\upbow
   re8 \downbow re, fa fa la la 
   re, \< re fa fa la la 
   
   \mark \markup \box \smaller "127"
   la4\accent \ff r4 \tuplet 3/2 {re,8\upbow (mi fa)}
   sib4\accent r \tuplet 3/2 {re,8\upbow (mi fa)}
   la4-^ \downbow  la-^ \downbow  la-^ \downbow
   \break
   la8\downbow \accent sol \upbow\accent r4 r
   sol \accent r  \tuplet 3/2 {la,8 \upbow (re mi)}
   fa4 \accent r  \tuplet 3/2 {la,8 \upbow (re mi)}
   mi4 \accent fa \accent r8 mi \upbow 
   re re fa fa la re 
   \mark \markup \box \smaller "135"
   la'4\accent r \tuplet 3/2 {re,8\upbow (mi fa)}
   \break
   sib4\accent r \tuplet 3/2 {re,8\upbow (mi fa)}
   la4-^ \downbow  la-^ \downbow  la-^ \downbow
   la8\downbow \accent sol \upbow\accent r4 r
   
   la,,8\mp \< la si si dos dos 
   re re mi mi fa fa
   sol la si dos re <do mi>
   <re fa>\ff
   
   
   
   
  
%  \mark \markup \box \smaller "181"
 % \tempo  "Modelately Fast With Drive" 4 = 150
  

  
 % \bar "|." 
  
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
