\version "2.24.2"
\language "espanol"
\header {
  title = "2. Träumerei (Dreaming)"
  subtitle = "Violín I · Estudio completo · negra = 54"
  composer = "Robert Schumann"
  arranger = "Barrie Carson Turner"
  tagline = ##f
}
#(set-global-staff-size 19)
\paper {
  #(set-paper-size "a4")
  page-count = 1
  system-system-spacing.basic-distance = #17
}
\layout { indent = 0\mm }
% Copia de estudio de ../../traumerei_violin_i.ly.
% Regeneración: python3 traumerei_violin_i/estudio/completa/render.py
% Un compás de claqueta de cuatro negras antes de la anacrusa original.
% Se conservan las casillas y la numeración impresa de la transcripción.
% Azul: cambio de cuerda. Verde: inicio de escala. Flechas: alteración respecto a la armadura.
cruce = { \once \override Fingering.color = #blue }
escala = { \once \override NoteHead.color = #(x11-color 'ForestGreen)
           \once \override Fingering.color = #(x11-color 'ForestGreen) }
subir = ^\markup { \with-color #red \char #8593 }
bajar = ^\markup { \with-color #red \char #8595 }

% Indicaciones de posición de la mano izquierda, transcritas del lápiz.
primera =  _\markup {\bold "I"}
tercera =  _\markup {\bold "III"}
% Los eventos con etiqueta midi realizan las indicaciones expresivas sin imprimir
% cifras metronómicas ni duplicar las dinámicas de la partitura.
melodia = \absolute {
  \clef treble \key fa \major \numericTimeSignature \time 4/4
  % La fotografía no contiene cifra metronómica; 72 es orientativa.
  \tempo "Flowing and smooth" 4 = 54
  \set Score.currentBarNumber = #0
  \tag #'layout {
    \once \omit Score.BarNumber
    \override NoteHead.style = #'cross
    si'4^\markup { \small \bold "Entrada" } si' si' si' |
    \revert NoteHead.style
    \bar "||"
  }
  \tag #'midi { r1 | }
  \set Score.currentBarNumber = #0
  \partial 4 do'4\p-3 |
  \set Score.currentBarNumber = #1
  \repeat volta 2 {
    \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 27 2) <>\p }
    % 1–4
    \cruce fa'2-2 ~ fa'8 mi'-1 fa'-2 \cruce la'-0 |
    do''8-2\< \cruce fa''-1 fa''2-1\! mi''8-0( \cruce re''-3) |
    do''8-2( \cruce fa''-1) \cruce sol'-3( \cruce la'-0) sib'-1( re''-3) \cruce fa'-2( sol'-3) |
    \cruce la'8-0 do''-2 \cruce sol'2-3 \cruce do'4-3 | \break
    % Lápiz: III a partir del re con dedo 1; la última cifra sigue siendo provisional.
    % 5–7
    \cruce fa'2-2 ~ fa'8 mi'-1 fa'-2 \cruce la'-0 |
    do''8-2\< \escala \cruce la''-3 la''4-3~\!( la''8 sol''-2) fa''-1 mi''-0 |
    fa''8-1\upbow( la''-3) \cruce re''-1\tercera fa''-3 mi''4.-2( mib''8)-2\bajar |
  }
  \alternative {
    { % 8: la cifra y los trazos a lápiz sobre la apoyatura no se distinguen con seguridad.
      % Primera casilla: notas de adorno pequeñas impresas
      \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 51 4) }
      re''4-1^\markup { \bold "rit." }(
      \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 93 8) }
      mi''!-2 \grace { \cruce do''16-4) }
      \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 21 2) }
      \cruce do''4-2\downbow \primera
      \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 39 4) } r8 \cruce do'8-3 |
    }
    { % 8, segunda casilla
      \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 51 4) }
      re''4-1^\markup { \bold "rit." }(
      \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 93 8) }
      mi''!-2 \grace { \cruce do''16-4) }
      \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 21 2) }
      do''4-4\downbow
      \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 39 4) } r4 |
    }
  }
  \set Score.currentBarNumber = #9
  \break
  % 10–12: flechas y trazos de lápiz incompletos; solo se incluyen 3, 2 e I legibles.
  % 9–12
  \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 27 2) }
  r4^\markup { \bold "a tempo" } \cruce do'2.-1\mp\downbow ~ \tercera |
  do'8 \cruce sib'-3 la'4-2 ~ ( la'8 fas'-\tweak color #red -2\subir)\primera \cruce la'4-0 |
  \cruce sol'4.-3( mib'8-\tweak color #red -1\bajar) re'-0( sol'-3) \cruce sib-2( do'-3) |
  \cruce re'4.-0\upbow( \cruce do'8-3) sib4-2 r4 | \break
  % 13–16
  r4 \cruce fa'2.-2\downbow ~ |
  fa'4 mi'4-1 ~\> mi'8 \cruce dos''-2\subir\! \cruce mi''4-0 |
  \cruce re''4.-3( sib'!8-1) la'-0( do''-2) \cruce fa'-2( sol'-3) |
  \tag #'midi { <>\mp\> }
  \escala \cruce la'4.-0_\markup { \italic "dim." }( \cruce sol'8-3)
  \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 12 1) }
  fa'4-2^\markup { \bold "rit." }(
  \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 21 2) <>\pp }
  mi'4-1) | \break
  % 17–20
  \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 27 2) <>\p }
  \grace { \cruce do'8-3\upbow } \cruce fa'2-2^\markup { \bold "a tempo" } ~ fa'8 mi'-1 fa'-2 \cruce la'-0 |
  do''8-2\< \cruce fa''-1 fa''2-1\! mi''8-0( \cruce re''-3) |
  do''8-2( \cruce fa''-1) \cruce sol'-3( \cruce la'-0) sib'-1( re''-3) \cruce fa'-2( sol'-3) |
  \cruce la'8-0 do''-2 \cruce sol'2-3 \cruce do'4-3 | \break
  % 22: f manuscrito sustituye a mf. Se conserva solo la ligadura de prolongación entre los la.
  % 24: las dos V son una lectura provisional de arcos arriba a lápiz.
  % 21–24
  \tag #'midi { <>\p\< }
  \cruce fa'2-2_\markup { \italic "cresc." } ~ fa'8 mi'-1 fa'-2 \cruce la'-0 |
  % Calderón del 22: una negra adicional en la reproducción.
  \tag #'midi { \set Timing.measureLength = #(ly:make-moment 5/4) }
  do''8-2 \cruce la''-3--
  \tag #'layout { la''4-3\fermata\f ~ }
  \tag #'midi { la''4*2\f ~ }
  la''8 sol''-2\upbow\mp fa''-1 \cruce re''-3 |
  \tag #'midi { \unset Timing.measureLength }
  \tag #'midi { <>\mp\> }
  do''8-2_\markup { \italic "dim." }( \cruce fa''-1) \cruce sol'-3 \cruce la'-0 sib'-1( re''-3)
  \tag #'midi { <>\p }
  \cruce sol'-3\< \cruce la'-0 |
  sib'8-1( re''-3)\!
  \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 12 1) }
  \cruce re'-0\upbow\>^\markup { \bold "rit." }
  \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 87 8) }
  mi'-1\upbow
  \tag #'midi { \set Score.tempoWholesPerMinute = #(ly:make-moment 75 8) }
  % El compás final de tres tiempos completa la anacrusa de negra.
  \tag #'layout { fa'4-2\!\pp\fermata }
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
