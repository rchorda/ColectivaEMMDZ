\version "2.24.2"
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
  meter = "37"
}


global= {
 
  \key do \major
  \time 4/4
  \tempo "Moderato"
}


violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"
  la do mi la,
  la'2-1_\markup {\italic dolce}\cuarta \mp si4 do8 re
  do4 (la2) la4
  la'4. (sol8) fa4 sol8 mi
  fa4(re-4) r fa-2 \upbow
  mi-1(do) r mi \upbow
  re-4\< (do) si4. (la8) \!
  \break
  la2-1\f  si4 do8 re
  do4(la4.) dos8-3(mi-1 la)
  sol4\bajar(mi) fa(re-4)
  mi2-1 r4 la4-4\upbow \dim 
  fa(re-4) r sol-3 \upbow \mp
  \break
  mi-1 do8 la si4.(do8)
  do2 r4 sol'-3 \upbow
  mi-1 (dos2-3\subir) si8-2 la -1
  re-4 \cresc (mi fa sol) la4 la 
  fas-2\subir(res2-4) dos8 si
  \break
  
  mi-1(fas sol la) si4 mi-4
  res\>(si-1)\! re\>(si)\!
  dos-2\>(la-4)\!do-2\>(la-4)\!
  si-1(fa!-2\bajar) re-4(si-2 \subir)
  mi-1 r r8 \mf mi,(re mi) 
  fa2 la4-1 (si8 re)
  \break
  
  mi,2-2 r8 mi8\upbow(re mi)
  fa2 la4-1(si8 re)
  dos4\> (la)\!do4\> (la)\!
  si\> (fa-3) mi(sols)   \!
  la2-1 \mp  si4 do8 re
  do4(la2) la4
  \break
  
  la'4.-4(sol8) fa4 sol8 mi
  fa4(re) r fa\upbow
  re-4(si-2) r la'-4\upbow
  \<fa re8-4 si-2 mi4-1 re8 do \!
  sib4 do8 re la2-1
  (la4)\>  si!8_\markup {\italic {poco rit.}}do si4.(la8) \!
  la1 \fermata
 \bar "|." 

}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"

  r1
  r1
  la2 \mp si4 do8 re
  do4(la2) dos4
  re(mi) fa--(si,--)
  do(re)mi--(do--)
  si do8-1re << { \voiceOne  la'4(sols) }  \new Voice { \voiceTwo mi2}>> \oneVoice
  la,8(do) do(la)sols(re')re(si)
  la(mi')mi(do) la (mi')mi(dos)
  mi(la)la(mi)
  re(la')la(re,)
  do(la')la(sols) la(sol fa mi)
  re(sol)sol(fas)sol(fa mi re)
  do (sol')sol(fas) sol(fa16 sol fa8 re)
  mi(fa mi re) mi4 r
  
  r << { \voiceOne  sol4(mi) }  \new Voice { \voiceTwo la,2}>> \oneVoice dos4
  r <re la'>8([mi fa sol]) la4
  r << { \voiceOne la (fas) }\new Voice {\voiceTwo si,2}>> \oneVoice res4
  
  r <mi si'>8([ fa sol la]) si4
  << { \voiceOne si8 (dos res4) }\new Voice {\voiceTwo fas,2}>> \oneVoice
    << { \voiceOne si8 (do re4) }\new Voice {\voiceTwo fa,2}>> \oneVoice
  << { \voiceOne la8 (si dos4) }\new Voice {\voiceTwo mi,2}>> \oneVoice
    << { \voiceOne la8 (si do4) }\new Voice {\voiceTwo mi,2}>> \oneVoice
  << { \voiceOne sols8 (la si4) }\new Voice {\voiceTwo re,2}>> \oneVoice
    << { \voiceOne re8 (mi fa la) }\new Voice {\voiceTwo si,4 r}>> \oneVoice
  <mi sols> r r2
  r8 << { \voiceOne re8. }\new Voice {\voiceTwo si8 (la si) }>> \oneVoice
    << { \voiceOne re4 fa }\new Voice {\voiceTwo si,4 (la) }>> \oneVoice
  
  sols8 (si res mi) mi4 r
   r8 << { \voiceOne re8. }\new Voice {\voiceTwo si8 (la si) }>> \oneVoice
    << { \voiceOne re4 (fa) }\new Voice {\voiceTwo si,4 la8(sols) }>> \oneVoice
   << { \voiceOne mi'2  }\new Voice {\voiceTwo la,8(si dos4) ) }>> \oneVoice
    << { \voiceOne  mi2}\new Voice {\voiceTwo la,8(si do4) }>> \oneVoice
   << { \voiceOne la'2  }\new Voice {\voiceTwo re,8 (mi re4) ) }>> \oneVoice
    <re sols>8(do) do( si)
    la2 r
    la si4 do8 re

  do4 (la2) <dos la'>4
   << { \voiceOne  la'2 re,4 la'}\new Voice {\voiceTwo re,8 (mi fa4) re si8(do) ) }>> \oneVoice
   << { \voiceOne la'4 la }\new Voice {\voiceTwo re,8(mi) fa4 }>> \oneVoice r2
   <si re,>4 (fa) <la do,>(mi)
   <fa re>2 <mi do>4 si!8 la
   <fa' re>2 
    << { \voiceOne  la4 (sols)}\new Voice {\voiceTwo mi2 }>> \oneVoice
   la8(fa mi re) do(si la4\fermata)

  
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
    \new Staff << \global \violinTwo >>
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
