\version "2.24.2"
\language "espanol"
\header {
  title = "2. Träumerei (Dreaming)"
  subtitle = "Violín I · Op. 15"
  composer = "Robert Schumann"
  arranger = "Barrie Carson Turner"
  tagline = ##f
}
\paper { #(set-paper-size "a4") }
\layout { indent = 0\mm }
% Indicaciones de posición de la mano izquierda, transcritas del lápiz.
primera =  _\markup {\bold "I"}
tercera =  _\markup {\bold "III"}
% Los eventos con etiqueta midi realizan las indicaciones expresivas sin imprimir
% cifras metronómicas ni duplicar las dinámicas de la partitura.
melodia = \absolute {
  \clef treble \key fa \major \numericTimeSignature \time 4/4
  % La fotografía no contiene cifra metronómica; 72 es orientativa.
  \tempo "Flowing and smooth" 4 = 72
  \partial 4 do'4\p |
  \repeat volta 2 {
    \tag #'midi { \tempo 4 = 72 <>\p }
    % 1–4
    fa'2 ~ fa'8 mi' fa' la' |
    do''8\< fa'' fa''2\! mi''8( re'') |
    do''8( fa'') sol'( la') sib'( re'') fa'( sol') |
    la'8 do'' sol'2 do'4 | \break
    % Lápiz: III a partir del re con dedo 1; la última cifra sigue siendo provisional.
    % 5–7
    fa'2 ~ fa'8 mi' fa' la' |
    do''8\< la'' la''4~\!( la''8 sol'') fa'' mi'' |
    fa''8\upbow( la'') re''-1\tercera fa''-3 mi''4.-2( mib''8)-2 |
  }
  \alternative {
    { % 8: la cifra y los trazos a lápiz sobre la apoyatura no se distinguen con seguridad.
      % Primera casilla: notas de adorno pequeñas impresas
      \tag #'midi { \tempo 4 = 68 }
      re''4^\markup { \bold "rit." }(
      \tag #'midi { \tempo 4 = 62 }
      mi''! \grace { do''16) }
      \tag #'midi { \tempo 4 = 56 }
      do''4\downbow \primera
      \tag #'midi { \tempo 4 = 52 } r8 do'8 |
    }
    { % 8, segunda casilla
      \tag #'midi { \tempo 4 = 68 }
      re''4^\markup { \bold "rit." }(
      \tag #'midi { \tempo 4 = 62 }
      mi''! \grace { do''16) }
      \tag #'midi { \tempo 4 = 56 }
      do''4\downbow
      \tag #'midi { \tempo 4 = 52 } r4 |
    }
  }
  \set Score.currentBarNumber = #9
  \break
  % 10–12: flechas y trazos de lápiz incompletos; solo se incluyen 3, 2 e I legibles.
  % 9–12
  \tag #'midi { \tempo 4 = 72 }
  r4^\markup { \bold "a tempo" } do'2.\mp\downbow ~ \tercera |
  do'8 sib'-3 la'4-2 ~ ( la'8 fas')\primera la'4 |
  sol'4.( mib'8) re'( sol') sib( do') |
  re'4.\upbow( do'8) sib4 r4 | \break
  % 13–16
  r4 fa'2.\downbow ~ |
  fa'4 mi'4 ~\> mi'8 dos''\! mi''4 |
  re''4.( sib'!8) la'( do'') fa'( sol') |
  \tag #'midi { <>\mp\> }
  la'4._\markup { \italic "dim." }( sol'8)
  \tag #'midi { \tempo 4 = 64 }
  fa'4^\markup { \bold "rit." }(
  \tag #'midi { \tempo 4 = 56 <>\pp }
  mi'4) | \break
  % 17–20
  \tag #'midi { \tempo 4 = 72 <>\p }
  \grace do'8\upbow fa'2^\markup { \bold "a tempo" } ~ fa'8 mi' fa' la' |
  do''8\< fa'' fa''2\! mi''8( re'') |
  do''8( fa'') sol'( la') sib'( re'') fa'( sol') |
  la'8 do'' sol'2 do'4 | \break
  % 22: f manuscrito sustituye a mf. Se conserva solo la ligadura de prolongación entre los la.
  % 24: las dos V son una lectura provisional de arcos arriba a lápiz.
  % 21–24
  \tag #'midi { <>\p\< }
  fa'2_\markup { \italic "cresc." } ~ fa'8 mi' fa' la' |
  % Calderón del 22: una negra adicional en la reproducción.
  \tag #'midi { \set Timing.measureLength = #(ly:make-moment 5/4) }
  do''8 la''--
  \tag #'layout { la''4\fermata\f ~ }
  \tag #'midi { la''4*2\f ~ }
  la''8 sol''\upbow\mp fa'' re'' |
  \tag #'midi { \unset Timing.measureLength }
  \tag #'midi { <>\mp\> }
  do''8_\markup { \italic "dim." }( fa'') sol' la' sib'( re'')
  \tag #'midi { <>\p }
  sol'\< la' |
  sib'8( re'')\!
  \tag #'midi { \tempo 4 = 64 }
  re'\upbow\>^\markup { \bold "rit." }
  \tag #'midi { \tempo 4 = 58 }
  mi'\upbow
  \tag #'midi { \tempo 4 = 50 }
  % El compás final de tres tiempos completa la anacrusa de negra.
  \tag #'layout { fa'4\!\pp\fermata }
  \tag #'midi { fa'4*2\!\pp }
  \bar "|."
}
\score {
  \new Staff \keepWithTag #'layout \melodia
  \layout { }
}
\score {
  \unfoldRepeats
  \new Staff \with { midiInstrument = "violin" } \keepWithTag #'midi \melodia
  \midi { }
}
