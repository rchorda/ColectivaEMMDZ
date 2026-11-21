\version "2.24.0"
\language "espanol"
% Fuente: ../../verano.ly; voz única de violín; intervalo [64,67).
% Copia controlada: regenerar los medios NO actualiza las notas desde la obra.
% Clave de sol, si bemol mayor, 3/4, negra = 120 y dinámica f.
% Entrada: 12 golpes de semicorchea en 3/4 sobre un compás de silencio MIDI.
% Una pasada. Los extremos han sido revisados para no añadir notas de otros compases.
% Regenerar desde la raíz: python3 verano/estudio/preparar_escalas.py
\header { title = "Verano" subtitle = "Estudio · compases 64–66" tagline = ##f }
#(set-global-staff-size 17)
\paper { #(set-paper-size "a5landscape") page-count = 1 indent = 0\mm ragged-last = ##f }
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
  mib''16\f[ mib' fa' sol'] lab'[ si'! do'' re''] mib''8 r8 | % 64
  r16 mib'16\upbow[ fa' sol'] lab'[ si'! do'' re''] mib''8 r8 | % 65
  r16 mib'16\upbow[ fa' sol'] lab'[ si'! do'' re''] mib''8 r8 |  % 66
    \once \omit Score.BarNumber
    \bar "|."
  }
  \layout {} \midi {}
}
