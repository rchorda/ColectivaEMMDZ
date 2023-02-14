\version "2.19.83"
\language "español"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")


\header {
  title = "Sonata No. 3"
  composer = "G.F. Handel"
  meter = "15"
}


global= {
 
  \key fa \major
  \time 3/4
  \tempo "Adagio"
}


violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"

  %\key sol \major		
  
  fa'-3-"sonore" \downbow\f do-1_\markup {\bold "II"}\startGroup la
  fa2 do'4
  re \stopGroup  sib-1_\markup {\bold "I"} sol
  mi2 fa4
  \mf sib16(do la do sib8) mi16-2_\markup {\bold "III"} (fa) sol8 sib,-1_\markup {\bold "I"}
  (la-0)  \< 	la'16 (sol fa mi re do) si re fa, si
  mi,(sol-1 _\markup {\bold "III"}la si)  \! do8 mi,16-- re-- sol,8-- si'---1 _\markup {\bold "I"}
  sib!8. \p \downbow (do32 re do8)
  do-1_\markup {\bold "II"} (re mi)
  fa16-3_\markup {\bold "III"} (mi fa sol) fa8 fa,-1_\markup {\bold "II"} \upbow fa (mib')
  
  mib \< (re16 do) re8-1 _\markup {\bold "III"}(fa16 mi) fa4 \!
  sol16_\markup {\bold "II"} (la) la(sib) \> sib(la) la (sol) sol-4_\markup {\bold "III"} (fa ) fa(mi)
  mi4 \cresc( mi16) do-3_\markup {\bold "II"} (si do) fa do (si do)
  \break
  sol'4 (sol16) do,( si do) la' do,( si do)
  sib'4 \mf  (sib16) la( sol la) la (sol fa sol)
  sol(fa mi fa) fa8 sib16 (la sol fa mi re)
  
  
  \break
  do8 mi16---2_\markup {\bold "III"} fa-- sol8-- mi-- fa-- do---2 _\markup {\bold "I"}
  re16 \<(do) sib la sol fa mi re-0 do8---1_\markup {\bold "III"} mi'-- \!
  
  fa \downbow \f (mi16 fa) do8-2_\markup {\bold "I"} (sib16 do) la (sib do la)
  fa2 do'4
  
  re16-1_\markup {\bold "III"} (mi fa re) sib-2_\markup {\bold "IV"} (do re sib) sol-1_\markup {\bold "III"}(la) sib sol
  mi2-1_\markup {\bold "I"} \> fa16 \mf \upbow (la-4 sol fa)
  sib(re do sib) sol'-4_\markup {\bold "III"} (fa mi re-3_\markup {\bold "I"} do re) sib do
  \break
  la-0 \<(sib) do re mi-0 fa sol la  \! si,8 \prall la16---4 sol--
  do8 mi, mi (fa16 re) do'8(re16 si) \> 
  do4. \mordent do8-1_\markup {\bold "II"} \upbow  (re mi)
  fa16-2\p _\markup {\bold "IV"}(mi fa sol) la (fa mi fa) la (sol fa mi-3_\markup {\bold "II"})
  
  \pageBreak
  re-2 (dos re mi) re8 re-1_\markup {\bold "III"} (mi fa)
  mi16-0 _\markup {\bold "I"} (fa-1 sol la) sib8-- sol---4_\markup {\bold "III"} mi-- (re--)
  dos4-2_\markup {\bold "I"} \downbow\cresc (dos16) la-0( si dos) re-- la (dos re-1_\markup {\bold "III"})
  mi4-2( mi16)la,-0 (re-1 mi) fa-- la,( mi'-2 fa-1 _\markup {\bold "IV"})
  sol4-2 ( sol16) la (sib sol) mi-1_\markup {\bold "IV"}(fa sol mi)
  dos4-2_\markup {\bold "I"} mi16-2_\markup {\bold "III"} (fa sol mi) dos-1_\markup {\bold "II"}(re mi dos)
  sol4-2 \f mi'8---3 dos---1 sib---1_\markup {\bold "I"} \prall la16-- sol--
  fa8-- re'-- mi,4  \acciaccatura re'8 dos4 \trill
  re-1 \> r \! re16-4_\markup {\bold "IV"} \upbow \pp (do si do)
  si8.-3_\markup {\bold "III"}(la16) sol-1 \< (la) si-- do-- re--mi-- fa-- sol--
  mi8.-3 _\markup {\bold "II"}\>\prall (re16) do4 \!
  
  do16-4_\markup {\bold "III"} \pp (sib la sib) 
  \acciaccatura sib8_\markup {\bold "II"} la8.-3 (sol16) fa-1\<(sol) la-- sib-- do---1re-- mib-- fa-- \!
  re4 \downbow\> sib'16-3 \upbow \! (la sol la sib) sol-- la (sib)
  sib8\cresc (do,) sib'16 (la sol la sib) sol-- la (sib)
  sib8(do,) sib'16 (la  sol la sib) sol-- lab (sib)
  lab8(do,)  lab'16-3_\markup {\bold "I"}  (sol fa sol lab)fa-- sol( lab)  
  lab8(si,)  lab'16 (sol fa sol sol)fa-- mi( fa)
   mi8-4 \mf do16(si) do(re) mi-- fa-- mi(fa) sol-- la!--
   sib!8 do,16-2 si do sib'(la sol) la (sol fa mi)
  
  fa ( mi fa sol) fa (mi fa sol) do,8 mi-2_\markup {\bold "III"}
  fa4-3 \downbow \mf do-1_\markup {\bold "II"} la
  fa2 do'4
  re16-2(mi fa re) sib-1_\markup {\bold "I"} (do re sib) sol-2_\markup {\bold "II"}(la sib sol)
  mi-1_\markup {\bold "I"}(fa sol mi) do2
  
  sol''16 (la sib sol) mi (fa sol mi) sib( do re sib)
  sol-2_\markup {\bold "II"} (la sib sol) mi-1_\markup {\bold "I"} (re' do sib) la(fa'-3) mi re
  do8-4_\markup {\bold "III"} sib16 la-3_\markup {\bold "II"} sol4. \trill (fa8) \> fa2. 
  \!
  %mi16-3 \downbow \mp (sol-1) si---3 mi---2 sol4 (fas8 sol)
  %mi16-2(fas) sol-- mi-- la4-1(si8 do)
  %si16(do) si-- la-- sol8 fas mi(res)
  %mi16(res) mi-- fas-- sol--  fas--sol--la--si4--
  \break
  
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
