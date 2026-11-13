\version "2.24.0"
\language "espanol"

\header {
  title = "Celtic Carol"
  subtitle = "Violín 1 — compases 1–112"
  composer = "Lindsey Stirling"
  arranger = "Adaptación: Sean O'Loughlin"
}

% Contraste dinámico para MIDI, sin alterar las indicaciones impresas.
#(define (celtic-dynamic-volume name)
  (or (assoc-ref '(("ppp" . 0.20) ("pp" . 0.30) ("p" . 0.42)
                   ("mp" . 0.54) ("mf" . 0.68) ("f" . 0.92)
                   ("ff" . 0.96)) name)
      (default-dynamic-absolute-volume name)))

violin = \absolute {
  \clef treble
  % Sin alteraciones en la armadura; no se presupone una tonalidad.
  \time 12/8
  \tempo "Misterioso" 4. = 120
  \autoLineBreaksOff

  la''1.\p\upbow(\< ~ |                         % 1
  la''2.\mf\downbow\> ~ la''4. ~ la''8 si'' do''')\! | % 2
  la''1.\p\< |                              % 3
  do'''4.\mf( re'''4.) si''4.( do'''4.) |  % 4
  la''2.( ~ la''4. ~ la''8 si'' do''') |   % 5
  la''1. |                                  % 6
  la''2.\downbow mi'''2. | \break                   % 7
  re'''4.( do'''4.) si''4.( do'''4.) |     % 8
  la''2.( ~ la''4. ~ la''8 si'' do''') |   % 9
  la''2.( ~ la''4. ~ la''8 si'' do''') |   % 10
  la''2.( ~ la''4. ~ la''8 si'' do''') |   % 11
  la''1. |                                  % 12
  \mark \markup { \box "13" }
  do'''4.\downbow( si''8 do''' la'') do'''4.( si''8 do''' la'') | \break % 13
  do'''4.-3( si''8-2 do'''-3 la''-1) do'''4.-3( si''8-2 do'''-3 la''-1) | % 14
  do'''4.( si''8 do''' la'') do'''4.( la''4.) | % 15
  % Ligaduras a lápiz: dos grupos de tres corcheas.
  do'''8\downbow\<( si'' la'') sol''\upbow( fa'' mi'') re''\downbow( do'' si') la'4.\upbow\f | % 16
  do''4.\downbow\mf si'8\upbow-1( do''-2 la'-0) mi'4\downbow la'8\upbow( ~ la') mi'\upbow( la') | \break % 17
  do''8\downbow-2( si'-1 do''-2) re''\upbow-3( do''-2 si'-1) la'4 mi'8 la'4 si'8 | % 18
  do''4.\downbow si'8\upbow( do'' la') mi'4\downbow la'8\upbow( ~ la') la'\upbow( si') | % 19
  do''8\downbow( si' do'') re''\upbow( \grace { mi''16 re'' } do''8 si') la'4.\downbow\tenuto la'4.\upbow\tenuto | % 20
  do''4.\downbow si'8\upbow( do'' la') mi'4\downbow la'8\upbow( ~ la' mi'4\upbow) | \break % 21
  do''8\downbow( si' do'') re''\upbow( do'' si') la'4.\downbow la'8\upbow( do'' mi'') | % 22
  % Dos ligaduras de arco y dos indicaciones de arco arriba, según la interpretación indicada.
  do'''4.\downbow si''8\upbow( do''' la'') mi''4\downbow la''8\upbow( ~ la'') la''\upbow( si'') | % 23
  do'''8\downbow\<( si'' do''') re'''\upbow( do''' si'') la''4.\downbow\f-> la''4.\upbow-> | % 24
  \mark \markup { \box "25" }
  % Regulador oculto: realiza el crescendo indicado por el texto en el MIDI.
  \once \omit Hairpin
  do'''8\downbow\mf\<->( si'' do''') la''4._\markup { \italic "cresc. poco a poco" } do'''8->( si'' do''') la''4. | \break % 25
  do'''8->( si'' do''') la''4. do'''8->( si'' do''') la''4. | % 26
  mi'''8->( re''' mi''') do'''4. mi'''8->( re''' mi''') do'''4. | % 27
  % Nivel intermedio para continuar hasta el ff del compás 29.
  \once \omit DynamicText
  mi'''8\f\<->( re''' mi''') do'''4. mi'''8->( re''' mi''') do'''4. | % 28
  \mark \markup { \box "29" }
  la''8\ff-^ la''-^ la''-^ la''16\upbow\f->( sol'' fa'' mi'' re''8-.) mi''4-> re''8\upbow-> ~ re'' do''4\upbow-> | \break % 29
  do''8\downbow-. la'-. re''-. la'-. mi''-. la'-. do''16( si' la' sol' mi'8-.) do'8\upbow( si la) | % 30
  la''8\ff-^ la''-^ la''-^ la''16\upbow\f->( sol'' fa'' mi'' re''8-.) mi''4-> re''8\upbow-> ~ re'' do''4\upbow-> | % 31
  do''8\downbow-. la'-. re''-. la'-. mi''-. la''-. sols''( mi'' si'') la''4-> r8 | % 32
  \mark \markup { \box "33" }
  \compressEmptyMeasures
  R1.*4 | \pageBreak % 33–36: silencio de cuatro compases

  % Página 2.
  \set Staff.midiInstrument = "pizzicato strings"
  fa''4.\mp^\markup { \italic "pizz." } fa''4. mi''4. mi''4. | % 37
  re''4. re''4. re''4. re''4. | % 38
  mi''4. r4. r2. | % 39
  r2. la'4.-> la'4.-> | % 40
  si'4.-> r4. r4. \set Staff.midiInstrument = "violin" do''4\mf\upbow^\markup { \italic "arco" }( re''8) | \break % 41
  mi''4( fa''8) sol''4( la''8) mi''8( re'' do'') si'( la' sol') | % 42
  la'4.( si'8 la' sol') la'8\>( si' do'' re'' do'' re'')\! | % 43
  \mark \markup { \box "44" }
  mi''4.\p\downbow( ~ mi''4 re''8) do''4.( ~ do''4 la'8) | % 44
  si'4\< do''8 ~ do'' si'4 la'2.\mf | \break % 45
  mi''4.\p( ~ mi''4 re''8) do''4.( ~ do''4 la'8) | % 46
  si'4\< do''8 ~ do'' si'4 la'2.\mf | % 47
  do''2.\p re''2. | % 48
  mi''2.\< sol''4\mf fa''8 ~ fa'' mi''4 | % 49
  re''2. do''4.( si'4.) | \break % 50
  la'8\>( do'' mi'') la''( mi'' do'') la'4. ~ la'8 mi''\upbow( fa'')\! | % 51
  \bar "||"
  \time 6/8
  \mark \markup { \box "52" }
  \tempo "Half time" 4. = 60
  sol''4.\p\downbow sol''8.( fa''32 sol'' fa''16 mi'') | % 52
  re''4( si'8) sol'8( la' si') | % 53
  do''4( la'8) la'8( sols' la') | % 54
  si'4\glissando( sols'8) mi'4.\< | % 55
  sol''!4.\mp\downbow sol''4( fa''16 mi'') | \break % 56
  re''4( si'8) sol'8( la' si') | % 57
  do''8( si' la') sols'( fas' sols') | % 58
  la'4.\< la'4. | % 59
  \bar "||"
  \time 12/8
  \mark \markup { \box "60" }
  \tempo "Double time" 4. = 120
  do''8\mf\downbow( si' la' mi' la' si') do''-2->( la') re''-3->( la') mi''-4->( la') | % 60
  si'8-1( sol'-3 re' si-2 re' sol'-3) si'-1( sol'-3 si'-1 re''-3 do''-2 si'-1) | \break % 61
  do''8-2( la') re''-3( la') mi''-4( la') la''( mi'' la'') do'''4. | % 62
  si''8( do''' si'') la''( si'' la'') sols''2.\upbow | % 63
  la'8\downbow-0( mi''-0 la'' si'') do'' mi'' la''->( mi'') si''->( mi'') do'''->( mi'') | \break % 64
  sol'8( re'' sol'' la'') si'-3 re'' sol''->( re'') la''->( re'') si''->( re'''-2) | % 65
  fa'''8( mi''' re''') do'''( si'' la'') sols''( fa''! mi'') re''( do'' si') | % 66
  la'2.\< mi''2. | \break % 67
  \mark \markup { \box "68" }
  la''8\f-^ la'-. la''-^ fa''16\upbow->( sol'' fa'' mi'' re''8-.) mi''4-> re''8-> ~ re'' do''4\upbow-> | % 68
  do''8\downbow-. la'-. re''-. la'-. mi''-. la'-. do''16( re'' do'' la' mi'8-.) do'8( si la) | % 69
  la''8-^ la'-. la''-^ fa''16\upbow->( sol'' fa'' mi'' re''8-.) mi''4-> re''8-> ~ re'' do''4\upbow-> | \break % 70
  do''8\downbow-. la'-. re''-. la'-. mi''-. la'-. sols''( mi'' si'') la''4-> r8 | % 71
  do''4.\mf\downbow si'8( do'' la') mi'4 la'8\upbow ~ la' mi'\upbow-. ( la'\upbow-.) | % 72
  do''8( si' do'') re''( \grace { do''16 re'' } do''8 si') la'4( mi'8) la'4( si'8) | \pageBreak % 73

  % Página 3: compases 74–112.
  do''4.\downbow si'8( do'' la') mi'4 la'8\upbow ~ la' mi'\upbow-.( la'-.) | % 74
  do''8( si' do'') re''( do'' si') la'4( mi'8) la'( si' la') | % 75
  \mark \markup { \box "76" }
  do''4.\downbow si'8( do'' la') mi'4 la'8\upbow ~ la' mi'\upbow( la') | \break % 76
  do''8( si' do'') re''( do'' si') la'4. la'16( si' do'' re'' mi''8) | % 77
  do'''4. si''8( do''' la'') mi''4 la''8\upbow( ~ la'') la''\upbow( si'') | % 78
  do'''8\<( si'' do''') re'''( do''' si'') la''4.\f-> mi''4.-> | % 79
  \once \omit Hairpin
  do'''8\downbow\mf\<->( si'' do''') la''4._\markup { \italic "cresc. poco a poco" } do'''8->( si'' do''') la''4. | \break % 80
  do'''8->( si'' do''') la''4. do'''8->( si'' do''') la''4. | % 81
  mi'''8-3->( re''' mi''') do'''4.-1 mi'''8->( re''' mi''') do'''4. | % 82
  \once \omit DynamicText
  mi'''8\f\<->( re''' mi''') do'''4. mi'''8->( re''' mi''') \once \omit DynamicText do'''4.\ff | % 83
  \mark \markup { \box "84" }
  % El arco abajo en re indica retoma; no es una ligadura mi–re.
  mi''4.-\tweak text \markup { \dynamic "mp" \normal-text \italic \fontsize #-2 " sub." } \mp\downbow-> ~ mi''4 re''8\downbow^\markup { \tiny \italic "retoma" } do''4.\upbow->( ~ do''4 la'8\upbow) | \break % 84
  si'4 do''8 ~ do'' si'4 do''4.\mf\upbow( si'8\upbow do'' la') | % 85
  la'4\mp( mi''8) mi''4( re''8) do''4( \grace { re''16 do'' } si'8) la'4( sol'8) | % 86
  sol'4( la'8) si'4\<\glissando( do''8) re''2.\mf | % 87
  do''4.\mp\downbow ~ do''4 do''8 re''4. sol''4. | \break % 88
  fa''4. mi''4. sol''8\upbow-- r8 fa''8-- r8 mi''8-.\tenuto r8 | % 89
  re''4\downbow( si'8 ~ si' la'4\downbow) sols'4\upbow( fas'8 ~ fas' sols'4)\glissando | % 90
  la'2.\downbow la'2.\upbow-> | % 91
  \once \omit Hairpin
  si'1.\downbow\<_\markup { \italic "cresc. poco a poco" } | % 92
  do''1.\upbow | % 93
  sol''4.\downbow mi''4. sol''4. la''4. | \break % 94
  \mark \markup { \box "95" }
  la''2.\f\downbow-> mi'''2.-> | % 95
  re'''4.->( do'''4.) si''4.->( do'''4.) | % 96
  la''2.( ~ la''4. ~ la''8 si'' do''') | % 97
  la''4.\upbow\< ~ la''8 si''\downbow( do''') mi'''2.\upbow-> | % 98
  la''2.\ff\downbow mi'''2.\upbow | % 99
  mi'''4\downbow-> re'''8\upbow ~ re''' do'''4\downbow re'''4.\upbow-> si''4.\downbow-> | \break % 100
  la''2.\upbow( ~ la''4. ~ la''8 si'' do''') | % 101
  mi'''4.( re'''4.) mi'''4.\upbow( re'''8. do'''8.) | % 102
  \mark \markup { \box "103" }
  \tempo "Misterioso"
  la''1.\downbow\>( ~ | % 103
  la''2.\mf ~ la''4. ~ la''8 si'' do''') | % 104
  la''1.\downbow ~ | % 105
  la''1.\> <>\! | \break % 106
  la''2.\p\upbow( ~ la''4. ~ la''8 si'' do''') | % 107
  la''2.( ~ la''4. ~ la''8 si'' do''') | % 108
  la''1. | % 109
  <mi'' la''>1.\mp^\markup { \italic "Solo" }_\markup { \italic "Section — poco rit." } | % 110
  <<
    { \voiceOne la''2. re'''4.( ~ re'''8 do''' si'') |
      la''1.\downbow\fermata\> <>\! }
    \\
    { \voiceTwo mi''1. ~ | mi''1.\fermata }
  >> \oneVoice \bar "|." % 111–112
}

% Cambios de tempo para realizar el poco rit. sin añadir cifras a la partitura.
tempoFinal = {
  % 51 compases de 12/8, 8 de 6/8 y 50 de 12/8: inicio del 110.
  s4*630
  \set Score.tempoHideNote = ##t
  \tempo 4. = 120 s2.
  \tempo 4. = 113 s2.
  \tempo 4. = 106 s2.
  \tempo 4. = 98 s2.
  \tempo 4. = 91 s2.
  \tempo 4. = 84 s2.
}

\score {
  \new Staff \with { instrumentName = "Violín 1" } <<
    \new Voice { \violin }
    \new NullVoice { \tempoFinal }
  >>
  \layout { }
  \midi {
    \context {
      \Score
      dynamicAbsoluteVolumeFunction = #celtic-dynamic-volume
    }
  }
}
