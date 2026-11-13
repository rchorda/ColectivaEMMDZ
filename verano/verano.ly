% Maquetación principal elegida: bloques musicales de longitud variable.
\version "2.24.0"
\language "espanol"
#(set-global-staff-size 17)

\paper {
  #(set-paper-size "a4")
  page-count = 3
  % Repartir el espacio libre entre sistemas, también en la última página.
  ragged-bottom = ##f
  ragged-last-bottom = ##f
  top-margin = 10\mm
  bottom-margin = 12\mm
  system-system-spacing = #'((basic-distance . 18)
                             (minimum-distance . 12)
                             (padding . 3)
                             (stretchability . 60))
  markup-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 8)
                             (padding . 2)
                             (stretchability . 0))
  top-system-spacing = #'((basic-distance . 6)
                          (minimum-distance . 6)
                          (padding . 2)
                          (stretchability . 0))
  last-bottom-spacing = #'((basic-distance . 6)
                           (minimum-distance . 6)
                           (padding . 2)
                           (stretchability . 0))
}

\header {
  title = "Verano"
  subtitle = "Presto — Bloques musicales"
}

musica = \absolute {
  \clef treble
  % Dos bemoles, como en la fotografía.
  \key sib \major
  \time 3/4
  % Cifra orientativa para la reproducción; el original solo indica Presto.
  \tempo "Presto" 4 = 160
  \autoLineBreaksOff

  \mark \markup \column {
    \line { \bold "G" \italic "¡Ay, que por desgracia sus temores son ciertos!" }
    \line { \italic "Truena y relampaguea el cielo, y el granizo troncha" }
  }
  sol'16\f[ sol sol sol] sol[ sol sol sol] sol[ sol sol sol] | % 1
  fa'16[ sol sol sol] sol[ sol sol sol] sol[ sol sol sol] | \break % 2
  \mark \markup { \italic "las cabezas de las espigas y de los erguidos tallos." }
  mib'16[ sol sol sol] sol[ sol sol sol] sol[ sol sol sol] | % 3
  re'16[ sol sol sol] sol[ sol sol sol] sol8 r8 | % 4
  R2.\fermata | \break % 5

  % Continuación de la sección G, según la página fotografiada.
  re''16[ re' re' re'] re'[ re' re' re'] re'[ re' re' re'] | % 6
  do''16[ re' re' re'] re'[ re' re' re'] re'[ re' re' re'] | % 7
  sib'16[ re' re' re'] re'[ re' re' re'] re'[ re' re' re'] | % 8
  la'16[ re' re' re'] re'[ re' re' re'] re'8 r8 | \break % 9
  % Espaciado proporcional para los compases 10–19, hasta cuatro por línea.
  \newSpacingSection
  \set Score.proportionalNotationDuration = #(ly:make-moment 1/16)
  \override Score.SpacingSpanner.uniform-stretching = ##t
  \override Score.SpacingSpanner.strict-note-spacing = ##f
  r16 re''16\upbow[ do'' sib'] la'[ sol' fas' mi'!] re'[ do' sib la] | % 10
  sol16[ sol sol sol] sol[ sol sol sol] sol[ sol sol sol] | \break % 11
  sol16[ sol'' fa'' mib''!] re''[ do'' sib' la'] sol'[ fa' mib' re'] | % 12
  do'16[ do' do' do'] do'[ do' do' do'] do'[ do' do' do'] | % 13
  do'16[ sib'' la'' sol''] fa''[ mib'' re'' do''] sib'[ la' sol' fa'] | % 14
  mib'16[ mib' mib' mib'] mib'[ mib' mib' mib'] mib'[ mib' mib' mib'] | \break % 15
  mib'16[ re'''-4 do''' sib''] la''-1[ sol''-4 fas'' mi''!] re''-1[ do''-4 sib' la'] | % 16
  sol'16-1[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] | % 17
  sol'16[ re''' do''' sib''] la''[ sol'' fas'' mi''!] re''[ do'' sib' la'] | % 18
  sol'16-1[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] | \break % 19
  \newSpacingSection
  \unset Score.proportionalNotationDuration
  \revert Score.SpacingSpanner.uniform-stretching
  \revert Score.SpacingSpanner.strict-note-spacing
  re''16-1[ sol' sol' sol'] re''[ sol' sol' sol'] re''[ sol' sol' sol'] | \break % 20
  % Igual ancho de compás en las líneas 21–24 y 25–28.
  \newSpacingSection
  \set Score.proportionalNotationDuration = #(ly:make-moment 1/16)
  \override Score.SpacingSpanner.uniform-stretching = ##t
  \override Score.SpacingSpanner.strict-note-spacing = ##f
  re'16\downbow-0[ la'\upbow( sib' do''] re''[ mi''! fas'' sol'']) la''8-3 r8 | % 21
  r16 la'16\upbow( [ sib' do''] re''[ mi''! fas'' sol'']) la''8 r8 | % 22
  r16 sib'16\upbow( [ do'' re''] mib''![ fas'' sol'' la'']) sib''8 r8 | % 23
  r16 re''16\upbow-1( [ mi''! fas''] sol''[ la'' sib'' do''']) re'''8 r8 | \break % 24
  r16 re''16\upbow-1( [ mi''! fas''] sol''[ la'' sib'' do''']) re'''8 r8 | % 25
  r16 la'16\upbow-0( [ sib' do''] re''[ mi''! fas'' sol'']) la''8 r8 | % 26
  r16 sib'16\upbow( [ do'' re''] mib''![ fas'' sol'' la'']) sib''8 r8 | % 27
  r16 re''16\upbow-1( [ mi''! fas''] sol''[ la'' sib'' do''']) re'''8-4 r8 | \break % 28
  \newSpacingSection
  \unset Score.proportionalNotationDuration
  \revert Score.SpacingSpanner.uniform-stretching
  \revert Score.SpacingSpanner.strict-note-spacing
  sib''16-4[ sol''-2 re'' sib'] sib''[ sol'' re'' sib'] sib''[ sol'' re'' sib'] | % 29
  re''16[ sib' sol' re'] re''[ sib' sol' re'] re''[ sib' sol' re'] | % 30
  sol'16[ re' sib sol] sol'[ re' sib sol] sol'[ re' sib sol] | \break % 31
  sol'16-3[ si'!16-1 sol' si'] sol'[ si' sol' si'] sol'[ si' sol' si'] | % 32
  sol'16-3[ do'' sol' do''] sol'[ do'' sol' do''] sol'[ do'' sol' do''] | % 33
  sol'16-3[ dos'' sol' dos''] sol'[ dos'' sol' dos''] sol'[ dos'' sol' dos''] | \pageBreak % 34
  la'16-0[ re''-3 la' re''] la'[ re'' la' re''] la'[ re'' la' re''] | % 35
  % Página fotografiada 13: continuación, compases 36–84.
  % Digitaciones y arcos a lápiz incluidos donde se distinguen.
  \barNumberCheck #36
  la'16[ re'' la' re''] la'[ re'' la' re''] la'[ re'' la' re''] | % 36
  la'16[ dos'' la' dos''] la'[ dos'' la' dos''] la'[ dos'' la' dos''] | \break % 37
  re''16[ re' mi'! fa'] sol'[ la' si'! dos''] re''[ la' si' dos''] |  % 38
  re''16[ mi''! fa'' sol''] la''[ re''-1 mi'' fa''-3] sol''-4[ la''-1 si''! dos'''] | % 39
  re'''4 r4 r4 | \break % 40
  re'4\p re' re' | % 41
  re'4 re' re' | % 42
  re'4 re' re' |  % 43
  re'4 r4 r4 | \break % 44
  re'4\p re' re' | % 45
  re'4 re' re' | % 46
  re'4 re' re' | % 47
  re'4 r4 r4 | \break % 48
  \compressMMRests { R2.*6 } | \break % 49–54
  \barNumberCheck #55
  \newSpacingSection
  \set Score.proportionalNotationDuration = #(ly:make-moment 1/16)
  \override Score.SpacingSpanner.uniform-stretching = ##t
  \override Score.SpacingSpanner.strict-note-spacing = ##f
  la''8\f[ re' re' re'' fa'' la''] | % 55
  sib''8[ re' re' re'' sol'' sib''] | % 56
  sib''8[ mi'! mi' mi''! sol'' sib''] | \break % 57
  la''8[ fa' fa' do'' fa'' la''] | % 58
  la''8[ re' re' re'' fa'' la''] |  % 59
  % Los bemoles recordatorios a lápiz de 60–61 reiteran la armadura.
  sol''8[ mib' mib' sib' mib''?-4 sol''] | \break % 60
  sol''8[ do' do' do'' mib''?-4 sol''] | % 61
  sol''8[ re' re' si'! re'' sol''] | % 62
  fa''8[ re' re' si'! re'' fa''] | \break % 63
  \newSpacingSection
  \unset Score.proportionalNotationDuration
  \revert Score.SpacingSpanner.uniform-stretching
  \revert Score.SpacingSpanner.strict-note-spacing
  mib''16[ mib' fa' sol'] lab'[ si'! do'' re''] mib''8 r8 | % 64
  r16 mib'16\upbow[ fa' sol'] lab'[ si'! do'' re''] mib''8 r8 | % 65
  r16 mib'16\upbow[ fa' sol'] lab'[ si'! do'' re''] mib''8 r8 | \break % 66
  % Confirmado: el trazo bajo el 67 indica mantener puesto el dedo 1.
  % El bemol entre paréntesis sobre el primer si es un recordatorio.
  \once \override TextSpanner.direction = #DOWN
  \once \override TextSpanner.style = #'line
  \once \override TextSpanner.staff-padding = #2.5
  \once \override TextSpanner.bound-details.left.text = \markup \finger "1"
  \once \override TextSpanner.bound-details.right.text = ##f
  mib'16\startTextSpan[ do'' sib'? do''] mib'[ do'' sib' do''] mib'[ do'' sib' do''\stopTextSpan] | % 67
  fa'16[ do'' sib' do''] fa'[ do'' sib' do''] fa'[ do'' sib' do''] | % 68
  sol'16[ do'' si'! do''] sol'[ do'' si' do''] sol'[ si' la' si'] | \break % 69
  do''16[ do' do' do'] do'-1[ do' do' do'] do'[ do' do' do'] | % 70
  sib'16-3[ do'-1 do' do'] do'[ do' do' do'] do'[ do' do' do'] |  % 71
  lab'16[ do' do' do'] do'[ do' do' do'] do'[ do' do' do'] | % 72
  sol'16[ do' do' do'] do'[ do' do' do'] do'8 r8 | \break % 73
  \compressMMRests { R2.*11 } | \pageBreak % 74–84
  \barNumberCheck #85

  % Última página fotografiada: compases 85–130.
  \newSpacingSection
  \set Score.proportionalNotationDuration = #(ly:make-moment 1/16)
  \override Score.SpacingSpanner.uniform-stretching = ##t
  \override Score.SpacingSpanner.strict-note-spacing = ##f
  do'16\f[ do' do' do'] do'[ do' do' do'] do'[ do' do' do'] | % 85
  lab'16[ do' do' do'] lab'[ do' do' do'] lab'[ do' do' do'] | % 86
  si!16[ si si si] si[ si si si] si[ si si si] |  % 87
  sol'16[ sib sib sib] sol'[ sib sib sib] sol'[ sib sib sib] | \break % 88
  la16[ la la la] la[ la la la] la[ la la la] | % 89
  fa'16[ lab lab lab] fa'[ lab lab lab] fa'[ lab lab lab] |  % 90
  sol16[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] | % 91
  mib''16[ sol' sol' sol'] mib''[ sol' sol' sol'] mib''[ sol' sol' sol'] | \break % 92
  fas'16[ fas' fas' fas'] fas'[ fas' fas' fas'] fas'[ fas' fas' fas'] |  % 93
  % Compás 94: fa natural, según el becuadro de la edición Ricordi.
  re''16[ fa'! fa' fa'] re''[ fa' fa' fa'] re''[ fa' fa' fa'] | % 94
  mi'!16[ mi' mi' mi'] mi'[ mi' mi' mi'] mi'[ mi' mi' mi'] | % 95
  do''16[ mib' mib' mib'] do''[ mib' mib' mib'] do''[ mib' mib' mib'] | \break % 96
  \newSpacingSection
  \unset Score.proportionalNotationDuration
  \revert Score.SpacingSpanner.uniform-stretching
  \revert Score.SpacingSpanner.strict-note-spacing
  re'4 r4 r4 | % 97
  \once \override MultiMeasureRest.expand-limit = #1
  \compressMMRests { R2.*3 } | \break % 98–100
  \barNumberCheck #101
  \newSpacingSection
  \set Score.proportionalNotationDuration = #(ly:make-moment 1/16)
  \override Score.SpacingSpanner.uniform-stretching = ##t
  \override Score.SpacingSpanner.strict-note-spacing = ##f
  r16 re''16\f\upbow[ do'' sib'] la'[ sol' fas' mi'!] re'[ do' sib la] | % 101
  sol16[ sol sol sol] sol[ sol sol sol] sol[ sol sol sol] |  % 102
  sol16[ sol'' fa'' mib''] re''[ do'' sib' la'] sol'[ fa' mib' re'] | % 103
  do'16[ do' do' do'] do'[ do' do' do'] do'[ do' do' do'] | \break % 104
  do'16[ sib'' la'' sol''] fa''[ mib'' re'' do''] sib'[ la' sol' fa'] |  % 105
  mib'16[ mib' mib' mib'] mib'[ mib' mib' mib'] mib'[ mib' mib' mib'] | % 106
  mib'16[ re'''-4 do''' sib''] la''[ sol'' fas'' mi''!] re''[ do'' sib' la'] | % 107
  sol'16[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] | \break % 108
  \newSpacingSection
  \unset Score.proportionalNotationDuration
  \revert Score.SpacingSpanner.uniform-stretching
  \revert Score.SpacingSpanner.strict-note-spacing
  sol'4 sol\p sol |  % 109
  sol4 sol sol | % 110
  sol4 sol sol | % 111
  sol4 sol sol | \break % 112
  sol16[ sol'\f la' sib'] do''[ re'' mib'' fas''] sol''[ la'' sib'' la''] | % 113
  sol''16[ fa''? mib'' re''] do''[ sib' la' sol'] fas'[ mi'! re' do'] |  % 114
  sib16[ sol sib sol] sib[ sol sib sol] sib[ sol sib sol] | % 115
  re'4 r4 r4 | \break % 116
  \once \override MultiMeasureRest.expand-limit = #1
  \compressMMRests { R2.*3 } | % 117–119
  \barNumberCheck #120
  re'16\f[ re' re' re'] re'[ re' re' re'] re'[ re' re' re'] | \break % 120
  \newSpacingSection
  \set Score.proportionalNotationDuration = #(ly:make-moment 1/16)
  \override Score.SpacingSpanner.uniform-stretching = ##t
  \override Score.SpacingSpanner.strict-note-spacing = ##f
  sol'16[ re' sib sol] sol'[ re' sib sol] sol'[ re' sib sol] | % 121
  sol'16[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] | % 122
  fas'16[ fas' fas' fas'] fas'[ fas' fas' fas'] fas'[ fas' fas' fas'] | \break % 123
  sol'16[ re' sib sol] sol'[ re' sib sol] sol'[ re' sib sol] | % 124
  sol'16[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] | % 125
  fas'16[ fas' fas' fas'] fas'[ fas' fas' fas'] fas'[ fas' fas' fas'] | \break % 126
  \newSpacingSection
  \unset Score.proportionalNotationDuration
  \revert Score.SpacingSpanner.uniform-stretching
  \revert Score.SpacingSpanner.strict-note-spacing
  sol'16[ sol' sol' sol'] sib'[ sib' sib' sib'] re''[ re'' re'' re''] | % 127
  sol''16[ sol'' sol'' sol''] sib''[ sib'' sib'' sib''] sol''[ sol'' sol'' sol''] | % 128
  re''16[ re'' re'' re''] sib'[ sib' sib' sib'] sol'[ sol' sol' sol'] | % 129
  sol2.\fermata \bar "|." % 130
  \barNumberCheck #131

}

\score {
  \new Staff \with { midiInstrument = "violin" } { \musica }
  \layout {
    \context {
      \Staff
      % Reservar un hueco visible entre la barra y la primera nota.
      \override BarLine.space-alist.next-note = #'(fixed-space . 2.0)
    }
  }
  \midi { }
}
