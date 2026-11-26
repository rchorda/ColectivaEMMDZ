\version "2.24.0"
\language "espanol"
\include "esquema-digitacion.ily"
% Fuente: ../../verano.ly; voz única de violín; intervalo [113,117).
% Copia controlada: regenerar los medios NO actualiza las notas desde la obra.
% Clave de sol, si bemol mayor, 3/4, negra = 90 y dinámica f.
% Entrada: 12 golpes de semicorchea en 3/4 sobre un compás de silencio MIDI.
% Una pasada. Los extremos han sido revisados para no añadir notas de otros compases.
% Regenerar desde la raíz: python3 verano/estudio/preparar_escalas.py c113-c116
\header { title = "Verano" subtitle = "Estudio · compases 113–116" tagline = ##f }
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
    \clef treble \key sib \major \time 3/4 \tempo "Presto" 4 = 90
    \set Score.currentBarNumber = #112
    \once \omit Score.BarNumber
    R2.^\markup { \small \bold "Entrada · claqueta en semicorcheas" }
    \bar "||"
    \set Score.currentBarNumber = #113
    \override Score.BarNumber.break-visibility = ##(#t #t #t)
    \set Score.barNumberVisibility = #all-bar-numbers-visible
    \dynamicUp
  sol16[ \inicioEscala \cambioCuerda sol'\f-3 \cambioCuerda la'-0 sib'] do''[ re'' mib''-4 \cambioCuerda fas''-1\subir] sol''[ la'' \inicioEscala sib''-4 la''] | % 113
  sol''16[ fa''? \cambioCuerda mib''-4 re''] do''[ sib' la'\cuartoOpcional \cambioCuerda sol'-3] fas'-\tweak color #red -2\subir[ mi'!-\tweak color #red -1\subir re'\cuartoOpcional \cambioCuerda do'-3] | % 114
  \barNumberCheck #115
  sib16-2[ sol-0 sib sol] sib[ sol sib sol] sib[ sol sib sol] | % 115
  \barNumberCheck #116
  \cambioCuerda re'4-0 r4 r4 | % 116
  \barNumberCheck #117
    \once \omit Score.BarNumber
    \bar "|."
  }
  \layout {} \midi {}
}

\markup \esquemaDigitacion
