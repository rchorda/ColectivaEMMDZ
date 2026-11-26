\version "2.24.0"
\language "espanol"
\include "esquema-digitacion.ily"
% Fuente: ../../verano.ly; voz única de violín; intervalo [38,41).
% Copia controlada: regenerar los medios NO actualiza las notas desde la obra.
% Clave de sol, si bemol mayor, 3/4, negra = 100 y dinámica f.
% Entrada: 12 golpes de semicorchea en 3/4 sobre un compás de silencio MIDI.
% Una pasada. Los extremos han sido revisados para no añadir notas de otros compases.
% Regenerar desde la raíz: python3 verano/estudio/preparar_escalas.py
\header { title = "Verano" subtitle = "Estudio · compases 38–40" tagline = ##f }
#(set-global-staff-size 17)
\paper { #(set-paper-size "a5landscape") page-count = 1 indent = 0\mm ragged-last = ##f }
inicioEscala = {
  \once \override NoteHead.color = #(x11-color 'ForestGreen)
  \once \override Fingering.color = #(x11-color 'ForestGreen)
}
cambioCuerda = { \once \override Fingering.color = #blue }
subir = ^\markup \with-color #red \char #8593
\score {
  \new Staff \with { midiInstrument = "violin" } \absolute {
    \clef treble \key sib \major \time 3/4 \tempo "Presto" 4 = 100
    \set Score.currentBarNumber = #37
    \once \omit Score.BarNumber
    R2.^\markup { \small \bold "Entrada · claqueta en semicorcheas" }
    \bar "||"
    \set Score.currentBarNumber = #38
    \override Score.BarNumber.break-visibility = ##(#t #t #t)
    \set Score.barNumberVisibility = #all-bar-numbers-visible
    \dynamicUp
  re''16\f[ \inicioEscala \cambioCuerda re'-0 mi'!-\tweak color #red -1\subir fa'] sol'[ \cambioCuerda la'-0 si'!-\tweak color #red -1\subir dos''-\tweak color #red -2\subir] re''[ \inicioEscala la'-0 si'-\tweak color #red -1\subir dos''-\tweak color #red -2\subir] | % 38
  re''16[ \cambioCuerda mi''!-0\subir fa'' sol''] la''[ \inicioEscala \cambioCuerda re''-1_\markup { \bold "III" } mi''-\tweak color #red -2\subir fa''-3] sol''-4[ \cambioCuerda la''-1 si''!-\tweak color #red -2\subir dos'''-\tweak color #red -3\subir] | % 39
  re'''4-4 r4 r4 | % 40
    \once \omit Score.BarNumber
    \bar "|."
  }
  \layout {} \midi {}
}

\markup \esquemaDigitacion
