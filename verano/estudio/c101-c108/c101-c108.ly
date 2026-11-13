\version "2.24.0"
\language "espanol"
% Fuente: ../../verano.ly; voz única de violín; intervalo [101,109).
% Copia controlada: regenerar los medios NO actualiza las notas desde la obra.
% Clave de sol; si bemol mayor; 3/4; negra = 160 orientativa; dinámica f.
% Entrada: un compás de 3/4, claqueta sintetizada sobre silencio MIDI, sin anacrusa.
% Una pasada. Los extremos han sido revisados para no añadir notas de otros compases.
% Regenerar desde la raíz: python3 verano/estudio/preparar_escalas.py
\header { title = "Verano" subtitle = "Estudio · compases 101–108" tagline = ##f }
#(set-global-staff-size 17)
\paper { #(set-paper-size "a5landscape") page-count = 1 indent = 0\mm ragged-last = ##f }
\score {
  \new Staff \with { midiInstrument = "violin" } \absolute {
    \clef treble \key sib \major \time 3/4 \tempo "Presto" 4 = 160
    \set Score.currentBarNumber = #100
    \once \omit Score.BarNumber
    R2.^\markup { \small \bold "Entrada · claqueta" }
    \bar "||"
    \set Score.currentBarNumber = #101
    \override Score.BarNumber.break-visibility = ##(#t #t #t)
    \set Score.barNumberVisibility = #all-bar-numbers-visible
    \dynamicUp
  r16 re''16\f\upbow[ do'' sib'] la'[ sol' fas' mi'!] re'[ do' sib la] | % 101
  sol16[ sol sol sol] sol[ sol sol sol] sol[ sol sol sol] |  % 102
  sol16[ sol'' fa'' mib''] re''[ do'' sib' la'] sol'[ fa' mib' re'] | % 103
  do'16[ do' do' do'] do'[ do' do' do'] do'[ do' do' do'] |  % 104
  do'16[ sib'' la'' sol''] fa''[ mib'' re'' do''] sib'[ la' sol' fa'] |  % 105
  mib'16[ mib' mib' mib'] mib'[ mib' mib' mib'] mib'[ mib' mib' mib'] | % 106
  mib'16[ re'''-4 do''' sib''] la''[ sol'' fas'' mi''!] re''[ do'' sib' la'] | % 107
  sol'16[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] |  % 108
    \once \omit Score.BarNumber
    \bar "|."
  }
  \layout {} \midi {}
}
