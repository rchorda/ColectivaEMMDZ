\version "2.24.0"
\language "espanol"
% Fuente: ../../verano.ly; voz única de violín; intervalo [21,29).
% Copia controlada: regenerar los medios NO actualiza las notas desde la obra.
% Clave de sol; si bemol mayor; 3/4; negra = 160 orientativa; dinámica f.
% Entrada: un compás de 3/4, claqueta sintetizada sobre silencio MIDI, sin anacrusa.
% Una pasada. Los extremos han sido revisados para no añadir notas de otros compases.
% Regenerar desde la raíz: python3 verano/estudio/preparar_escalas.py
\header { title = "Verano" subtitle = "Estudio · compases 21–28" tagline = ##f }
#(set-global-staff-size 17)
\paper { #(set-paper-size "a5landscape") page-count = 1 indent = 0\mm ragged-last = ##f }
\score {
  \new Staff \with { midiInstrument = "violin" } \absolute {
    \clef treble \key sib \major \time 3/4 \tempo "Presto" 4 = 160
    \set Score.currentBarNumber = #20
    \once \omit Score.BarNumber
    R2.^\markup { \small \bold "Entrada · claqueta" }
    \bar "||"
    \set Score.currentBarNumber = #21
    \override Score.BarNumber.break-visibility = ##(#t #t #t)
    \set Score.barNumberVisibility = #all-bar-numbers-visible
    \dynamicUp
  re'16\f\downbow-0[ la'\upbow( sib' do''] re''[ mi''! fas'' sol'']) la''8-3 r8 | % 21
  r16 la'16\upbow( [ sib' do''] re''[ mi''! fas'' sol'']) la''8 r8 | % 22
  r16 sib'16\upbow( [ do'' re''] mib''![ fas'' sol'' la'']) sib''8 r8 | % 23
  r16 re''16\upbow-1( [ mi''! fas''] sol''[ la'' sib'' do''']) re'''8 r8 |  % 24
  r16 re''16\upbow-1( [ mi''! fas''] sol''[ la'' sib'' do''']) re'''8 r8 | % 25
  r16 la'16\upbow-0( [ sib' do''] re''[ mi''! fas'' sol'']) la''8 r8 | % 26
  r16 sib'16\upbow( [ do'' re''] mib''![ fas'' sol'' la'']) sib''8 r8 | % 27
  r16 re''16\upbow-1( [ mi''! fas''] sol''[ la'' sib'' do''']) re'''8-4 r8 |  % 28
    \once \omit Score.BarNumber
    \bar "|."
  }
  \layout {} \midi {}
}
