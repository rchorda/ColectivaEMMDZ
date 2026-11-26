\version "2.24.0"
\language "espanol"
\include "esquema-digitacion.ily"
\include "miniatura-digitacion.ily"
% Fuente: ../../verano.ly; voz única de violín; intervalo [32,38).
% Copia controlada. Cotejar con la partitura principal si cambia el pasaje.
% Clave de sol, si bemol mayor, 3/4, negra = 80 y dinámica f.
% Una pasada, con un compás de entrada de 12 golpes de semicorchea.
% La alternativa en II empieza en el compás 35. El la se toca en la cuerda de re y el re o do sostenido en la de la.
% La vuelta a I en el compás 38 queda fuera del ejercicio.
% Regenerar: python3 verano/estudio/preparar_escalas.py c032-c037
\header {
  title = "Verano"
  subtitle = "Estudio · compases 32–37"
  tagline = ##f
}
#(set-global-staff-size 17)
\paper { #(set-paper-size "a5landscape") page-count = 1 indent = 0\mm ragged-last = ##f }

tresAzul = \markup \with-color #blue \finger "3"
dosAzul = \markup \with-color #blue \finger "2"
unoAzul = \markup \with-color #blue \finger "1"
subir = ^\markup \with-color #red \char #8593

\score {
  \new Staff \with { midiInstrument = "violin" } \absolute {
    \clef treble \key sib \major \time 3/4 \tempo "Presto" 4 = 80
    \set Score.currentBarNumber = #31
    \once \omit Score.BarNumber
    R2.^\markup { \small \bold "Entrada · claqueta en semicorcheas" }
    \bar "||"
    \set Score.currentBarNumber = #32
    \override Score.BarNumber.break-visibility = ##(#f #t #t)
    \set Score.barNumberVisibility = #all-bar-numbers-visible
    \dynamicUp

    \override Fingering.color = #blue
    \once \override Fingering.color = #black
    sol'16\f-3\miniaturaDigitacionMarcaI[ si'!-1\subir sol'-3 si'-1]
    sol'-3[ si'-1 sol'-3 si'-1] sol'-3[ si'-1 sol'-3 si'-1] | % 32
    \barNumberCheck #33
    sol'16-3[ do''-2 sol'-3 do''-2]
    sol'-3[ do''-2 sol'-3 do''-2] sol'-3[ do''-2 sol'-3 do''-2] | % 33
    \barNumberCheck #34
    sol'16-3[ dos''-2\subir sol'-3 dos''-2]
    sol'-3[ dos''-2 sol'-3 dos''-2] sol'-3[ dos''-2 sol'-3 dos''-2] | % 34
    \revert Fingering.color
    \break
    \barNumberCheck #35
    la'16-0_\markup \combine
      \tresAzul
      \translate #'(-0.8 . -3.35)
      \with-dimensions #'(0 . 0) #'(-1.9 . 1.9)
      \line { \vcenter \bold "II" \miniaturaDigitacionII }[
      re''-3_\dosAzul la'_\tresAzul re''_\dosAzul]
    la'_\tresAzul[ re''_\dosAzul la'_\tresAzul re''_\dosAzul]
    la'_\tresAzul[ re''_\dosAzul la'_\tresAzul re''_\dosAzul] | % 35
    \barNumberCheck #36
    la'16-0_\tresAzul[ re''-3_\dosAzul la'_\tresAzul re''_\dosAzul]
    la'_\tresAzul[ re''_\dosAzul la'_\tresAzul re''_\dosAzul]
    la'_\tresAzul[ re''_\dosAzul la'_\tresAzul re''_\dosAzul] | % 36
    \barNumberCheck #37
    la'16-0_\tresAzul[ dos''-2_\unoAzul\subir la'_\tresAzul dos''_\unoAzul]
    la'_\tresAzul[ dos''_\unoAzul la'_\tresAzul dos''_\unoAzul]
    la'_\tresAzul[ dos''_\unoAzul la'_\tresAzul dos''_\unoAzul] | % 37
    \barNumberCheck #38
    \once \omit Score.BarNumber
    \bar "|."
  }
  \layout { }
  \midi { }
}

\markup \esquemaDigitacion
