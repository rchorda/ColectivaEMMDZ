\version "2.19.83"
\language "español"
rallpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "rall. poco a poco")


\header {
  title = "III Posizione"
  %composer = "Edward Elgar"
  meter = "16"
}


global= {
 
  \key re \major
  \time 3/4

}


% Finger stroke symbols
strokeUp = \markup { \postscript #"
  0.1     setlinewidth
  0.5 0   moveto
  0.5 2   lineto
  0.2 1.4 lineto
  0.5 2   moveto
  0.8 1.4 lineto
  stroke
"}


strokeDown = \markup { \postscript #"
  0.1     setlinewidth
  0.5 2   moveto
  0.5 0   lineto
  0.2 0.6 lineto
  0.5 0   moveto
  0.8 0.6 lineto
  stroke
"}

violinOne = \new Voice \relative do' {
  %\set Staff.instrumentName = #"Violin 1 "
  \set Staff.midiInstrument = "violin"

  \key re \major		
  re8.-2 \f (dos16-.-1  ^ \strokeUp ) re8.-2(mi16-.-3) fas8.-4(sol16-.-1 ^ \strokeDown)
  la8. (si16-.) la8.(fas16-.-4) re4-2

  sol8. (la16-.) si8.(dos16-.-4 ^ \strokeUp) re8.(mi16-.)
  fas8. (sol16-.-4^\strokeDown) la8.(si16-.) la4
  
  \break
  
  mi8.-2(la,16-.-0) fas'8.-3 la,16-.-0 sol'4-4^\strokeDown \accent
  fas8.-3(re16-.-1) sol8.-4 re16-.-1 la'4-1 \accent
  
  re,8.(mi16-.) fas8.(mi16-.) sols8.-4^ \strokeUp(mi16-.)
  la8.(si16-.) dos8.(si16-.) la4-.
  la \accent mi8.-2(fas16-.) sol8. (la16-.)

  \break
  
  fas8.-3(sol16-.-4) fas8.-3(mi16-.-2) re4 \finger "1" \accent
  re'4 \accent mi,8.(fas16-.) sol8.(la16-.)
  
  si8.(do16-.) si8.(la16-.)  sol4 \accent
  mi8.(fas16-.) sol8. la16-.  si4 \accent
  re,8.(mi16-.) fas8. sol16-.   la4 \accent

  \break
  si8.(la16-.) do8. la16-. dos8.(la16-.)
  re8.(si16-.) la8. si16-. la8.(fas16-.)
  re8.(si16-.) la8. si16-. la8.(fas16-.)
  re8.(fas16-.) la8. re16-. fas8.(la16-.)
  re4 r r 

  
  \bar "|." 

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