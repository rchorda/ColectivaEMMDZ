\version "2.24.2"
\language "español"

global = {
  \key do \major
  \time 4/4
}

soprano = \relative do'' {
  do4 mi sol sol | fa mi re do |
}

alto = \relative do' {
  la4 la do do | si la sol fa |
}

tenor = \relative do' {
  fa4 sol la la | sol fa mi re |
}

bajo = \relative do {
  do4 re mi mi | re do si do |
}

\score {
  \new ChoirStaff <<
    \new Staff { \clef "treble" \global \soprano }
    \addlyrics { A -- le -- lu -- ya, a -- le -- lu -- ya }
    \new Staff { \clef "treble" \global \alto }
    \addlyrics { A -- le -- lu -- ya, a -- le -- lu -- ya }
    \new Staff { \clef "bass" \global \tenor }
    \addlyrics { A -- le -- lu -- ya, a -- le -- lu -- ya }
    \new Staff { \clef "bass" \global \bajo }
    \addlyrics { A -- le -- lu -- ya, a -- le -- lu -- ya }
  >>
  \layout { }
  \midi { }
}
