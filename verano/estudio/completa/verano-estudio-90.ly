% Maquetación principal elegida: bloques musicales de longitud variable.
\version "2.24.0"
\language "espanol"
\include "esquema-digitacion.ily"
#(set-global-staff-size 17)

\paper {
  #(set-paper-size "a4")
  page-count = 6
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
  subtitle = "Estudio completo · Violín"
}

inicioEscala = {
  \once \override NoteHead.color = #(x11-color 'ForestGreen)
  \once \override Fingering.color = #(x11-color 'ForestGreen)
}
cuartoOpcional = ^\markup \with-color #blue \finger "(4)"
cambioCuerda = { \once \override Fingering.color = #blue }
subir = ^\markup \with-color #red \char #8593

primera = _\markup { \bold "I" }
tercera = _\markup { \bold "III" }
alterada = { \once \override Fingering.color = #red }
bajar = ^\markup \with-color #red \char #8595
musica = \absolute {
  \clef treble
  % Dos bemoles, como en la fotografía.
  \key sib \major
  \time 3/4
  % El original solo indica Presto. Tempo de la versión base de estudio.
  \tempo "Presto" 4 = 90
  \autoLineBreaksOff
  \set Score.currentBarNumber = #0
  \once \omit Score.BarNumber
  R2.^\markup { \small \bold "Entrada · 12 semicorcheas" }
  \bar "||"
  \set Score.currentBarNumber = #1

  \mark \markup \column {
    \line { \bold "G" \italic "¡Ay, que por desgracia sus temores son ciertos!" }
    \line { \italic "Truena y relampaguea el cielo, y el granizo troncha" }
  }
  sol'16\f[ \cambioCuerda sol-0 sol sol] sol[ sol sol sol] sol[ sol sol sol] | % 1
  \cambioCuerda fa'16-2[ \cambioCuerda sol-0 sol sol] sol[ sol sol sol] sol[ sol sol sol] | \break % 2
  \mark \markup { \italic "las cabezas de las espigas y de los erguidos tallos." }
  \cambioCuerda mib'16-1[ \cambioCuerda sol-0 sol sol] sol[ sol sol sol] sol[ sol sol sol] | % 3
  \cambioCuerda re'16-0[ \cambioCuerda sol-0 sol sol] sol[ sol sol sol] sol8 r8 | % 4
  R2.\fermata | \break % 5

  % Continuación de la sección G, según la página fotografiada.
  \cambioCuerda re''16-3[ \cambioCuerda re'-0 re' re'] re'[ re' re' re'] re'[ re' re' re'] | % 6
  \cambioCuerda do''16-2[ \cambioCuerda re'-0 re' re'] re'[ re' re' re'] re'[ re' re' re'] | % 7
  \cambioCuerda sib'16-1[ \cambioCuerda re'-0 re' re'] re'[ re' re' re'] re'[ re' re' re'] | % 8
  \cambioCuerda la'16-0[ \cambioCuerda re'-0 re' re'] re'[ re' re' re'] re'8 r8 | \break % 9
  % Espaciado proporcional para los compases 10–19, hasta cuatro por línea.
  \newSpacingSection
  \set Score.proportionalNotationDuration = #(ly:make-moment 1/16)
  \override Score.SpacingSpanner.uniform-stretching = ##t
  \override Score.SpacingSpanner.strict-note-spacing = ##f
  r16 \inicioEscala \cambioCuerda re''16-3\upbow[ do'' sib'] la'[ \cambioCuerda sol'-3 fas'-\tweak color #red -2\subir mi'!-\tweak color #red -1\subir] re'[ \cambioCuerda do'-3 sib la] | % 10
  sol16[ sol sol sol] sol[ sol sol sol] sol[ sol sol sol] | \break % 11
  sol16[ \inicioEscala \cambioCuerda sol''-2 fa'' \cambioCuerda mib''!-4] re''[ do'' sib' la'\cuartoOpcional] \cambioCuerda sol'-3[ fa' mib' re'\cuartoOpcional] | % 12
  \cambioCuerda do'16-3[ do' do' do'] do'[ do' do' do'] do'[ do' do' do'] | % 13
  do'16[ \inicioEscala \cambioCuerda sib''-4 la'' sol''] fa''[ \cambioCuerda mib''-4 re'' do''] sib'[ la'\cuartoOpcional \cambioCuerda sol'-3 fa'] | % 14
  mib'16[ mib' mib' mib'] mib'[ mib' mib' mib'] mib'[ mib' mib' mib'] | \break % 15
  mib'16[ \inicioEscala \cambioCuerda re'''-4_\markup { \bold "III" } do''' sib''] la''-1[ \cambioCuerda sol''-4 fas''-\tweak color #red -3\subir mi''!-\tweak color #red -2\subir] re''-1[ \cambioCuerda do''-4 sib' la'] | % 16
  sol'16-1[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] | % 17
  sol'16[ \inicioEscala \cambioCuerda re'''-4 do''' sib''] la''-1[ \cambioCuerda sol''-4 fas''-\tweak color #red -3\subir mi''!-\tweak color #red -2\subir] re''-1[ \cambioCuerda do''-4 sib' la'] | % 18
  sol'16-1[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] | \pageBreak % 19
  \newSpacingSection
  \unset Score.proportionalNotationDuration
  \revert Score.SpacingSpanner.uniform-stretching
  \revert Score.SpacingSpanner.strict-note-spacing
  \cambioCuerda re''16-1[ \cambioCuerda sol'-1 sol' sol'] \cambioCuerda re''-1[ \cambioCuerda sol'-1 sol' sol'] \cambioCuerda re''-1[ \cambioCuerda sol'-1 sol' sol'] | \break % 20
  % Igual ancho de compás en las líneas 21–24 y 25–28.
  \newSpacingSection
  \set Score.proportionalNotationDuration = #(ly:make-moment 1/16)
  \override Score.SpacingSpanner.uniform-stretching = ##t
  \override Score.SpacingSpanner.strict-note-spacing = ##f
  re'16\downbow-0\primera[ \inicioEscala \cambioCuerda la'\upbow-0( sib' do''] re''[ \cambioCuerda mi''!-0\subir \alterada fas''-1\subir sol'']) la''8-3 r8 | % 21
  r16 \inicioEscala \cambioCuerda la'16\upbow-0( [ sib' do''] re''[ \cambioCuerda mi''!-0\subir \alterada fas''-1\subir sol'']) la''8-3 r8 | % 22
  r16 \inicioEscala \cambioCuerda sib'16\upbow-1( [ do'' re''] mib''!-4[ \cambioCuerda fas''-1\subir sol'' la'']) sib''8 r8 | % 23
  r16 \inicioEscala \cambioCuerda re''16\upbow-1\tercera( [ \alterada mi''!-2\subir \alterada fas''-3\subir] sol''[ \cambioCuerda la''-1 sib'' do''']) re'''8-4 r8 | \break % 24
  r16 \inicioEscala \cambioCuerda re''16\upbow-1( [ \alterada mi''!-2\subir \alterada fas''-3\subir] sol''[ \cambioCuerda la''-1 sib'' do''']) re'''8-4 r8 | % 25
  r16 \inicioEscala \cambioCuerda la'16\upbow-0\primera( [ sib' do''] re''[ \cambioCuerda mi''!-0\subir \alterada fas''-1\subir sol'']) la''8-3 r8 | % 26
  r16 \inicioEscala \cambioCuerda sib'16\upbow-1( [ do'' re''] mib''!-4[ \cambioCuerda fas''-1\subir sol'' la'']) sib''8 r8 | % 27
  r16 \inicioEscala \cambioCuerda re''16\upbow-1\tercera( [ \alterada mi''!-2\subir \alterada fas''-3\subir] sol''[ \cambioCuerda la''-1 sib'' do''']) re'''8-4 r8 | \break % 28
  \newSpacingSection
  \unset Score.proportionalNotationDuration
  \revert Score.SpacingSpanner.uniform-stretching
  \revert Score.SpacingSpanner.strict-note-spacing
  sib''16-4\primera[ sol''-2 \cambioCuerda re''-3 sib'] \cambioCuerda sib''-4[ sol'' \cambioCuerda re''-3 sib'] \cambioCuerda sib''-4[ sol'' \cambioCuerda re''-3 sib'] | % 29
  re''16[ sib' \cambioCuerda sol'-3 re'] \cambioCuerda re''-3[ sib' \cambioCuerda sol'-3 re'] \cambioCuerda re''-3[ sib' \cambioCuerda sol'-3 re'] | % 30
  sol'16[ re' \cambioCuerda sib-2 sol] \cambioCuerda sol'-3[ re' \cambioCuerda sib-2 sol] \cambioCuerda sol'-3[ re' \cambioCuerda sib-2 sol] | \break % 31
  \cambioCuerda sol'16-3[ \cambioCuerda si'!16-1\subir \cambioCuerda sol'-3 \cambioCuerda si'-1\subir] \cambioCuerda sol'-3[ \cambioCuerda si'-1\subir \cambioCuerda sol'-3 \cambioCuerda si'-1\subir] \cambioCuerda sol'-3[ \cambioCuerda si'-1\subir \cambioCuerda sol'-3 \cambioCuerda si'-1\subir] | % 32
  \cambioCuerda sol'16-3[ \cambioCuerda do''-2 \cambioCuerda sol'-3 \cambioCuerda do''-2] \cambioCuerda sol'-3[ \cambioCuerda do''-2 \cambioCuerda sol'-3 \cambioCuerda do''-2] \cambioCuerda sol'-3[ \cambioCuerda do''-2 \cambioCuerda sol'-3 \cambioCuerda do''-2] | % 33
  \cambioCuerda sol'16-3[ \cambioCuerda dos''-2\subir \cambioCuerda sol'-3 \cambioCuerda dos''-2\subir] \cambioCuerda sol'-3[ \cambioCuerda dos''-2\subir \cambioCuerda sol'-3 \cambioCuerda dos''-2\subir] \cambioCuerda sol'-3[ \cambioCuerda dos''-2\subir \cambioCuerda sol'-3 \cambioCuerda dos''-2\subir] | \break % 34
  la'16-0[ re''-3 la' re''] la'[ re'' la' re''] la'[ re'' la' re''] | % 35
  % Página fotografiada 13: continuación, compases 36–84.
  % Digitaciones y arcos a lápiz incluidos donde se distinguen.
  \barNumberCheck #36
  la'16[ re'' la' re''] la'[ re'' la' re''] la'[ re'' la' re''] | % 36
  la'16[ \alterada dos''-2\subir la' \alterada dos''-2\subir] la'[ \alterada dos''-2\subir la' \alterada dos''-2\subir] la'[ \alterada dos''-2\subir la' \alterada dos''-2\subir] | \break % 37
  re''16[ \inicioEscala \cambioCuerda re'-0 mi'!-\tweak color #red -1\subir fa'] sol'[ \cambioCuerda la'-0 si'!-\tweak color #red -1\subir dos''-\tweak color #red -2\subir] re''[ \inicioEscala la'-0 si'-\tweak color #red -1\subir dos''-\tweak color #red -2\subir] |  % 38
  re''16[ \cambioCuerda mi''!-0\subir fa'' sol''] la''[ \inicioEscala \cambioCuerda re''-1_\markup { \bold "III" } mi''-\tweak color #red -2\subir fa''-3] sol''-4[ \cambioCuerda la''-1 si''!-\tweak color #red -2\subir dos'''-\tweak color #red -3\subir] | % 39
  re'''4-4 r4 r4 | \pageBreak % 40
  \cambioCuerda re'4\p-0\primera re' re' | % 41
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
  \cambioCuerda la''8\f-3[ \cambioCuerda re'-0 re' \cambioCuerda re''-3 \cambioCuerda fa''-1 la''] | % 55
  sib''8[ \cambioCuerda re'-0 re' \cambioCuerda re''-3 \cambioCuerda sol''-2 sib''] | % 56
  sib''8[ \cambioCuerda mi'!-1\subir \alterada mi'-1\subir \cambioCuerda mi''!-0\subir sol'' sib''] | \break % 57
  la''8[ \cambioCuerda fa'-2 fa' \cambioCuerda do''-2 \cambioCuerda fa''-1 la''] | % 58
  la''8[ \cambioCuerda re'-0 re' \cambioCuerda re''-3 \cambioCuerda fa''-1 la''] |  % 59
  % Los bemoles recordatorios a lápiz de 60–61 reiteran la armadura.
  sol''8[ \cambioCuerda mib'-1 mib' \cambioCuerda sib'-1 mib''?-4 \cambioCuerda sol''-2] | \break % 60
  sol''8[ \cambioCuerda do'-3 do' \cambioCuerda do''-2 mib''?-4 \cambioCuerda sol''-2] | % 61
  sol''8[ \cambioCuerda re'-0 re' \cambioCuerda si'!-1\subir re'' \cambioCuerda sol''-2] | % 62
  fa''8[ \cambioCuerda re'-0 re' \cambioCuerda si'!-1\subir re'' \cambioCuerda fa''-1] | \break % 63
  \newSpacingSection
  \unset Score.proportionalNotationDuration
  \revert Score.SpacingSpanner.uniform-stretching
  \revert Score.SpacingSpanner.strict-note-spacing
  \cambioCuerda mib''16-4[ \inicioEscala \cambioCuerda mib'-1 fa' sol'] lab'-\tweak color #red -4\bajar[ \cambioCuerda si'!-1\subir do'' re''] mib''8-4 r8 | % 64
  r16 \inicioEscala \cambioCuerda mib'16\upbow-1[ fa' sol'] lab'-\tweak color #red -4\bajar[ \cambioCuerda si'!-1\subir do'' re''] mib''8-4 r8 | % 65
  r16 \inicioEscala \cambioCuerda mib'16\upbow-1[ fa' sol'] lab'-\tweak color #red -4\bajar[ \cambioCuerda si'!-1\subir do'' re''] mib''8-4 r8 | \pageBreak % 66
  % Confirmado: el trazo bajo el 67 indica mantener puesto el dedo 1.
  % El bemol entre paréntesis sobre el primer si es un recordatorio.
  \once \override TextSpanner.direction = #DOWN
  \once \override TextSpanner.style = #'line
  \once \override TextSpanner.staff-padding = #2.5
  \once \override TextSpanner.bound-details.left.text = \markup \finger "1"
  \once \override TextSpanner.bound-details.right.text = ##f
  \cambioCuerda mib'16\startTextSpan-1[ \cambioCuerda do''-2 sib'? do''] \cambioCuerda mib'-1[ \cambioCuerda do''-2 sib' do''] \cambioCuerda mib'-1[ \cambioCuerda do''-2 sib' do''\stopTextSpan] | % 67
  \cambioCuerda fa'16-2[ \cambioCuerda do''-2 sib' do''] \cambioCuerda fa'-2[ \cambioCuerda do''-2 sib' do''] \cambioCuerda fa'-2[ \cambioCuerda do''-2 sib' do''] | % 68
  \cambioCuerda sol'16-3[ \cambioCuerda do''-2 \alterada si'!-1\subir do''] \cambioCuerda sol'-3[ \cambioCuerda do''-2 \alterada si'-1\subir do''] \cambioCuerda sol'-3[ \cambioCuerda si'-1\subir la' \alterada si'-1\subir] | \break % 69
  \cambioCuerda do''16-4\tercera[ \cambioCuerda do'-1 do' do'] do'-1[ do' do' do'] do'[ do' do' do'] | % 70
  \cambioCuerda sib'16-3[ \cambioCuerda do'-1 do' do'] do'[ do' do' do'] do'[ do' do' do'] |  % 71
  \cambioCuerda lab'16-2\bajar[ \cambioCuerda do'-1 do' do'] do'[ do' do' do'] do'[ do' do' do'] | % 72
  \cambioCuerda sol'16-1[ \cambioCuerda do'-1 do' do'] do'[ do' do' do'] do'8 r8 | \break % 73
  \compressMMRests { R2.*11 } | \break % 74–84
  \barNumberCheck #85

  % Última página fotografiada: compases 85–130.
  \newSpacingSection
  \set Score.proportionalNotationDuration = #(ly:make-moment 1/16)
  \override Score.SpacingSpanner.uniform-stretching = ##t
  \override Score.SpacingSpanner.strict-note-spacing = ##f
  do'16\f[ do' do' do'] do'[ do' do' do'] do'[ do' do' do'] | % 85
  \cambioCuerda lab'16-2\bajar[ \cambioCuerda do'-1 do' do'] \cambioCuerda lab'-2\bajar[ \cambioCuerda do'-1 do' do'] \cambioCuerda lab'-2\bajar[ \cambioCuerda do'-1 do' do'] | % 86
  \alterada si!16-2\subir\primera[ \alterada si-2\subir \alterada si-2\subir \alterada si-2\subir] \alterada si-2\subir[ \alterada si-2\subir \alterada si-2\subir \alterada si-2\subir] \alterada si-2\subir[ \alterada si-2\subir \alterada si-2\subir \alterada si-2\subir] |  % 87
  \cambioCuerda sol'16-3[ \cambioCuerda sib-2 sib sib] \cambioCuerda sol'-3[ \cambioCuerda sib-2 sib sib] \cambioCuerda sol'-3[ \cambioCuerda sib-2 sib sib] | \break % 88
  la16[ la la la] la[ la la la] la[ la la la] | % 89
  \cambioCuerda fa'16-2[ \cambioCuerda lab-1\bajar \alterada lab-1\bajar \alterada lab-1\bajar] \cambioCuerda fa'-2[ \cambioCuerda lab-1\bajar \alterada lab-1\bajar \alterada lab-1\bajar] \cambioCuerda fa'-2[ \cambioCuerda lab-1\bajar \alterada lab-1\bajar \alterada lab-1\bajar] |  % 90
  sol16[ \cambioCuerda sol'-3 sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] | % 91
  \cambioCuerda mib''16-4[ \cambioCuerda sol'-3 sol' sol'] \cambioCuerda mib''-4[ \cambioCuerda sol'-3 sol' sol'] \cambioCuerda mib''-4[ \cambioCuerda sol'-3 sol' sol'] | \break % 92
  \alterada fas'16-2\subir[ \alterada fas'-2\subir \alterada fas'-2\subir \alterada fas'-2\subir] \alterada fas'-2\subir[ \alterada fas'-2\subir \alterada fas'-2\subir \alterada fas'-2\subir] \alterada fas'-2\subir[ \alterada fas'-2\subir \alterada fas'-2\subir \alterada fas'-2\subir] |  % 93
  % Compás 94: fa natural, según el becuadro de la edición Ricordi.
  \cambioCuerda re''16-3[ \cambioCuerda fa'!-2 fa' fa'] \cambioCuerda re''-3[ \cambioCuerda fa'-2 fa' fa'] \cambioCuerda re''-3[ \cambioCuerda fa'-2 fa' fa'] | % 94
  \alterada mi'!16-1\subir[ \alterada mi'-1\subir \alterada mi'-1\subir \alterada mi'-1\subir] \alterada mi'-1\subir[ \alterada mi'-1\subir \alterada mi'-1\subir \alterada mi'-1\subir] \alterada mi'-1\subir[ \alterada mi'-1\subir \alterada mi'-1\subir \alterada mi'-1\subir] | % 95
  \cambioCuerda do''16-2[ \cambioCuerda mib'-1 mib' mib'] \cambioCuerda do''-2[ \cambioCuerda mib'-1 mib' mib'] \cambioCuerda do''-2[ \cambioCuerda mib'-1 mib' mib'] | \break % 96
  \newSpacingSection
  \unset Score.proportionalNotationDuration
  \revert Score.SpacingSpanner.uniform-stretching
  \revert Score.SpacingSpanner.strict-note-spacing
  re'4 r4 r4 | % 97
  \once \override MultiMeasureRest.expand-limit = #1
  \compressMMRests { R2.*3 } | \pageBreak % 98–100
  \barNumberCheck #101
  \newSpacingSection
  \set Score.proportionalNotationDuration = #(ly:make-moment 1/16)
  \override Score.SpacingSpanner.uniform-stretching = ##t
  \override Score.SpacingSpanner.strict-note-spacing = ##f
  r16 \inicioEscala \cambioCuerda re''16\f-3\upbow[ do'' sib'] la'[ \cambioCuerda sol'-3 fas'-\tweak color #red -2\subir mi'!-\tweak color #red -1\subir] re'[ \cambioCuerda do'-3 sib la] | % 101
  sol16[ sol sol sol] sol[ sol sol sol] sol[ sol sol sol] |  % 102
  sol16[ \inicioEscala \cambioCuerda sol''-2 fa'' \cambioCuerda mib''-4] re''[ do'' sib' la'\cuartoOpcional] \cambioCuerda sol'-3[ fa' mib' re'\cuartoOpcional] | % 103
  \cambioCuerda do'16-3[ do' do' do'] do'[ do' do' do'] do'[ do' do' do'] | \break % 104
  do'16[ \inicioEscala \cambioCuerda sib''-4 la'' sol''] fa''[ \cambioCuerda mib''-4 re'' do''] sib'[ la'\cuartoOpcional \cambioCuerda sol'-3 fa'] |  % 105
  mib'16[ mib' mib' mib'] mib'[ mib' mib' mib'] mib'[ mib' mib' mib'] | % 106
  mib'16[ \inicioEscala \cambioCuerda re'''-4_\markup { \bold "III" } do''' sib''] la''-1[ \cambioCuerda sol''-4 fas''-\tweak color #red -3\subir mi''!-\tweak color #red -2\subir] re''-1[ \cambioCuerda do''-4 sib' la'] | % 107
  sol'16-1[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] | \break % 108
  \newSpacingSection
  \unset Score.proportionalNotationDuration
  \revert Score.SpacingSpanner.uniform-stretching
  \revert Score.SpacingSpanner.strict-note-spacing
  sol'4 \cambioCuerda sol\p-0\primera sol |  % 109
  sol4 sol sol | % 110
  sol4 sol sol | % 111
  sol4 sol sol | \break % 112
  sol16[ \inicioEscala \cambioCuerda sol'\f-3 \cambioCuerda la'-0 sib'] do''[ re'' mib''-4 \cambioCuerda fas''-1\subir] sol''[ la'' \inicioEscala sib''-4 la''] | % 113
  sol''16[ fa''? \cambioCuerda mib''-4 re''] do''[ sib' la'\cuartoOpcional \cambioCuerda sol'-3] fas'-\tweak color #red -2\subir[ mi'!-\tweak color #red -1\subir re'\cuartoOpcional \cambioCuerda do'-3] |  % 114
  sib16[ sol sib sol] sib[ sol sib sol] sib[ sol sib sol] | % 115
  \cambioCuerda re'4-0 r4 r4 | \break % 116
  \once \override MultiMeasureRest.expand-limit = #1
  \compressMMRests { R2.*3 } | \pageBreak % 117–119
  \barNumberCheck #120
  re'16\f[ re' re' re'] re'[ re' re' re'] re'[ re' re' re'] | \break % 120
  \newSpacingSection
  \set Score.proportionalNotationDuration = #(ly:make-moment 1/16)
  \override Score.SpacingSpanner.uniform-stretching = ##t
  \override Score.SpacingSpanner.strict-note-spacing = ##f
  sol'16[ re' \cambioCuerda sib-2 sol] \cambioCuerda sol'-3[ re' \cambioCuerda sib-2 sol] \cambioCuerda sol'-3[ re' \cambioCuerda sib-2 sol] | % 121
  \cambioCuerda sol'16-3[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] | % 122
  \alterada fas'16-2\subir[ \alterada fas'-2\subir \alterada fas'-2\subir \alterada fas'-2\subir] \alterada fas'-2\subir[ \alterada fas'-2\subir \alterada fas'-2\subir \alterada fas'-2\subir] \alterada fas'-2\subir[ \alterada fas'-2\subir \alterada fas'-2\subir \alterada fas'-2\subir] | \break % 123
  sol'16[ re' \cambioCuerda sib-2 sol] \cambioCuerda sol'-3[ re' \cambioCuerda sib-2 sol] \cambioCuerda sol'-3[ re' \cambioCuerda sib-2 sol] | % 124
  \cambioCuerda sol'16-3[ sol' sol' sol'] sol'[ sol' sol' sol'] sol'[ sol' sol' sol'] | % 125
  \alterada fas'16-2\subir[ \alterada fas'-2\subir \alterada fas'-2\subir \alterada fas'-2\subir] \alterada fas'-2\subir[ \alterada fas'-2\subir \alterada fas'-2\subir \alterada fas'-2\subir] \alterada fas'-2\subir[ \alterada fas'-2\subir \alterada fas'-2\subir \alterada fas'-2\subir] | \break % 126
  \newSpacingSection
  \unset Score.proportionalNotationDuration
  \revert Score.SpacingSpanner.uniform-stretching
  \revert Score.SpacingSpanner.strict-note-spacing
  sol'16[ sol' sol' sol'] \cambioCuerda sib'-1[ sib' sib' sib'] re''[ re'' re'' re''] | % 127
  \cambioCuerda sol''16-2[ sol'' sol'' sol''] sib''[ sib'' sib'' sib''] sol''[ sol'' sol'' sol''] | % 128
  \cambioCuerda re''16-3[ re'' re'' re''] sib'[ sib' sib' sib'] \cambioCuerda sol'-3[ sol' sol' sol'] | % 129
  \cambioCuerda sol2.\fermata-0 \bar "|." % 130
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
  }

\markup \esquemaDigitacion

\score {
  <<
    \new Staff \with { midiInstrument = "violin" } { \musica }
    \new DrumStaff \drummode {
      cl16\ff cl\p cl cl cl\f cl\p cl cl cl\f cl\p cl cl
    }
  >>
  \midi { }
}
