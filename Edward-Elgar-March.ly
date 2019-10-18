\version "2.19.83"
\language "español"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")


\header {
  title = "March"
  composer = "Edward Elgar"
  % meter = "Allegro"
}


global= {
  \time 4/4
  \key re \major
  \tempo "Allegro"

}

violinOne = \new Voice \relative do'' {
  \set Staff.instrumentName = #"Violin 1 "

 

  \bar "|."
}

violinTwo = \new Voice \relative do' {
  \set Staff.instrumentName = #"Violin 2 "
  \set Staff.midiInstrument = "violin"

  
  re4-- \f la-- re-- la--
  fas'8-. la-. sols-. sol-. fas r la \upbow la16 la
  la4-. dos-. re-. la-.
  sols2 \sfz (la8) r res,4
  mi-- si-- mi-- si--
  %\break
  sol'8-. si-. las-. la-. sol r si \upbow si16 si
  si4-. res-. mi-. si-.
  
  dos2-> (re!4) r
  %\bar ":|." 
  %\break
  \bar ":.|.:"
  
  \repeat volta 2 { 
    dos2  \p \< (re)
    re \>(la) \p
    %\break
    fas4 sols la dos8 (si)
    la4 si-- (si--) re~ (re2 dos)
    re (dos)
    r8 fas, \upbow fas4 r8 fas \upbow re4
    %\break 
  }
  \alternative{
    {	r8 mi8 \upbow re4 dos! r}
    { 	r8 mi8 \upbow (sols4) la-. dos, \f}
  }
  re-- la-- re-- la--
  fas'8-. la-. sols-. sol-. fas r la \upbow la16 la 
  la4-. dos-. re-. la-.
  %\break
  sols2\sfz  (la8) r res,4
  mi-- si-- mi-- si--
  sol'8-. si-. las-. la-. sol r si \upbow si16 si
  si4-. res-. mi-. si-.
  dos2 (re!) \fermata
  \bar "|." 
}


viola = \new Voice \relative do' {
  \set Staff.instrumentName = #"Viola "
  \set Staff.midiInstrument = "viola"
  \clef alto

  fas,4\f-- sol-- la-- dos--
  re8-. fas-. mis-. mi-. re re\rest la\upbow la16 la 
  si4-. mi-. re-. fas-.
  %\break
  \set Score.currentBarNumber = #4
  fa2( mi8) mi\rest la,4
  sol-- la-- si-- res--
  mi8-. sol-. sol-. fas-. mi mi\rest si si16 si
  si4-. la'-. sol-. mi-.
  %\break
  sol2->( fas4) do\rest 
  \bar ":.|.:"
    \repeat volta 2 { 
  la'2\p--(la--)
  sols(mi)
  re4 mi--(mi--) mi
  fas mi4 do r
  %\break
  sols'2( la)
  si( sols)
  do,8\rest dos\upbow dos4 do8\rest re fas4
    }
  \alternative {
  {do8\rest re( mi4) mi do\rest}
  {}
  }
  %\break
  do8\rest re\upbow( re4) dos sol\rtoe\f
  fas-- sol-- la-- dos--
  re8-. fas-. fa-. mi-. re do\rest la\upbow la16 la
  %\break
  la4-. mi'-. re-. fas-.
  fa2\sfz(mi8) do\rest la4
  sol-- la-- si-- res--
  %\break
  mi8-. sol-. sol-. fas-. mi do\rest  si\upbow si16 si
  si4-. la'-. sol-. mi\upbow-.
  sol2( fas\fermata)\bar "|."

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