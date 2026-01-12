\version "2.24.4"
\language "español"
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
  composer = "G. Puccini"
  arranger = "Arr. P. Martin"
  copyright = "© Mainstream Music 2002"
  tagline = "www.mainly4strings.co.uk"
}

% Global settings inferred from the part photo
global = {
  \key sol \major
  \time 4/4
  \tempo "Andante sostenuto" 4 = 60
}


violinOne = \new Voice \relative do'  {
  %\set Staff.instrumentName = #"Violin 1 "
    \set Staff.midiInstrument = "violin"
    \override TextSpanner.style = #'dashed
    \override TextSpanner.dash-fraction = #0.3
% Andante sostenuto
%\tempo "Andante sostenuto" 4 = 60

r4 r8 re\downbow \p (si'4) re--
r4 r8 re,(si'4) re--
r8 la,\downbow (si re) la' (si re, sol)
la (si re sol) la (si) re,4--
\break
r4 r8 re,\downbow  (si'4) re--
r4 r8 re,\<\downbow(<re re'>2)\!
r4 r8 re\downbow (la' \<si)\> re4 \! 
r4 r8 re, \dim (la' si)re4 \!
\break
r4 r8 re,\upbow  \rit la' \<(si) re (sol)
\tempoEnd
<fas, la>2. \atempo \mf <fas la>4--
\time 2/4
<sol si>2 
\time 4/4
<sol si>2. <sol si>4--
<<
  {  % voz superior
    dos4 re mi fas8 \< (sol) \!
  }
\\
  {  % voz inferior (nota sostenida)
    dos,4 la2 fas'8(sol)
  }
>> \! 
\break
la re,\downbow mi (fas) mi (re) mi8.\accent (dos16)
r8 si dos (re) dos (si) re8.\accent(si16)
la8 (fas) re'--\>(dos--) si-- (la--) mi\! r \fermata
\break
r si(re la' si) re, ( la' si)
re si( re la') si (re,) re8. (do16)
si4. \downbow\< (re8)\! fas4.\> (mi8) \!
re r r re,\downbow (la' si) re4
\break

r8 la,8 \mp \> \downbow (si re) la' (si re sol) \!
r re8:64\p \upbow mi:64 fas:64 mi:64 re:64 mi8.:64 dos16:128
\time 2/4
si2:32
\time 4/4
r8 mi8:64 \upbow fas:64 sol:64 fas:64 mi:64 fas8.:64 re16:128
\break
dos4:32 \< re:32 mi:32 fas8(sol) \!
la\f re, mi fas mi re mi8.\accent dos16
r8 si \upbow dos re dos si re8.\accent\> si16\!
\break
la8 (fas) <si re -->\> (<la dos-->) <sol si--> (<fas la-->) \! mi r \fermata
r8 si \p \downbow re\< (sol) si (re,) sol (si)
\rit si sol si re sol re sol8. si16 \accent \fermata \! \tempoEnd
\break 
r8 \atempo re,8:64 \downbow mi:64 fas:64 mi:32 re:64 mi8.:64 dos16:64
\time 2/4
si2:32
\time 4/4
r8 mi8:64 \downbow fas:64 sol:64 fas:64 mi:64 fas8.:64 re16:64
\rit dos4:32 \< re:32 mi:32 fas8 \accent \downbow sol \accent \!  \tempoEnd
<fas la>1:32\fff \fermata

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
    \consists "Text_spanner_engraver"
  }
}
  \midi { }
}
