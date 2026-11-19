\version "2.24.4"
\language "espanol"

% Transcripción del arreglo para cuatro pentagramas del PDF facilitado.
% Anotaciones del violín I cotejadas con el original y el usuario, cc. 43, 48 y 66.
% El croquis al pie de la pág. 6 coincide con el cierre impreso (cc. 82–83).

metroShallow = {
  \key sol \major
  \numericTimeSignature
  \time 4/4
}

global = {
  \tag #'inicio {
    \metroShallow
    \tempo 4 = 96
  }
}

tercera = _\markup { \bold "III" }

violinUno = \absolute {
  \global
  \clef treble
  si'2\pp la'4 si'4~ | % 1
  si'2 si2 | % 2
  sol'1 | % 3
  si'2( la'2) | % 4
  si'2 la'4 si'4~ | % 5

  \barNumberCheck #6
  si'1 | % 6
  si'2 la'4 si'4~ | % 7
  si'2 si2 | % 8
  sol'1 | % 9
  si'2 la'2 | % 10

  \barNumberCheck #11
  si'2\downbow la'4 si'4~ | % 11
  si'2 si2 | % 12
  sol'1 | % 13
  si'2( la'2) | % 14
  si'2 la'4 si'4~ | % 15

  \barNumberCheck #16
  si'2 si2 | % 16
  sol'1 | % 17
  si'2( la'2) | % 18
  si'2 la'4 si'4~ | % 19
  si'2 si2 | % 20

  \barNumberCheck #21
  sol'1 | % 21
  si'2( la'2) | % 22
  si'2 la'4 si'4~ | % 23
  si'2 si2 | % 24
  si'2 la'4 si'4~ | % 25

  \barNumberCheck #26
  si'1 | % 26
  si'2\upbow la'4 si'4~( | % 27
  si'2~ si'8 sol''4)\downbow re''8\upbow | % 28
  mi''1 | % 29
  si'2( la'2) | % 30

  \barNumberCheck #31
  si'2 la'4 si'4~ | % 31
  si'2 si2 | % 32
  sol'1 | % 33
  si'2 la'2 | % 34
  si'2 re'4. sol'8~ | % 35
  sol'2 sol'2 | % 36

  \barNumberCheck #37
  sol'1 | % 37
  sol'1 | % 38
  si'2 re'4. sol'8~ | % 39
  sol'1 | % 40
  sol'1( | % 41
  sol'2) \breathe r2 | % 42

  \barNumberCheck #43
  do'''8[\f\downbow do'''8 do'''8 do'''8~] do'''8 si''4.^\markup { \small "½ tono" } | % 43
  la''8[ la''8 si''8 la''8~] la''8 sol''4. | % 44
  si''8[ si''8 si''8 re'''8~] re'''8 sol''4 sol''8\upbow~( | % 45
  sol''8[ la''8)] si''2\downbow \breathe r4 | % 46
  do'''8[\downbow do'''8 do'''8 do'''8~] do'''8 si''4. | % 47

  \barNumberCheck #48
  la''8[\downbow la''8 si''8 la''8~] la''8 sol''4( re''8) | % 48
  % El signo de arco sobre el primer si está tachado en el original anotado.
  si''8[ si''8 si''8 re'''8~] re'''8 sol''4 sol''8\upbow~( | % 49
  sol''8[ la''8)] si''2\downbow \breathe r4 | % 50
  r4 sol''8[\downbow sol''8] sol''8 sol''4. | % 51
  fas''8[ fas''8( sol''8) fas''8~] fas''2 | % 52

  \barNumberCheck #53
  \breathe r4 sol''8[\downbow sol''8] sol''4 fas''8[ fas''8] | % 53
  fas''8 mi''4 mi''8~ mi''2 | % 54
  r4 sol''8[\downbow sol''8] sol''8 sol''4. | % 55
  fas''8[ fas''8( sol''8) fas''8~] fas''4. re''8\upbow | % 56
  sol''8[\downbow sol''8 sol''8 sol''8~] sol''8 re''4 si'8~ | % 57
  si'1 | % 58

  \barNumberCheck #59
  R1 | % 59
  fas''2 fas''8[( sol''8)] fas''4 | % 60
  mi''2 r4 r8 fas''8\downbow~ | % 61
  fas''4 r8 sol''8\upbow~( sol''8[ si''8) sol''8\downbow fas''8\upbow] | % 62
  mi''2 si''4 sol''8[\downbow fas''8\upbow~] | % 63

  \barNumberCheck #64
  fas''4 r8 fas''8\downbow~( fas''8[ sol''8) fas''8\upbow sol''8\downbow] | % 64
  si''1\upbow | % 65
  si''2 si'16-1[\upbow( dos''16 re''16 mi''16] fas''16[ sol''16 la''16\tercera si''16)] | % 66
  do'''8[\ff\downbow do'''8 do'''8 do'''8~] do'''8 si''4 do'''16[\upbow( si''16)] | % 67

  \barNumberCheck #68
  la''8[\downbow la''8 si''8 la''8~] la''8 sol''4 re''8 | % 68
  si''8[ si''8 si''8 re'''8~] re'''8 sol''4 sol''8\upbow~( | % 69
  sol''16[ la''16)] si''4.\downbow \breathe r2 | % 70
  do'''8[\downbow do'''8 do'''8 do'''8~] do'''8 si''4. | % 71

  \barNumberCheck #72
  la''8[ la''8 si''8 la''8~] la''8 sol''4(\upbow re''8) | % 72
  sol''8[ sol''8 sol''8 sol''8~] sol''8 re''4 si'8~ | % 73
  si'2 r2 | % 74
  r4 sol''8[\downbow sol''8] sol''8 sol''4. | % 75
  fas''8[ fas''8( sol''8) fas''8~] fas''2 | % 76

  \barNumberCheck #77
  \breathe r4 sol''8[\downbow sol''8] sol''4 fas''8[ fas''8] | % 77
  fas''8 mi''4 mi''8~ mi''2 | % 78
  r4 mi''8[\downbow mi''8] mi''8 mi''4. | % 79
  re''4 mi''8[ fas''8~] fas''4 r8 re''8\upbow | % 80
  sol''8[\downbow sol''8 sol''8 sol''8~] sol''8 re''4 si'8\upbow~ | % 81

  \barNumberCheck #82
  si'1 | % 82
  mi'1\downbow\fermata | % 83
  \barNumberCheck #84
}

violinDos = \absolute {
  \global
  \clef treble
  sol'2\pp re'2 | % 1
  re'1 | % 2
  mi'1 | % 3
  re'2( fas'2) | % 4
  sol'2 re'2 | % 5

  \barNumberCheck #6
  re'1 | % 6
  sol'2 re'2 | % 7
  re'1 | % 8
  mi'1 | % 9
  re'2\downbow re'8[\downbow \tuplet 3/2 { mi'16( fas'16 mi'16] } re'8[ la'8)] | % 10

  \barNumberCheck #11
  sol'2 re'2 | % 11
  re'1 | % 12
  mi'1 | % 13
  re'2\downbow re'8[\downbow \tuplet 3/2 { mi'16( fas'16 mi'16] } re'8[ la'8)] | % 14
  sol'2 re'2 | % 15

  \barNumberCheck #16
  re'1 | % 16
  mi'1 | % 17
  re'2\downbow re'8[\downbow \tuplet 3/2 { mi'16( fas'16 mi'16] } re'8[ la'8)] | % 18
  sol'2 re'2 | % 19
  re'1 | % 20

  \barNumberCheck #21
  mi'1 | % 21
  re'2\downbow re'8[\downbow \tuplet 3/2 { mi'16( fas'16 mi'16] } re'8[ la'8)] | % 22
  sol'2 re'2 | % 23
  re'1 | % 24
  sol'2 re'2 | % 25

  \barNumberCheck #26
  re'1 | % 26
  r4 mi''8[\mf\downbow mi''8] mi''8 re''4 si'8~ | % 27
  si'2 \breathe r2 | % 28
  r4 do''8[\downbow do''8] do''4 do''8[ do''8] | % 29
  do''8 si'4 la'8~ la'4 \breathe r4 | % 30

  \barNumberCheck #31
  r4 sol'8[ mi''8] mi''8 re''4 si'16([\downbow la'16] | % 31
  sol'2) \breathe r2 | % 32
  r4 sol'8[\downbow do''8] do''8[ do''8 do''8 do''8] | % 33
  do''8\upbow si'4 la'8~ la'4 \breathe r4 | % 34
  sol'2\downbow la'4. si'8~ | % 35
  si'2 r2 | % 36

  \barNumberCheck #37
  r8 re''8[\upbow re''8 re''8] re''8 do''4( si'8) | % 37
  la'4\downbow si'8[ la'8~] la'4 la'8[ sol'8~] | % 38
  sol'4 r4 re''4.\upbow si'16([\downbow la'16] | % 39
  sol'2) r2 | % 40
  r8 re''8[\upbow re''8 re''8] re''8 do''4 si'8 | % 41
  la'4 si'8[ la'8~] la'4 r4 | % 42

  \barNumberCheck #43
  mi''1\mf\upbow | % 43
  do''1 | % 44
  re''2 fas''2 | % 45
  mi''2 si'4 sol'4 | % 46
  la'2 mi''2 | % 47

  \barNumberCheck #48
  do''1 | % 48
  re''2 fas''2 | % 49
  mi''8\upbow mi''4 re''8 re''4 sol''4 | % 50
  r4 do''8[\downbow do''8] do''8 do''4. | % 51
  la'8[ la'8( si'8) la'8~] la'2 | % 52

  \barNumberCheck #53
  \breathe r4 si'8[\downbow si'8] si'4 la'8[ la'8] | % 53
  la'8 sol'4 sol'8~ sol'2 | % 54
  r4 do''8[\downbow do''8] do''8 do''4. | % 55
  la'8[ la'8( si'8) la'8~] la'4. sol'8 | % 56
  si'8[ si'8 si'8 si'8~] si'8 la'4 sol'8\upbow~ | % 57
  sol'2 mi'2 | % 58

  \barNumberCheck #59
  sol'4.\upbow si8~ si8 sol'4(\upbow mi'8) | % 59
  fas'8[-.\downbow fas'8-. fas'8-. fas'8-.] fas'8[-. fas'8-. fas'8-. fas'8-.] | % 60
  re'8[ re'8 re'8 re'8] re'8[ re'8 re'8 re'8] | % 61
  fas'8[ fas'8 fas'8 fas'8] fas'8[ fas'8 fas'8 fas'8] | % 62
  sol'8[ sol'8 sol'8 sol'8] sol'8[ sol'8 sol'8 sol'8] | % 63

  \barNumberCheck #64
  fas'8[ fas'8 fas'8 fas'8] fas'8[ fas'8 fas'8 fas'8] | % 64
  re'8[ re'8 re'8 re'8] re'8[ re'8 re'8 re'8] | % 65
  dos'8[ dos'8 dos'8 dos'8] dos'8[ dos'8 dos'8 dos'8] | % 66
  <do' la'>4.\f\downbow <do' la'>8~ <do' la'>2 | % 67

  \barNumberCheck #68
  <re' la'>1 | % 68
  <re' si'>2 <re' la'>2 | % 69
  sol'1 | % 70
  <do' la'>4.\downbow <do' la'>8~ <do' la'>2 | % 71

  \barNumberCheck #72
  <re' la'>1 | % 72
  <re' si'>2 <re' la'>2 | % 73
  <si sol'>4.\upbow <si sol'>8~ <si sol'>8[ mi'8\upbow sol'8 si'8] | % 74
  r4 do''8[\downbow do''8] do''8 do''4. | % 75
  la'8[ la'8( si'8) la'8~] la'2 | % 76

  \barNumberCheck #77
  \breathe r4 si'8[\downbow si'8] si'4 la'8[ la'8] | % 77
  la'8 sol'4 sol'8~ sol'2 | % 78
  r4 do''8[\downbow do''8] do''8 do''4. | % 79
  la'4 si'8[ la'8~] la'4 r8 sol'8\upbow | % 80
  si'8[ si'8 si'8 si'8~] si'8 la'4 sol'8\upbow~ | % 81

  \barNumberCheck #82
  sol'1 | % 82
  si1\downbow\fermata | % 83
  \barNumberCheck #84
}

viola = \absolute {
  \global
  \clef alto
  mi'2\pp fas'4 sol'4~ | % 1
  sol'1 | % 2
  do'1 | % 3
  sol2\downbow re'8[\downbow \tuplet 3/2 { mi'16( fas'16 mi'16] } re'8[ la'8)] | % 4
  mi'2 fas'4 sol'4~ | % 5

  \barNumberCheck #6
  sol'1 | % 6
  \breathe r4 sol8[\mf\downbow mi'8] mi'8 re'4 si8~ | % 7
  si2. \breathe r4 | % 8
  r4 sol8[\downbow do'8] do'8[ do'8 do'8 do'8] | % 9
  do'8 si4 la8~ la2 | % 10

  \barNumberCheck #11
  \breathe r4 sol8[\downbow mi'8] mi'8 re'4 si8~ | % 11
  si2 \breathe r2 | % 12
  r4 do'8[\downbow do'8] do'8[ do'8 do'8 do'8] | % 13
  do'8 si4 la8~ la4 \breathe r4 | % 14
  sol2\downbow la4. si8~ | % 15

  \barNumberCheck #16
  si2 r2 | % 16
  r8 re'8[\upbow re'8 re'8] re'8 do'4( si8) | % 17
  la4\downbow si8[ la8~] la4 sol8[ sol8~] | % 18
  sol4 r4 la4.\upbow si8~ | % 19
  si2 r2 | % 20

  \barNumberCheck #21
  r8 re'8[\upbow re'8 re'8] re'8 do'4( si8) | % 21
  la4 si8 la4~ la8 \breathe r4 | % 22
  mi'2\downbow fas'4 sol'4~ | % 23
  sol'1 | % 24
  mi'2 fas'4 sol'4~ | % 25

  \barNumberCheck #26
  sol'1 | % 26
  sol2 re2 | % 27
  re2~ re8 si4(\upbow sol8) | % 28
  sol1 | % 29
  sol2 fas2 | % 30

  \barNumberCheck #31
  sol1 | % 31
  sol2.\downbow fas4 | % 32
  sol1 | % 33
  sol2 re'2 | % 34
  sol2 la2 | % 35
  sol2\downbow r8 sol8[\upbow si8 la8] | % 36

  \barNumberCheck #37
  sol2\downbow do'2 | % 37
  sol2 fas2 | % 38
  sol2 la2 | % 39
  sol2 r8 sol8[\upbow si8 la8] | % 40
  sol1\downbow | % 41
  sol2\< fas2 | % 42

  \barNumberCheck #43
  la2\mf mi'2 | % 43
  la2 fas'4 re'4 | % 44
  si2 fas'4 re'4 | % 45
  sol2\upbow si8[ sol8] si4 | % 46
  la2\upbow mi'2 | % 47

  \barNumberCheck #48
  la2 fas'4 re'4 | % 48
  si8[\downbow sol8 re'8 sol8] la4 re'4 | % 49
  sol'8 mi'4 si8 si4(\upbow re'4) | % 50
  mi'4.\downbow mi'8~ mi'2 | % 51
  re'4. re'8~ re'2 | % 52

  \barNumberCheck #53
  re'2 re'2 | % 53
  sol'4.\downbow sol'8\upbow~ sol'8[ mi'8\upbow re'8 sol8] | % 54
  mi'4.\downbow mi'8~ mi'2 | % 55
  re'4. re'8~ re'2 | % 56
  re'2 re'2 | % 57
  mi'4. sol8~ sol8 mi'4 re'8 | % 58

  \barNumberCheck #59
  mi'4. sol8~ sol8 mi'4 re'8 | % 59
  <si re'>8[-.\downbow <si re'>8-. <si re'>8-. <si re'>8-.] <si re'>8[-. <si re'>8-. <si re'>8-. <si re'>8-.] | % 60
  <la fas'>8[ <la fas'>8 <la fas'>8 <la fas'>8] <la fas'>8[ <la fas'>8 <la fas'>8 <la fas'>8] | % 61
  <la mi'>8[ <la mi'>8 <la mi'>8 <la mi'>8] <la mi'>8[ <la mi'>8 <la mi'>8 <la mi'>8] | % 62
  <sol mi'>8[ <sol mi'>8 <sol mi'>8 <sol mi'>8] <sol mi'>8[ <sol mi'>8 <sol mi'>8 <sol mi'>8] | % 63

  \barNumberCheck #64
  <si re'>8[ <si re'>8 <si re'>8 <si re'>8] <si re'>8[ <si re'>8 <si re'>8 <si re'>8] | % 64
  <la fas'>8[ <la fas'>8 <la fas'>8 <la fas'>8] <la fas'>8[ <la fas'>8 <la fas'>8 <la fas'>8] | % 65
  <la mi'>8[ <la mi'>8 <la mi'>8 <la mi'>8] <la mi'>8[ <la mi'>8 <la mi'>8 <la mi'>8] | % 66
  mi'4.\f\downbow mi'8~ mi'2 | % 67

  \barNumberCheck #68
  <la re'>1 | % 68
  <si sol'>2 <la fas'>2 | % 69
  <sol mi'>1 | % 70
  mi'4.\downbow mi'8~ mi'2 | % 71

  \barNumberCheck #72
  <la re'>1 | % 72
  <si sol'>2 <la fas'>2 | % 73
  sol4.\upbow sol8~ sol8[ mi'8\upbow re'8 sol8] | % 74
  mi'4.\downbow mi'8~ mi'2 | % 75
  re'4. re'8~ re'2 | % 76

  \barNumberCheck #77
  re'2 re'2 | % 77
  sol'4.\downbow sol'8\upbow~ sol'8[ mi'8\upbow re'8 sol8] | % 78
  mi'4.\downbow mi'8~ mi'2 | % 79
  re'4. re'8~ re'2 | % 80
  re'2 re'2 | % 81

  \barNumberCheck #82
  mi'2\downbow mi'8[\upbow( re'8) si8\downbow sol8\upbow] | % 82
  si1\fermata | % 83
  \barNumberCheck #84
}

chelo = \absolute {
  \global
  \clef bass
  mi,8[\mf sol,8 mi8 sol,8] <fas, fas>8 re4 sol,8~ | % 1
  sol,8[ re8] sol4 r2 | % 2
  do8[ sol8 do'8 re'8] sol8[ do8 mi8 re8] | % 3
  sol,8 re4 re8~ re8[ mi8 re8 la,8] | % 4
  mi,8[ sol,8 mi8 sol,8] <fas, fas>8 re4 sol,8~ | % 5

  \barNumberCheck #6
  sol,8[ re8] sol4 r2 | % 6
  mi,8[\mp sol,8 mi8 sol,8] <fas, fas>8 re4 sol,8~ | % 7
  sol,8[ re8] sol4~ sol8[ sol8 re8 si,8] | % 8
  do8[ sol8 do'8 re'8] sol8[ do8 mi8 re8] | % 9
  sol,8 re4 re8~ re8[ mi8 re8 la,8] | % 10

  \barNumberCheck #11
  mi,8[ sol,8 mi8 sol,8] <fas, fas>8 re4 sol,8~ | % 11
  sol,8[ re8] sol4~ sol8[ sol8 re8 si,8] | % 12
  do8[ sol8 do'8 re'8] sol8[ do8 mi8 re8] | % 13
  sol,8 re4 re8~ re8[ mi8 re8 la,8] | % 14
  mi,8[ sol,8 mi8 sol,8] <fas, fas>8 re4 sol,8~ | % 15

  \barNumberCheck #16
  sol,8[ re8] sol4~ sol8[ sol8 re8 si,8] | % 16
  do8[ sol8 do'8 re'8] sol8[ do8 mi8 re8] | % 17
  sol,8 re4 re8~ re8[ mi8 re8 la,8] | % 18
  mi,8[ sol,8 mi8 sol,8] <fas, fas>8 re4 sol,8~ | % 19
  sol,8[ re8] sol4~ sol8[ sol8 re8 si,8] | % 20

  \barNumberCheck #21
  do8[ sol8 do'8 re'8] sol8[ do8 mi8 re8] | % 21
  sol,8 re4 re8~ re8[ mi8 re8 la,8] | % 22
  mi,8[\p sol,8 mi8 sol,8] <fas, fas>8 re4 sol,8~ | % 23
  sol,8[ re8] sol4 r2 | % 24
  mi,8[ sol,8 mi8 sol,8] <fas, fas>8 re4 sol,8~ | % 25

  \barNumberCheck #26
  sol,8[ re8] sol4 r2 | % 26
  mi,8[ sol,8 mi8 sol,8] <fas, fas>8 re4 sol,8~ | % 27
  sol,8[ re8] sol4~ sol8[ sol8 re8 si,8] | % 28
  do8[ sol8 do'8 re'8] sol8[ do8 mi8 re8] | % 29
  sol,8 re4 re8~ re8[ mi8 re8 la,8] | % 30

  \barNumberCheck #31
  mi,8[ sol,8 mi8 sol,8] <fas, fas>8 re4 sol,8~ | % 31
  sol,8[ re8] sol4~ sol8[ sol8 re8 si,8] | % 32
  do8[ sol8 do'8 re'8] sol8[ do8 mi8 re8] | % 33
  sol,8 re4 re8~ re8 r8 r4 | % 34
  mi,2^\markup "Arco" fas,4. sol,8~ | % 35
  sol,2 r8 si,8[\upbow sol8 fas8] | % 36

  \barNumberCheck #37
  do1\downbow | % 37
  sol,2 re2 | % 38
  mi,2 fas,4. sol,8\upbow~ | % 39
  sol,2 r8 si,8[\upbow sol8 fas8] | % 40
  do1\downbow | % 41
  sol,2\< re4 <re, re>4 | % 42

  \barNumberCheck #43
  la,2.\mf( sol,4) | % 43
  fas,1\upbow | % 44
  sol,2 si,2 | % 45
  mi2. sol,4 | % 46
  la,2. sol,4 | % 47

  \barNumberCheck #48
  fas,1 | % 48
  sol,2 re2 | % 49
  <mi, mi>1 | % 50
  la,2 sol,2 | % 51
  fas,1 | % 52

  \barNumberCheck #53
  sol,2 re2 | % 53
  <mi, mi>1 | % 54
  la,2\downbow sol,2 | % 55
  fas,2 re2 | % 56
  sol,2 re2 | % 57
  mi,1 | % 58

  \barNumberCheck #59
  mi,1 | % 59
  si,2.\downbow si,4\upbow | % 60
  re2. re4 | % 61
  la,2. sol,4 | % 62
  mi,8[-.\downbow mi,8-. mi,8-. mi,8-.] mi,8[-. mi,8-. mi,8-. mi,8-.] | % 63

  \barNumberCheck #64
  si,8[_\markup "Simile" si,8 si,8 si,8] si,8[ si,8 si,8 si,8] | % 64
  re8[ re8 re8 re8] re8[ re8 re8 re8] | % 65
  la,8[ la,8 la,8 la,8] la,8[ la,8 mi,8 mi,8] | % 66
  la,1\f\downbow | % 67

  \barNumberCheck #68
  fas,1 | % 68
  sol,2 re2 | % 69
  <mi, si,>8[ <mi, si,>8 <mi, si,>8 <mi, si,>8] <mi, si,>8[ <mi, si,>8 <mi, si,>8 <mi, si,>8] | % 70
  la,4 la,4 la,8\downbow la,4\upbow la,8\upbow | % 71

  \barNumberCheck #72
  fas,4 fas,4 fas,8\downbow fas,4\upbow fas,8\upbow | % 72
  sol,4 sol,4 re8\downbow re4\upbow re8\upbow | % 73
  mi4 mi,4 mi,8[ mi,8 sol,8 mi,8] | % 74
  la,4 la,4 sol8\downbow sol4\upbow sol8\upbow | % 75
  fas4 fas4 re8\downbow re4\upbow re8\upbow | % 76

  \barNumberCheck #77
  sol,4 sol,4 fas8\downbow fas4\upbow fas8\upbow | % 77
  mi4 mi4 mi,8\downbow mi,4\upbow mi,8\upbow | % 78
  la,4 la,4 sol8\downbow sol4\upbow sol8\upbow | % 79
  fas4 fas4 re8\downbow re4\upbow re8\upbow | % 80
  sol,4 sol,4 fas8\downbow fas4\upbow fas8\upbow | % 81

  \barNumberCheck #82
  <mi, si,>8[ <mi, si,>8 <mi, si,>8 <mi, si,>8] <mi, si,>8[ <mi, si,>8 <mi, si,>8 <mi, si,>8] | % 82
  sol,1\fermata | % 83
  \barNumberCheck #84
}
