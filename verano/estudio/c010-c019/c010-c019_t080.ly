\version "2.24.0"
\language "espanol"
\include "esquema-digitacion.ily"
% Fuente: ../../verano.ly; voz única de violín; intervalo [10,20).
% Copia controlada: regenerar los medios NO actualiza las notas desde la obra.
% Clave de sol, si bemol mayor, 3/4, negra = 80 y dinámica f.
% Entrada: 12 golpes de semicorchea en 3/4 sobre un compás de silencio MIDI.
% Una pasada. Los extremos han sido revisados para no añadir notas de otros compases.
% Regenerar desde la raíz: python3 verano/estudio/preparar_escalas.py
\header { title = "Verano" subtitle = "Estudio · compases 10–19" tagline = ##f }
#(set-global-staff-size 17)
\paper { #(set-paper-size "a5landscape") page-count = 1 indent = 0\mm ragged-last = ##f }
inicioEscala = {
  \once \override NoteHead.color = #(x11-color 'ForestGreen)
  \once \override Fingering.color = #(x11-color 'ForestGreen)
}
cuartoOpcional = ^\markup \with-color #blue \finger "(4)"
cambioCuerda = { \once \override Fingering.color = #blue }
subir = ^\markup \with-color #red \char #8593
\score {
  \new Staff \with { midiInstrument = "violin" } \absolute {
    \clef treble \key sib \major \time 3/4 \tempo "Presto" 4 = 80
    \set Score.currentBarNumber = #9
    \once \omit Score.BarNumber
    R2.^\markup { \small \bold "Entrada · claqueta en semicorcheas" }
    \bar "||"
    \set Score.currentBarNumber = #10
    \override Score.BarNumber.break-visibility = ##(#t #t #t)
    \set Score.barNumberVisibility = #all-bar-numbers-visible
    \dynamicUp
  r16\f \inicioEscala re''16-3\upbow[ do'' sib'] la'[ \cambioCuerda sol'-3 fas'-\tweak color #red -2\subir mi'!-\tweak color #red -1\subir] re'[ \cambioCuerda do'-3 sib la] | % 10
  sol16[ sol sol sol] sol[ sol sol sol] sol[ sol sol sol] |  % 11
  sol16[ \inicioEscala \cambioCuerda sol''-2 fa'' \cambioCuerda mib''!-4] re''[ do'' sib' la'\cuartoOpcional] \cambioCuerda sol'-3[ fa' mib' re'\cuartoOpcional] | % 12
  \cambioCuerda do'16-3[ do' do' do'] do'[ do' do' do'] do'[ do' do' do'] | % 13
  do'16[ \inicioEscala \cambioCuerda sib''-4 la'' sol''] fa''[ \cambioCuerda mib''-4 re'' do''] sib'[ la'\cuartoOpcional \cambioCuerda sol'-3 fa'] | % 14
  mib'16[ mib' mib' mib'] mib'[ mib' mib' mib'] mib'[ mib' mib' mib'] |  % 15
  mib'16[ \inicioEscala \cambioCuerda re'''-4_\markup { \bold "III" } do''' sib''] la''-1[ \cambioCuerda sol''-4 fas''-\tweak color #red -3\subir mi''!-\tweak color #red -2\subir] re''-1[ \cambioCuerda do''-4 sib' la'] | % 16
  sol'16-1[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] | % 17
  sol'16[ \inicioEscala \cambioCuerda re'''-4 do''' sib''] la''-1[ \cambioCuerda sol''-4 fas''-\tweak color #red -3\subir mi''!-\tweak color #red -2\subir] re''-1[ \cambioCuerda do''-4 sib' la'] | % 18
  sol'16-1[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] |  % 19
    \once \omit Score.BarNumber
    \bar "|."
  }
  \layout {} \midi {}
}

\markup \esquemaDigitacion
