\version "2.19.83"
\language "español"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")


\header {
  title = "Norma-Semiramide-Elisire d'Amore"
  composer = "CH. Dancla, Op. 86, Nº1"
  %meter = "Allegro"
}


global= {
  
  \tempo "Maestoso"
  %\tempo 4 = 50 

}

violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"

  \key sol \major
  sol'2 \downbow la4-0 \upbow ( do)
  si2 do4 (mi-4)
  re4.-. (re8-.) res (mi-0 fas sol)
  si,4 \( \grace {dos16 (si la)} si8. do16\) la4 r4
  mi'2-4~ mi8 res (mi-0 fas)
  \break
  sol4 \(\slashedGrace {la16 (sol fas)} sol8. la16 \) fas4 (si,)
  do2~ do8 las-1 (si la-0) 
  fas8 (sol16) r \< las8-1 (si16-1) r res8 (mi16-4) r fas8 (sol16) r
  la4 \f (sols16 la sols la) si (la sol fas la sol fas mi-4)
  \break
  
  \key re \major
  \tempo 4 = 70
  re4 \downbow re,16 \upbow (fas la-0 si) la4 re,16 (fas la si) 
  la4 fas8. (sol16) la8. (si16) dos8. (re16)
  dos4 la16 (dos mi-0 fas) mi4-0 la,16 (dos mi-0 fas) 
  mi4-0 sol8. (fas16) la8. (sol16) fas8. (mi16-4)
  \break
  re4 re dos! si mi-4 ( re8. dos16) 
  si4 \( \slashedGrace {dos16 (si las-1 si-1)} re8.\) (do16))
  la4 la8. (la'16) \tempo 4 = 65 sol4\rallpoco  la,8. (sol'16)
  \tempo 4 = 60
  fas4 la,8. (fas'16) mi4-0 la,8. (mi'16-4) \!
  \break
  
  \time 6/8
  \tempo 4. = 65
  re4 r8 r4 r8
  fas4. \downbow \slashedGrace {sol8} fas-. \upbow (mi-. fas-.)
  la4. fas4.
  re4. mi8-4 ( re mi-0)
  mis4 (fas8) re4.
  fas4. \< fas4. 
  sols4. la4 (fas8) \!
  \break
  fas8 ( mi-4 dos) mi-4 (re si)
  la4. ~la4 r8
  fas'4.  \downbow sols8 \upbow (la sols) \noBreak
  fas4. dos4. \noBreak
  fas4. sols8 (la sols)
  fas8 (la sols)
  fas8 (la sol)
  fas4. \slashedGrace {sol8} fas-. (mi-. fas-.)
  \break
  la4. fas4.
  re4. mi8-4 ( re mi-0)
  mis4 (fas8) re4.
  fas4.\cresc fas8 (sol la)
  la4 (sols8) sol4 (mi8-4)
  re16-"rall" \f (la si dos re mi) fas4 (mi8-4)
  \break
  
  \key sol \major
  \time 2/4
  \tempo 4 = 65
  re4 \downbow re,8-.-0 \upbow (re-.)
  re (do') sib-. (la-.-0)
  la-4 (sol) re'-. (re-.)
  re (sib') la-. (sol-.)
  sol (fas) re,-.-0 (re-.)
  re (do') sib-. (la-.-0)
  \break
  la-4 (sol) re'-. (re-.)
  re (sib') la-. (sol-.)
  fas4 re,8-. (re-.) 
  do'4 re,8-. (re-.)
  si'!4 re,8-. (re-.)
  la'4-0 re,8-. (re-.)
  \pageBreak
  
  \time 3/8
  \tempo 4. = 55
  sol4 r8
  r r sol16 si
  re4-> (dos16 re)
  si4 si16 re
  sol4-> (fas16 sol)
  re4 re16 sol
  si4-> fas16 sol
  \break
  la4-> mi16-0 fas 
  sol4-> re16 si
  sol8 r sol16 si
  re4-> (dos16 re)
  si4 si16 re 
  sol4-> (fas16 sol)
  re4 re16 sol
  si4-> fas16 sol
  \break
  la4-> mi16 fas
  sol4-> re16 si
  sol4 sol'8 \upbow
  sol4-> (fa16 mib)
  mib4-> (re16 do)
  si4 (do8)
  re4 sol16 sol 
  sol4-> (fa16 mib)
  \break
  mib4 (re16 do)
  si4 (do8)
  re4 re16 do
  si4 (la16 si)
  do4 (si16 do)
  re4 (sol8)
  re4 re16 do 
  si4 (la16 si)
  \break
  do4 (si16 do)
  re4 \< re16 re 
  res4 res16 res 
  mi4-4  \! mi16-0 mi
  \slashedGrace {sol8} fas-. mi-. fas-.
  sol4 sol16 \cresc sol
  fas4 fas16 fas 
  sol4  sol16 sol
  \break
  \slashedGrace {si8} la sol la
  si4.-2 ^\markup { \teeny "III" } ~si4 \! si8 \upbow \!
  do16-3 \p do si si la la
  sol-2 ^\markup { \teeny "I" } sol fas fas mi-4 mi
  re re mi-4 mi re re
  \break
  do do re re do do 
  si si do do si si 
  la la si si la la
  re4.
  si'4.-2^\markup { \teeny "III" }
  do16-3 do si si la la
  \break
  sol-2 ^\markup { \teeny "I" } sol fas fas mi-4 mi
  re re mi-4 mi re re 
  do do re re do do 
  si si do do si si
  la la si si la la
  \time 6/8
  \break
  sol16 (re sol si mi-4 re)
  re (do la-4 fas mi fas)
  sol16 (re sol si mi-4 re)
  re (do la-4 fas mi fas)
  sol \cresc (re mi fas sol la-0)
  si (fas sol la-0 si do)
  \break
  re (si do re mi-0 fas)
  sol (re mi-0 fas sol la)
  si si fas fas re re fas fas re re si si
  re re si si sol sol si si sol sol re re 
  sol,4 \! r8 r4 r8 
  


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