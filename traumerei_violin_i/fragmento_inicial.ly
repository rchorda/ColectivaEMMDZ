\version "2.24.2"
\language "espanol"
\header {
  title = "Träumerei (Dreaming) — fragmento inicial"
  subtitle = "Violín I · transcripción parcial pendiente de cotejo"
  composer = "Robert Schumann"
  arranger = "Barrie Carson Turner"
}
\paper { tagline = ##f }
melodia = \absolute {
  \clef treble \key fa \major \time 4/4
  \tempo "Flowing and smooth" 4 = 72
  \partial 4 do'4\p
  fa'2 ~ fa'8 mi' fa' la' |
  do''8\< fa'' fa''2\! mi''8( re'') |
  do''8( fa'') sol' ( la') sib' ( re'') fa' ( sol') |
  la'8 do'' sol'2 do'4 |
  \bar "||"
}
\score { \new Staff \with { instrumentName = "Violín I" midiInstrument = "violin" } \melodia
  \layout { } \midi { }
}
