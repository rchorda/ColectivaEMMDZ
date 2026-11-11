\version "2.24.0"
\language "espanol"

\header {
  title = "Intermezzo"
  subtitle = "Violín I — transcripción provisional"
  piece = "N.º 6"
}

% Escala de interpretación MIDI: amplía el contraste sin cambiar la notación.
#(define (intermezzo-dynamic-volume name)
  (or (assoc-ref '(("ppp" . 0.20) ("pp" . 0.30) ("p" . 0.42)
                   ("mp" . 0.54) ("mf" . 0.68) ("f" . 0.92)) name)
      (default-dynamic-absolute-volume name)))

violin = \absolute {
  \clef treble
  \key fa \major
  \time 3/4
  % Velocidad orientativa: el original no incluye una cifra metronómica.
  \tempo "Andante sostenuto" 4 = 72

  fa''4\pp\upbow-3_\markup { \italic "espress." }( la'' do''') | % 1
  do'''4.\downbow\(( sib''8) la''( sol'')\) | % 2
  re'''8\upbow( fa'') la''2\downbow | % 3
  sol''4\upbow\< la''2\downbow->\> ~ | \break % 4
  la''8\! fa''\(( mi'' re'') re'''8.( si''!16)\) | % 5
  do'''2 sib''!8.\upbow( re''16) | % 6
  la''4\downbow-3( sol''4) \tuplet 5/4 { sib''16\upbow->-2( do''' sib'' re'' fa'') } | % 7
  la''4.\downbow( sol''8) fa''8\upbow re'''8\downbow-4 ~ | \break % 8
  re'''8 do'''8\f\>-- si''!8-- la''8-- sol''8-- fa''8--\! | % 9
  fa''16\pp\>( mi'' sol'' la') mi''4.\upbow( re''8)\! | % 10
  do''2-4 ~ do''8 r8 | % 11
  re''4\upbow-1_\markup { \italic "dolciss." }( mi'' \acciaccatura { sol''8 } fa''4->) | % 12
  % Segunda voz dictada por el usuario: el si sigue la armadura.
  \mark \markup { \box "49" }
  <<
    { \voiceOne do'''4( r8 sib''8 la'' mi'') }
    \\
    { \voiceTwo mi''2.-4 }
  >> \oneVoice | \break % 13
  re''4\upbow( mi'' \acciaccatura { sol''8 } fa''4->) | % 14
  <<
    { \voiceOne do'''4( r8 sib''8 la'' mi'') }
    \\
    { \voiceTwo mi''2.-4 }
  >> \oneVoice | % 15
  mi''4\<( do''' mi'')\! | % 16
  mi''8\downbow( re'') si''!8\upbow la'' sol''( re'') | % 17
  fa''8\pp\downbow( la') mi''4.( re''8) | % 18
  do''2 ~ do''8 r8 | \break % 19
  \mark \markup { \box "50" }
  la''2\pp\downbow\> do'''4\!_\markup { \italic "sentito" } | % 20
  fa''2 \once \omit Hairpin la''4\<_\markup { \italic "cresc." } | % 21
  re''4 re'''8 do''' sib''\upbow( fa'') | % 22
  la''2 sol''4 | % 23
  sib''2 re''4 | % 24
  la''4( do''') fa'' | % 25
  la''2( sol''4) | \break % 26
  fa''2. | % 27
  \once \omit DynamicText
  re'''4\mf\downbow re'''8\upbow do'''\downbow sib''\upbow( fa'')_\markup { \italic "espress." } | % 28
  la''2 sol''4-2 | % 29
  sib''4\downbow-4 sib''8\upbow la''\downbow sol''\upbow( re''-1) | % 30
  fa''2-3 mi''4\upbow | \break % 31
  fa''4\p\downbow\< sol''8\upbow la''\downbow-1 sib''16\upbow( do'''-1) re''' mi''' | % 32
  fa'''4.\f fa'''8\>( mi''' re''') | % 33
  la''4\downbow-1 do'''\upbow-3( mi''\!) | % 34
  fa''4.\p-1 fa'''8\<-4-> fa'''-> fa'''-> | % 35
  fa'''4.\f-> fa'''8-> fa'''-> fa'''-> | % 36
  fa'''4.\f-> fa'''8\>( mi''' re''') | \break % 37
  la''4\downbow-1 do'''\upbow-3( mi''\!) | % 38
  fa''4.\p-1 fa'''8\<-4-> fa'''-> fa'''-> | % 39
  fa'''4.-> fa'''8-> fa'''-> fa'''-> | % 40
  fa'''4.\f fa'''8( mi''' re''') | % 41
  la''4\downbow do'''\upbow( mi'') | \break % 42
  fa''4. mi''8\p\upbow( fa'' sol'') | % 43
  la''4.\>_\markup { \italic "dim." }( fa''8 la'' re''') | % 44
  re'''4.-2_\markup { \italic "sempre" } sib''8-4( re''' fa'''-2) | % 45
  la'''2.-4^\markup { \small "LA" }\! | % 46
  la'''2.\ppp ~ | % 47
  la'''8 r8 r4\fermata r4 \bar "|." % 48
}

\score {
  \new Staff \with {
    instrumentName = "Violín I"
    midiInstrument = "violin"
  } { \violin }
  \layout { }
  \midi {
    \context {
      \Score
      dynamicAbsoluteVolumeFunction = #intermezzo-dynamic-volume
    }
  }
}
