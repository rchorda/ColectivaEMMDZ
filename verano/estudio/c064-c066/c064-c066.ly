\version "2.24.0"
\language "espanol"
\include "esquema-digitacion.ily"
% Fuente: ../../verano.ly; voz única de violín; intervalo [64,67).
% Copia controlada: regenerar los medios NO actualiza las notas desde la obra.
% Clave de sol, si bemol mayor, 3/4, negra = 120 y dinámica f.
% Entrada: 12 golpes de semicorchea en 3/4 sobre un compás de silencio MIDI.
% Una pasada. Los extremos han sido revisados para no añadir notas de otros compases.
% Regenerar desde la raíz: python3 verano/estudio/preparar_escalas.py
\header { title = "Verano" subtitle = "Estudio · compases 64–66" tagline = ##f }
#(set-global-staff-size 17)
\paper { #(set-paper-size "a5landscape") page-count = 1 indent = 0\mm ragged-last = ##f }
inicioEscala = {
  \once \override NoteHead.color = #(x11-color 'ForestGreen)
  \once \override Fingering.color = #(x11-color 'ForestGreen)
}
cambioCuerda = { \once \override Fingering.color = #blue }
subir = ^\markup \with-color #red \char #8593
bajar = ^\markup \with-color #red \char #8595
\score {
  \new Staff \with { midiInstrument = "violin" } \absolute {
    \clef treble \key sib \major \time 3/4 \tempo "Presto" 4 = 120
    \set Score.currentBarNumber = #63
    \once \omit Score.BarNumber
    R2.^\markup { \small \bold "Entrada · claqueta en semicorcheas" }
    \bar "||"
    \set Score.currentBarNumber = #64
    \override Score.BarNumber.break-visibility = ##(#t #t #t)
    \set Score.barNumberVisibility = #all-bar-numbers-visible
    \dynamicUp
  mib''16\f-4[ \inicioEscala \cambioCuerda mib'-1 fa' sol'] lab'-\tweak color #red -4\bajar[ \cambioCuerda si'!-1\subir do'' re''] mib''8-4 r8 | % 64
  r16 \inicioEscala \cambioCuerda mib'16\upbow-1[ fa' sol'] lab'-\tweak color #red -4\bajar[ \cambioCuerda si'!-1\subir do'' re''] mib''8-4 r8 | % 65
  r16 \inicioEscala \cambioCuerda mib'16\upbow-1[ fa' sol'] lab'-\tweak color #red -4\bajar[ \cambioCuerda si'!-1\subir do'' re''] mib''8-4 r8 | % 66
    \once \omit Score.BarNumber
    \bar "|."
  }
  \layout {} \midi {}
}

\markup \esquemaDigitacion
