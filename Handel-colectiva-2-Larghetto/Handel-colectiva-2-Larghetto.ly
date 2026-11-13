\version "2.19.83"
\language "español"
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
 
  \key sib \major
  \time 3/4
  \tempo "Largo"
}


violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"

  sib'2. \p (sib4) la sol8.(fa16)
  fa2.
  sol4 la sib16(do re8)
  do2. 
  sol'-4_\markup {\bold "III"} \f
  fa2-3 r4
  mib2.-2 \p 
  re2-3 r4
  \break
  sib'!-2 \f  sib la-1 \upbow
  sol4.-4 fa8-3 fa4(fa8) mi-2 fa-3(mi) fa(mi)
  fa2.-3
  mib!8-2(re-1) do4.-2 _\markup {\bold "I"}sib8
  sib4 \breathe fa'2 \mf \upbow
  fa2.-3 _\markup {\bold "III"} \downbow (fa4) re-1 do8.-4(sib!16-3)

\break
  sib2.-3\>
  fa4 \p fa mib
  re2.
  sol4 la sib16(do re8)
  do4. sib8 do4
  sol' \< sol la \upbow
  sib4. \! (fa8) fa4
  r8 sol \> \upbow mib4.(re8)\!
  \break
  re2 sib4\p\upbow
  mib mib mib
  fa sib, sib
  mib \mf mib re 
  do4. sib8 sib4
  la' la sol \upbow
  fas4.(sol16 fas) sol4
  \break
  r8 do, \upbow la4.(sol8)
  sol4 mib'2 \cresc
  (mib4) re8 do re4
  do8. sib16 do4 sol'
  (sol) fa mib8.(re16)
  re2 r4
  sib' \f \downbow sib la
  \break
  sol4. fa8 fa4
  fa8 mi mi4. mi8
  fa4. sol8 fa4
  mib!8(re) do4.^"rit." la'8
  sib2. \fermata
  do,16 \p \upbow(re mib8) re4(do8.) sib16 \downbow
  \break
  sib2. \<
  sib'4\f sib la
  sol4. fa8 fa4
  fa8 mi mi4. mi8
  fa4. sol8 fa4
  mib!8^"rit."(re) do4. sib8
  sib2.


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
  %\layout { }
  \layout {
  \context {
    \Voice
    \consists "Horizontal_bracket_engraver"
  }
}
  \midi { }
}
