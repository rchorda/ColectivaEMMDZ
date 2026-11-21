\version "2.24.0"
\language "espanol"
% Fuente: ../../verano.ly; voz única de violín; intervalo [113,115).
% Copia controlada: regenerar los medios NO actualiza las notas desde la obra.
% Clave de sol, si bemol mayor, 3/4, negra = 120 y dinámica f.
% Entrada: 12 golpes de semicorchea en 3/4 sobre un compás de silencio MIDI.
% Una pasada. Los extremos han sido revisados para no añadir notas de otros compases.
% Regenerar desde la raíz: python3 verano/estudio/preparar_escalas.py
\header { title = "Verano" subtitle = "Estudio · compases 113–114" tagline = ##f }
#(set-global-staff-size 17)
\paper { #(set-paper-size "a5landscape") page-count = 1 indent = 0\mm ragged-last = ##f }
\score {
  \new Staff \with { midiInstrument = "violin" } \absolute {
    \clef treble \key sib \major \time 3/4 \tempo "Presto" 4 = 120
    \set Score.currentBarNumber = #112
    \once \omit Score.BarNumber
    R2.^\markup { \small \bold "Entrada · claqueta en semicorcheas" }
    \bar "||"
    \set Score.currentBarNumber = #113
    \override Score.BarNumber.break-visibility = ##(#t #t #t)
    \set Score.barNumberVisibility = #all-bar-numbers-visible
    \dynamicUp
  sol16[ sol'\f la' sib'] do''[ re'' mib'' fas''] sol''[ la'' sib'' la''] | % 113
  sol''16[ fa''? mib'' re''] do''[ sib' la' sol'] fas'[ mi'! re' do'] |  % 114
    \once \omit Score.BarNumber
    \bar "|."
  }
  \layout {} \midi {}
}
