\version "2.22.1"
\header {
  title = "Melancholic Trio for Violin, Viola, and Piano - Complete"
  composer = "Inspired by Shostakovich"
}

\score {
  <<
    \new Staff \with { instrumentName = "Violin" } {
      \clef treble
      \key d \minor
      \time 4/4

      % A Section - Main Theme
      \relative c'' {
        a4 fis d a | d2 cis8( d e fis) | g4( fis) e d | cis2 d4 r |
        % B Section
        e4 fis g a | bes( a) g fis | e4( d) cis d | e2 fis4 r |
        % B' Section - Variation
        fis4 g a bes | c( b) a g | fis4( e) d e | fis2 g4 r |
        % A Section - Variation
        a4 fis d a | d2 cis8( d e fis) | g4( fis) e d | cis2 d4 r |
        % B' Section - Return
        fis4 g a bes | c( b) a g | fis4( e) d e | fis2 g4 r |
        % A Section - Conclusion
        a4 fis d a | d2 cis8( d e fis) | g4( fis) e d | cis2 d2 \bar "|."
      }
    }

    \new Staff \with { instrumentName = "Viola" } {
      \clef alto
      \key d \minor
      \relative c' {
        d4 a d fis | g2 fis8( g a bes) | a4( g) fis e | d2 e4 r |
        a4 bes c d | e( d) c bes | a4( g) fis g | a2 bes4 r |
        bes4 c d e | f( e) d c | bes4( a) g a | bes2 c4 r |
        d4 a d fis | g2 fis8( g a bes) | a4( g) fis e | d2 e4 r |
        bes4 c d e | f( e) d c | bes4( a) g a | bes2 c4 r |
        d4 a d fis | g2 fis8( g a bes) | a4( g) fis e | d2 e2 \bar "|."
      }
    }

    \new Staff \with { instrumentName = "Piano" } {
\clef treble
\key d \minor
\relative c'' {
r2 d8( fis) a d | cis,4( d) e fis | g,( a) b cis | d,2 e4 r |
a,4 <d fis> <e a> <fis c'> | <g bes> <a e'> <g c'> <fis a> | <e g> <fis d'> <e gis> <d fis> | <c e> <d fis> <e g> <fis a> |
r2 d8( fis) a d | cis,4( d) e fis | g,( a) b cis | d2 e4 r |
r2 d8( fis) a d | cis,4( d) e fis | g,( a) b cis | d2 e4 r |
a,4 <d fis> <e a> <fis c'> | <g bes> <a e'> <g c'> <fis a> | <e g> <fis d'> <e gis> <d fis> | <c e> <d fis> <e g> <fis a> |
r2 d8( fis) a d | cis,4( d) e fis | g,( a) b cis | d2 e2 \bar "|."
}
\addlyrics { Violin and Viola }
}
  >>
\layout { }
  \midi { }
}
