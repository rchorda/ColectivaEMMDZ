\version "2.20.0"
\language "español"
\include "articulate.ly"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")
subir = ^\markup \char #8593
bajar = ^\markup \char #8595
primera =  _\markup {\bold "I"}
segunda =  _\markup {\bold "II"}
tercera =  _\markup {\bold "III"}
cuarta =  _\markup {\bold "IV"}
quinta =  _\markup {\bold "V"}
sexta =  _\markup {\bold "VI"}

\header {
  title = "4th pos. Etude"
  composer = ""
  meter = "36"
}


global= {
 
  \key la \major
  \time 3/4
  \tempo "Moderato"
}


violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
  
  la'8-.-1_\markup {\italic spiccato} si-. dos-. la-. re-.-4 si-.-2
  mi-.-1_\markup {\italic simile} fas-. sols-. la-. sols-. fas-.
  mi-. dos-.-3 mi-.-1 la-.-4 dos-.-2\subir si-.-3
  la-. sols-. fas-. mi-. re-. dos-.
  si-.-2 dos-.\subir re-. si-. mi-.-1 dos-.-3
  re-. mi-. fas-. sols-. fas-. mi-.
  \break
  re-.-4 mi-.-1 sols-. si-.-1 re-. dos-.
  si-. la-. sols-. fas-. mi-. re-.
  dos-.-3 mi-.-1 la-.-4 dos-.-2 mi,-.-1 mi'-.-4
  re-.-3 si-.-1 sols-.-3 fas-. mi-. re-.
  dos-.-3 mi-.-1 la-.-4 dos-.-2 mi,-.-1 mi'-.-4
  re-.-3 si-.-1 sols-.-3 fas-. mi-. re-.
  \break
  dos-.-3 mi-.-1 la-.-4 dos-.-2 mi,-.-1 mi'-.-4
  res-.-3 sis-.-1 sols-.-3 fas-.  mi-.  res-.-4  
  dos-.-3 mi'-.-4 dos-.-2 sols-.-3 mi-.-1 sols-.-3 
  dos,2 r4 
  
  la8-.-1 si-. dos-. la-. re-.-4 si-.-2
  mi-.-1 fas-. sols-. la-. sols-. fas-.
  mi-. dos-.-3 mi-.-1 la-.-4 dos-.-2\subir si-.-3
  la-. sols-. fas-. mi-. re-. dos-.
  si-.-2 dos-.\subir re-. si-. mi-.-1 dos-.-3
  re-. mi-. fas-. sols-. fas-. mi-.
  re-.-4 mi-.-1 sols-. si-.-1 re-. dos-.
  si-. la-. sols-. fas-. mi-. re-.
  \break
  dos-.-3 mi-.-1 la-.-4 dos-.-2 mi,-.-1 mi'-.-4
  mi,-. re'-.-3 mi,-. si'-.-1 mi,-. mi'-.-4
  dos,-.-3 mi-. la-. dos-. mi,-. mi'-.
  mi,-. re'-.-3 mi,-. si'-.-1 mi,-. mi'-.-4
  dos-.-2 mi-.-4 re-. dos-. si-. la-. 
  fas-.-2 la-.-4 sols-. fas-. re-.-4 si-.-2
  \break
  mi-.-1 fas-. sols-. la-. sols-. fas-.
  mi-. fas-. mi-. re-. dos-. si-.
  la2-1 mi8-2 fas16 sols
  la2 mi8-2 fas16 sols
  la8-.-1 dos-. mi-.-1 la-. dos-.-2 mi-.-4 
  <mi,-1 dos'-2>4 r r
 \bar "|." 

}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"

  la'4 mis fas8-. re-.
  <dos la'>4 r <re la'>-.
  <dos la'>4-. r <mis la>-.
  <dos fas>4-. r <fas las>-.
  
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
