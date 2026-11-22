\version "2.24.0"
\language "espanol"
% Fuente: ../../verano.ly; voz única de violín; intervalo [21,29).
% Copia controlada: regenerar los medios NO actualiza las notas desde la obra.
% Clave de sol, si bemol mayor, 3/4, negra = 120 y dinámica f.
% Entrada: 12 golpes de semicorchea en 3/4 sobre un compás de silencio MIDI.
% Una pasada. Los extremos han sido revisados para no añadir notas de otros compases.
% Regenerar desde la raíz: python3 verano/estudio/preparar_escalas.py
\header { title = "Verano" subtitle = "Estudio · compases 21–28" tagline = ##f }
#(set-global-staff-size 17)
\paper { #(set-paper-size "a5landscape") page-count = 1 indent = 0\mm ragged-last = ##f }
primera = _\markup { \bold "I" }
tercera = _\markup { \bold "III" }
inicioEscala = { \once \override NoteHead.color = #(x11-color 'ForestGreen) }
cambioCuerda = { \once \override Fingering.color = #blue }
alterada = { \once \override Fingering.color = #red }
subir = ^\markup \with-color #red \char #8593
\score {
  \new Staff \with { midiInstrument = "violin" } \absolute {
    \clef treble \key sib \major \time 3/4 \tempo "Presto" 4 = 120
    \set Score.currentBarNumber = #20
    \once \omit Score.BarNumber
    R2.^\markup { \small \bold "Entrada · claqueta en semicorcheas" }
    \bar "||"
    \set Score.currentBarNumber = #21
    \override Score.BarNumber.break-visibility = ##(#t #t #t)
    \set Score.barNumberVisibility = #all-bar-numbers-visible
    \dynamicUp
  re'16\f\downbow-0[ \inicioEscala \cambioCuerda la'\upbow-0( sib' do''] re''[ \cambioCuerda mi''!-0\subir \alterada fas''-1\subir sol'']) la''8-3 r8 | % 21
  r16 \inicioEscala \cambioCuerda la'16\upbow-0( [ sib' do''] re''[ \cambioCuerda mi''!-0\subir \alterada fas''-1\subir sol'']) la''8-3 r8 | % 22
  r16 \inicioEscala \cambioCuerda sib'16\upbow-1( [ do'' re''] mib''!-4[ \cambioCuerda fas''-1\subir sol'' la'']) sib''8 r8 | % 23
  r16 \inicioEscala \cambioCuerda re''16\upbow-1\tercera( [ \alterada mi''!-2\subir \alterada fas''-3\subir] sol''[ \cambioCuerda la''-1 sib'' do''']) re'''8-4 r8 |  % 24
  r16 \inicioEscala \cambioCuerda re''16\upbow-1( [ \alterada mi''!-2\subir \alterada fas''-3\subir] sol''[ \cambioCuerda la''-1 sib'' do''']) re'''8-4 r8 | % 25
  r16 \inicioEscala \cambioCuerda la'16\upbow-0\primera( [ sib' do''] re''[ \cambioCuerda mi''!-0\subir \alterada fas''-1\subir sol'']) la''8-3 r8 | % 26
  r16 \inicioEscala \cambioCuerda sib'16\upbow-1( [ do'' re''] mib''!-4[ \cambioCuerda fas''-1\subir sol'' la'']) sib''8 r8 | % 27
  r16 \inicioEscala \cambioCuerda re''16\upbow-1\tercera( [ \alterada mi''!-2\subir \alterada fas''-3\subir] sol''[ \cambioCuerda la''-1 sib'' do''']) re'''8-4 r8 |  % 28
    \once \omit Score.BarNumber
    \bar "|."
  }
  \layout {} \midi {}
}
