\version "2.19.83"
\language "español"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")


\header {
  title = "Der Freischutz"
  composer = "CH. Dancla, Op. 86, Nº2"
  %meter = "Allegro"
}


global= {
  
  \tempo "Largo sostenuto"
  %\tempo 4 = 50 

}

violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"

  \key do \major
  
  do1 \p \< 
  do'4. \f \< (si8re4) \! r
  la2 \p (fa4. re8)
  do2(si4) r \p
  sol1\<
  sol4. \f \<(fa8 la4) \! r
  \break
  fa'2 \p (re4. si8)
  la2(sol4) r

  


  \bar "|."
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
  \new StaffGroup <<
    \new Staff << \global \violinOne >>
    %\new Staff << \global \violinTwo >>
    %\new Staff << \global \viola >>
    %\new Staff << \global \cello >>
  >>
  \layout { }
  \midi { }
}