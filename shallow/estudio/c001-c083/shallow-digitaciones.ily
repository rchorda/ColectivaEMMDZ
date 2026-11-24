% Copia de estudio de violinUno y violinDos de ../../shallow-musica.ly.
% Compases [1,84). Mantener ambas voces cotejadas si cambia la fuente.
% Las cifras azules señalan cruces; el verde, el inicio de la escala.
% Las flechas señalan alteraciones respecto a sol mayor.

primeraEstudio = _\markup { \bold "I" }
subirEstudio = ^\markup { \with-color #red \char #8593 }
inicioEscalaShallow = {
  \once \override NoteHead.color = #(x11-color 'ForestGreen)
}

violinUnoEstudio = \absolute {
  \global
  \clef treble
  si'2-1\pp la'4-0 si'4-1~ | % 1
  si'2 si2-\tweak color #blue -2 | % 2
  sol'1-\tweak color #blue -3 | % 3
  si'2-\tweak color #blue -1( la'2-0) | % 4
  si'2-1 la'4-0 si'4-1~ | % 5

  \barNumberCheck #6
  si'1 | % 6
  si'2-1 la'4-0 si'4-1~ | % 7
  si'2 si2-\tweak color #blue -2 | % 8
  sol'1-\tweak color #blue -3 | % 9
  si'2-\tweak color #blue -1 la'2-0 | % 10

  \barNumberCheck #11
  si'2-1\downbow la'4-0 si'4-1~ | % 11
  si'2 si2-\tweak color #blue -2 | % 12
  sol'1-\tweak color #blue -3 | % 13
  si'2-\tweak color #blue -1( la'2-0) | % 14
  si'2-1 la'4-0 si'4-1~ | % 15

  \barNumberCheck #16
  si'2 si2-\tweak color #blue -2 | % 16
  sol'1-\tweak color #blue -3 | % 17
  si'2-\tweak color #blue -1( la'2-0) | % 18
  si'2-1 la'4-0 si'4-1~ | % 19
  si'2 si2-\tweak color #blue -2 | % 20

  \barNumberCheck #21
  sol'1-\tweak color #blue -3 | % 21
  si'2-\tweak color #blue -1( la'2-0) | % 22
  si'2-1 la'4-0 si'4-1~ | % 23
  si'2 si2-\tweak color #blue -2 | % 24
  si'2-\tweak color #blue -1 la'4-0 si'4-1~ | % 25

  \barNumberCheck #26
  si'1 | % 26
  si'2-1\upbow la'4-0 si'4-1~( | % 27
  si'2~ si'8 sol''4-\tweak color #blue -2)\downbow re''8-\tweak color #blue -3\upbow | % 28
  mi''1-\tweak color #blue -0 | % 29
  si'2-\tweak color #blue -1( la'2-0) | % 30

  \barNumberCheck #31
  si'2-1 la'4-0 si'4-1~ | % 31
  si'2 si2-\tweak color #blue -2 | % 32
  sol'1-\tweak color #blue -3 | % 33
  si'2-\tweak color #blue -1 la'2-0 | % 34
  si'2-1 re'4.-\tweak color #blue -0 sol'8-3~ | % 35
  sol'2 sol'2-3 | % 36

  \barNumberCheck #37
  sol'1-3 | % 37
  sol'1-3 | % 38
  si'2-\tweak color #blue -1 re'4.-\tweak color #blue -0 sol'8-3~ | % 39
  sol'1 | % 40
  sol'1-3( | % 41
  sol'2-3) \breathe r2 | % 42

  \barNumberCheck #43
  do'''8-\tweak color #blue -3\tercera[\f\downbow do'''8 do'''8 do'''8~] do'''8 si''4.-2^\markup { \small "½ tono" } | % 43
  la''8-1[ la''8 si''8-2 la''8-1~] la''8 sol''4.-\tweak color #blue -4 | % 44
  si''8-\tweak color #blue -2[ si''8 si''8 re'''8-4~] re'''8 sol''4-\tweak color #blue -4 sol''8\upbow~( | % 45
  sol''8[ la''8-\tweak color #blue -1)] si''2-2\downbow \breathe r4 | % 46
  do'''8-3[\downbow do'''8 do'''8 do'''8~] do'''8 si''4.-2 | % 47

  \barNumberCheck #48
  la''8-1[\downbow la''8 si''8-2 la''8-1~] la''8 sol''4-\tweak color #blue -4( re''8-1) | % 48
  % El signo de arco sobre el primer si está tachado en el original anotado.
  si''8-\tweak color #blue -2[ si''8 si''8 re'''8-4~] re'''8 sol''4-\tweak color #blue -4 sol''8\upbow~( | % 49
  sol''8[ la''8-\tweak color #blue -1)] si''2-2\downbow \breathe r4 | % 50
  r4 sol''8-2\primeraEstudio[\downbow sol''8] sol''8 sol''4. | % 51
  fas''8-1[ fas''8( sol''8-2) fas''8-1~] fas''2 | % 52

  \barNumberCheck #53
  \breathe r4 sol''8-2[\downbow sol''8] sol''4 fas''8-1[ fas''8] | % 53
  fas''8-1 mi''4-0 mi''8~ mi''2 | % 54
  r4 sol''8-2[\downbow sol''8] sol''8 sol''4. | % 55
  fas''8-1[ fas''8( sol''8-2) fas''8-1~] fas''4. re''8-\tweak color #blue -3\upbow | % 56
  sol''8-\tweak color #blue -2[\downbow sol''8 sol''8 sol''8~] sol''8 re''4-\tweak color #blue -3 si'8-1~ | % 57
  si'1 | % 58

  \barNumberCheck #59
  R1 | % 59
  fas''2-\tweak color #blue -1 fas''8[( sol''8-2)] fas''4-1 | % 60
  mi''2-0 r4 r8 fas''8-1\downbow~ | % 61
  fas''4 r8 sol''8-2\upbow~( sol''8[ si''8-4) sol''8-2\downbow fas''8-1\upbow] | % 62
  mi''2-0 si''4-4 sol''8-2[\downbow fas''8-1\upbow~] | % 63

  \barNumberCheck #64
  fas''4 r8 fas''8-1\downbow~( fas''8[ sol''8-2) fas''8-1\upbow sol''8-2\downbow] | % 64
  si''1-4\upbow | % 65
  si''2-4 \inicioEscalaShallow si'16-\tweak color #blue -1[\upbow( dos''16-\tweak color #red -2\subirEstudio re''16-3 mi''16-\tweak color #blue -0] fas''16-1[ sol''16-2 la''16-1\tercera si''16-2)] | % 66
  do'''8-3[\ff\downbow do'''8 do'''8 do'''8~] do'''8 si''4-2 do'''16-3[\upbow( si''16-2)] | % 67

  \barNumberCheck #68
  la''8-1[\downbow la''8 si''8-2 la''8-1~] la''8 sol''4-\tweak color #blue -4 re''8-1 | % 68
  si''8-\tweak color #blue -2[ si''8 si''8 re'''8-4~] re'''8 sol''4-\tweak color #blue -4 sol''8\upbow~( | % 69
  sol''16[ la''16-\tweak color #blue -1)] si''4.-2\downbow \breathe r2 | % 70
  do'''8-3[\downbow do'''8 do'''8 do'''8~] do'''8 si''4.-2 | % 71

  \barNumberCheck #72
  la''8-1[ la''8 si''8-2 la''8-1~] la''8 sol''4-\tweak color #blue -4(\upbow re''8-1) | % 72
  sol''8-\tweak color #blue -2\primeraEstudio[ sol''8 sol''8 sol''8~] sol''8 re''4-\tweak color #blue -3 si'8-1~ | % 73
  si'2 r2 | % 74
  r4 sol''8-\tweak color #blue -2[\downbow sol''8] sol''8 sol''4. | % 75
  fas''8-1[ fas''8( sol''8-2) fas''8-1~] fas''2 | % 76

  \barNumberCheck #77
  \breathe r4 sol''8-2[\downbow sol''8] sol''4 fas''8-1[ fas''8] | % 77
  fas''8-1 mi''4-0 mi''8~ mi''2 | % 78
  r4 mi''8-0[\downbow mi''8] mi''8 mi''4. | % 79
  re''4-\tweak color #blue -3 mi''8-\tweak color #blue -0[ fas''8-1~] fas''4 r8 re''8-\tweak color #blue -3\upbow | % 80
  sol''8-\tweak color #blue -2[\downbow sol''8 sol''8 sol''8~] sol''8 re''4-\tweak color #blue -3 si'8-1\upbow~ | % 81

  \barNumberCheck #82
  si'1 | % 82
  mi'1-\tweak color #blue -1\downbow\fermata | % 83
  \barNumberCheck #84
}

violinDosEstudio = \absolute {
  \global
  \clef treble
  sol'2-3\pp re'2-0 | % 1
  re'1-0 | % 2
  mi'1-1 | % 3
  re'2-0( fas'2-2) | % 4
  sol'2-3 re'2-0 | % 5

  \barNumberCheck #6
  re'1-0 | % 6
  sol'2-3 re'2-0 | % 7
  re'1-0 | % 8
  mi'1-1 | % 9
  re'2-0\downbow re'8[\downbow \tuplet 3/2 { mi'16-1( fas'16-2 mi'16-1] } re'8-0[ la'8-\tweak color #blue -0)] | % 10

  \barNumberCheck #11
  sol'2-\tweak color #blue -3 re'2-0 | % 11
  re'1-0 | % 12
  mi'1-1 | % 13
  re'2-0\downbow re'8[\downbow \tuplet 3/2 { mi'16-1( fas'16-2 mi'16-1] } re'8-0[ la'8-\tweak color #blue -0)] | % 14
  sol'2-\tweak color #blue -3 re'2-0 | % 15

  \barNumberCheck #16
  re'1-0 | % 16
  mi'1-1 | % 17
  re'2-0\downbow re'8[\downbow \tuplet 3/2 { mi'16-1( fas'16-2 mi'16-1] } re'8-0[ la'8-\tweak color #blue -0)] | % 18
  sol'2-\tweak color #blue -3 re'2-0 | % 19
  re'1-0 | % 20

  \barNumberCheck #21
  mi'1-1 | % 21
  re'2-0\downbow re'8[\downbow \tuplet 3/2 { mi'16-1( fas'16-2 mi'16-1] } re'8-0[ la'8-\tweak color #blue -0)] | % 22
  sol'2-\tweak color #blue -3 re'2-0 | % 23
  re'1-0 | % 24
  sol'2-3 re'2-0 | % 25

  \barNumberCheck #26
  re'1-0 | % 26
  r4 mi''8-\tweak color #blue -0[\mf\downbow mi''8] mi''8 re''4-\tweak color #blue -3 si'8-1~ | % 27
  si'2 \breathe r2 | % 28
  r4 do''8-2[\downbow do''8] do''4 do''8[ do''8] | % 29
  do''8-2 si'4-1 la'8-0~ la'4 \breathe r4 | % 30

  \barNumberCheck #31
  r4 sol'8-\tweak color #blue -3[ mi''8-\tweak color #blue -0] mi''8 re''4-\tweak color #blue -3 si'16-1([\downbow la'16-0] | % 31
  sol'2-\tweak color #blue -3) \breathe r2 | % 32
  r4 sol'8-3[\downbow do''8-\tweak color #blue -2] do''8[ do''8 do''8 do''8] | % 33
  do''8-2\upbow si'4-1 la'8-0~ la'4 \breathe r4 | % 34
  sol'2-\tweak color #blue -3\downbow la'4.-\tweak color #blue -0 si'8-1~ | % 35
  si'2 r2 | % 36

  \barNumberCheck #37
  r8 re''8-3[\upbow re''8 re''8] re''8 do''4-2( si'8-1) | % 37
  la'4-0\downbow si'8-1[ la'8-0~] la'4 la'8[ sol'8-\tweak color #blue -3~] | % 38
  sol'4 r4 re''4.-\tweak color #blue -3\upbow si'16-1([\downbow la'16-0] | % 39
  sol'2-\tweak color #blue -3) r2 | % 40
  r8 re''8-\tweak color #blue -3[\upbow re''8 re''8] re''8 do''4-2 si'8-1 | % 41
  la'4-0 si'8-1[ la'8-0~] la'4 r4 | % 42

  \barNumberCheck #43
  mi''1-2\tercera\mf\upbow | % 43
  do''1-\tweak color #blue -4 | % 44
  re''2-\tweak color #blue -1 fas''2-3 | % 45
  mi''2-2 si'4-\tweak color #blue -3 sol'4-1 | % 46
  la'2-2 mi''2-\tweak color #blue -2 | % 47

  \barNumberCheck #48
  do''1-\tweak color #blue -4 | % 48
  re''2-\tweak color #blue -1 fas''2-3 | % 49
  mi''8-2\upbow mi''4 re''8-1 re''4 sol''4-4 | % 50
  r4 do''8-2\primeraEstudio[\downbow do''8] do''8 do''4. | % 51
  la'8-0[ la'8( si'8-1) la'8-0~] la'2 | % 52

  \barNumberCheck #53
  \breathe r4 si'8-1[\downbow si'8] si'4 la'8-0[ la'8] | % 53
  la'8-0 sol'4-\tweak color #blue -3 sol'8~ sol'2 | % 54
  r4 do''8-\tweak color #blue -2[\downbow do''8] do''8 do''4. | % 55
  la'8-0[ la'8( si'8-1) la'8-0~] la'4. sol'8-\tweak color #blue -3 | % 56
  si'8-\tweak color #blue -1[ si'8 si'8 si'8~] si'8 la'4-0 sol'8-\tweak color #blue -3\upbow~ | % 57
  sol'2 mi'2-1 | % 58

  \barNumberCheck #59
  sol'4.-3\upbow si8-\tweak color #blue -2~ si8 sol'4-\tweak color #blue -3(\upbow mi'8-1) | % 59
  fas'8-2[-.\downbow fas'8-. fas'8-. fas'8-.] fas'8[-. fas'8-. fas'8-. fas'8-.] | % 60
  re'8-0[ re'8 re'8 re'8] re'8[ re'8 re'8 re'8] | % 61
  fas'8-2[ fas'8 fas'8 fas'8] fas'8[ fas'8 fas'8 fas'8] | % 62
  sol'8-3[ sol'8 sol'8 sol'8] sol'8[ sol'8 sol'8 sol'8] | % 63

  \barNumberCheck #64
  fas'8-2[ fas'8 fas'8 fas'8] fas'8[ fas'8 fas'8 fas'8] | % 64
  re'8-0[ re'8 re'8 re'8] re'8[ re'8 re'8 re'8] | % 65
  dos'8-\tweak color #blue -3\subirEstudio[ dos'8 dos'8 dos'8] dos'8[ dos'8 dos'8 dos'8] | % 66
  <do'-3 la'-\tweak color #blue -4>4.\f\downbow <do' la'>8~ <do' la'>2 | % 67

  \barNumberCheck #68
  <re'-\tweak color #blue -0 la'-\tweak color #blue -0>1 | % 68
  <re'-0 si'-1>2 <re'-0 la'-0>2 | % 69
  sol'1-3 | % 70
  <do'-\tweak color #blue -3 la'-4>4.\downbow <do' la'>8~ <do' la'>2 | % 71

  \barNumberCheck #72
  <re'-\tweak color #blue -0 la'-\tweak color #blue -0>1 | % 72
  <re'-0 si'-1>2 <re'-0 la'-0>2 | % 73
  <si-\tweak color #blue -2 sol'-\tweak color #blue -3>4.\upbow <si sol'>8~ <si sol'>8[ mi'8-1\upbow sol'8-3 si'8-\tweak color #blue -1] | % 74
  r4 do''8-2[\downbow do''8] do''8 do''4. | % 75
  la'8-0[ la'8( si'8-1) la'8-0~] la'2 | % 76

  \barNumberCheck #77
  \breathe r4 si'8-1[\downbow si'8] si'4 la'8-0[ la'8] | % 77
  la'8-0 sol'4-\tweak color #blue -3 sol'8~ sol'2 | % 78
  r4 do''8-\tweak color #blue -2[\downbow do''8] do''8 do''4. | % 79
  la'4-0 si'8-1[ la'8-0~] la'4 r8 sol'8-\tweak color #blue -3\upbow | % 80
  si'8-\tweak color #blue -1[ si'8 si'8 si'8~] si'8 la'4-0 sol'8-\tweak color #blue -3\upbow~ | % 81

  \barNumberCheck #82
  sol'1 | % 82
  si1-\tweak color #blue -2\downbow\fermata | % 83
  \barNumberCheck #84
}
