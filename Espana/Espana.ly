\version "2.24.4"
\language "espanol"
\include "articulate.ly"


rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")

rit = {
  \once \override TextSpanner.bound-details.left.text = \markup { \italic "rit." }
  \once \override TextSpanner.bound-details.right.text = ##f
  \startTextSpan
}

accel = {
  \once \override TextSpanner.bound-details.left.text = \markup { \italic "accel." }
  \once \override TextSpanner.bound-details.right.text = ##f
  \startTextSpan
}

pocorit = {
  \once \override TextSpanner.bound-details.left.text = \markup { \italic "poco rit." }
  \once \override TextSpanner.bound-details.right.text = ##f
  \startTextSpan
}

moltorall = {
  \once \override TextSpanner.bound-details.left.text = \markup { \italic "molto rall." }
  \once \override TextSpanner.bound-details.right.text = ##f
  \startTextSpan
}

tempoEnd = \stopTextSpan
atempo = ^\markup { \italic "A tempo" }

subir = ^\markup \char #8593
bajar = ^\markup \char #8595
primera =  _\markup {\bold "I"}
segunda =  _\markup {\bold "II"}
tercera =  _\markup {\bold "III"}
cuarta =  _\markup {\bold "IV"}
quinta =  _\markup {\bold "V"}
sexta =  _\markup {\bold "VI"}


\header {
  title = "Nessun Dorma"
  instrument = "Violin I"
  composer = "España"
  arranger = "Arr. P. Martin"
  %copyright = "© Mainstream Music 2002"
  %tagline = "www.mainly4strings.co.uk"
}

% Global settings inferred from the part photo
global = {
  \key re \major
  \time 6/8
  \tempo "Andante sostenuto" 4 = 120
}


violinOne = \new Voice \relative do'  {
  %\set Staff.instrumentName = #"Violin 1 "
    \set Staff.midiInstrument = "violin"
% Andante sostenuto
%\tempo "Andante sostenuto" 4 = 60
r4 la'4.\downbow \p \< la8 \!
re8\f r re \p re mi r
dos r re4. si8
dos r la si sol r
r4 mi4.\< mi8 \!
dos' \f r dos\p dos re r
si r dos4. la8
si r sol la fas r
r8 \< la,16 (si dos re mi fas sol la si dos) \!
re8\f r re \p re mi r
dos r re4. si8
dos r la si sol r
r8 \< la,16 (si dos re mi fas \tuplet 3/2 {sol8 la si} ) \!
dos\f r dos \p dos re r
si r dos4. la8
re2. ~ re4 la4.\< la\upbow  \!





}

\score {
  
  %\unfoldRepeats 
  %\articulate <<
  \new StaffGroup <<
    \new Staff << \global \violinOne >>
  >>
  %>>
  %\layout { }
  \layout {
  \context {
    \Voice
    \consists "Horizontal_bracket_engraver"
    \consists "Text_spanner_engraver"
  }
}
  \midi { }
}
