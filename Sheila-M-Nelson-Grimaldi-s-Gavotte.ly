\version "2.19.83"
\language "espanol"

\header {
  title = "Grimaldi‘s Gavotte"
  subtitle = "Gavotte II"
  composer = "Sheila M. Nelson"
  meter = "Allegreto-moderato"
}

global= {
  \time 4/4
  \key sib \major

}

violinOne = \new Voice \relative do'' {
  \set Staff.instrumentName = #"Violin 1 "

 

  \bar "|."
}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"
  
  \bar ".|:" 
  \partial 2 sib'4 \p \downbow do8-. ( do-.) |
  sib2 mib,4-. (sol-.)
  \tuplet 3/2 { fas8 mib! re } \tuplet 3/2 { do sib la } sol4 sol'
  do sol r8 sol4 sol8
  %\break
  sol4 (fas) sib do8-. do-. 
  sib2 mib,4-. sol-. 
  fas2 r8 mib'4 \< \downbow re8
  do8 ( sib) la (sib) \! r  sib \pp(la) la-.
  sib2 
  
  \bar ":|." 
  %\break
  \bar ".|:" 
  re8 \upbow \mf (mib) re do
  sib la \< sol fa \! mib4 fa
  sol \> sol \! \tuplet 3/2 {mib'8 re do} \tuplet 3/2 { sib la sol}
  fa4 fa sol sol
  %\break
  la2 \> sib4 \mp do8-. do-.
  sib2 mib,4 sol
  fas2 \tuplet 3/2 {mib'8  \< re do} \tuplet 3/2 { sib la sol}
  \tuplet 3/2 { fas sol la} \tuplet 3/2 {sib do mib} re8 \f re dos re
  sib2
  \bar ":|." 

}

viola = \new Voice \relative do' {
  \set Staff.instrumentName = #"Viola "
  \set Staff.midiInstrument = "viola"
  \set Staff.midiPanPosition = -1
  \clef alto

 
  %la2\bar ":..:" 
  sol'4\p\downbow la8(-. la8)-. | %compass 18
  la2 fa8 mib8 \tuplet 3/2 { re8 mib8 fa8 } | %compass 19 ctrl+3 tresillos
  re2 do\rest
  \break
  \set Score.currentBarNumber = #21
  \tuplet 3/2 { sol'8 lab sol } \tuplet 3/2 { mib8 fa sol } mib8( re8) \tuplet 3/2 { do8 sib la } | %compass 21
  \tuplet 3/2 { re8 mib re } \tuplet 3/2 { do8 sib la } sol4 la8-.( la-.) |% compass 22
  \break
  mib'2  la,4(-. la4)-. | % compass 23
  \tuplet 3/2 { re8 mib re } \tuplet 3/2 { do8 sib la } re8\rest do4\<\downbow re8 | %compass 24
  mib8( fa) solb( fa\!) re8\rest sol8\pp( fab) fab-. | %compass 25
  \break
  sol2 \bar ":..:"
  \bar ":..:" sib8\mf(\upbow do) sib la | % compass 26
  sol8 fa\< mib re\! do4 re
  mib\> re\! do2\rest
  \tuplet 3/2 { fa8 mib re } \tuplet 3/2 { do sib la } sol4 mib'
  \break
  \tuplet 3/2 { re8-> mib re } \tuplet 3/2 { do sib la\! } sol4\mp la8(-. la)-.
  sol4.  sol8 \tuplet 3/2 { sol' fa mib } \tuplet 3/2 { re do sib }
  \tuplet 3/2 { re8 mib re } \tuplet 3/2 { do sib la } \tuplet 3/2 { sol\< la sib } \tuplet 3/2 { do re fa }
  \tuplet 3/2 { mib re do } \tuplet 3/2 { sib la sol\! } sol'\f sol, sol' la
  mib2%\bar "|."
}

cello = \new Voice \relative do' {
  \set Staff.instrumentName = #"Cello "
  \clef bass

 
  \bar "|."
}

\score {
  \new StaffGroup <<
    %\new Staff << \global \violinOne >>
    \new Staff << \global \violinTwo >>
    \new Staff << \global \viola >>
    %\new Staff << \global \cello >>
  >>
  \layout { }
  \midi { }
}
