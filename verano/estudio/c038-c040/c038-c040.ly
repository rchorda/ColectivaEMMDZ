\version "2.24.0"
\language "espanol"
% Fuente: ../../verano.ly; voz única de violín; intervalo [38,41).
% Copia controlada: regenerar los medios NO actualiza las notas desde la obra.
% Clave de sol; si bemol mayor; 3/4; negra = 160 orientativa; dinámica f.
% Entrada: un compás de 3/4, claqueta sintetizada sobre silencio MIDI, sin anacrusa.
% Una pasada. Los extremos han sido revisados para no añadir notas de otros compases.
% Regenerar desde la raíz: python3 verano/estudio/preparar_escalas.py
\header { title = "Verano" subtitle = "Estudio · compases 38–40" tagline = ##f }
#(set-global-staff-size 17)
\paper { #(set-paper-size "a5landscape") page-count = 1 indent = 0\mm ragged-last = ##f }
\score {
  \new Staff \with { midiInstrument = "violin" } \absolute {
    \clef treble \key sib \major \time 3/4 \tempo "Presto" 4 = 160
    \set Score.currentBarNumber = #37
    \once \omit Score.BarNumber
    R2.^\markup { \small \bold "Entrada · claqueta" }
    \bar "||"
    \set Score.currentBarNumber = #38
    \override Score.BarNumber.break-visibility = ##(#t #t #t)
    \set Score.barNumberVisibility = #all-bar-numbers-visible
    \dynamicUp
  re''16\f[ re' mi'! fa'] sol'[ la' si'! dos''] re''[ la' si' dos''] |  % 38
  re''16[ mi''! fa'' sol''] la''[ re''-1 mi'' fa''-3] sol''-4[ la''-1 si''! dos'''] | % 39
  re'''4 r4 r4 |  % 40
    \once \omit Score.BarNumber
    \bar "|."
  }
  \layout {} \midi {}
}
