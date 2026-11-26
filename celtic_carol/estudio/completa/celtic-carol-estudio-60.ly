\version "2.24.0"
\language "espanol"
\include "esquema-digitacion.ily"
\include "miniatura-digitacion.ily"

\header {
  title = "Celtic Carol"
  subtitle = "Violín 1 · Estudio completo · negra con puntillo = 60"
  tagline = ##f
  composer = "Lindsey Stirling"
  arranger = "Adaptación: Sean O'Loughlin"
}

#(set-global-staff-size 17)
\paper {
  #(set-paper-size "a4")
  page-count = 3
  indent = 0\mm
  top-margin = 10\mm
  bottom-margin = 12\mm
}

% Copia de estudio de ../../celtic_carol.ly · compases 1–112.
% Regeneración con render.py. La obra original conserva sus propios archivos.
% Azul: llegada a otra cuerda. Verde: inicio de escala. ↑ roja: semitono sobre la armadura.
% Contraste dinámico para MIDI, sin alterar las indicaciones impresas.
#(define (celtic-dynamic-volume name)
  (or (assoc-ref '(("ppp" . 0.20) ("pp" . 0.30) ("p" . 0.42)
                   ("mp" . 0.54) ("mf" . 0.68) ("f" . 0.92)
                   ("ff" . 0.96)) name)
      (default-dynamic-absolute-volume name)))

% Revisión con nuevas fotos, 2026-11-13 (skill lilypond-transcripcion).
% Fuentes: 3-Foto-3.jpg = cc. 1–36; 2-Foto-2.jpg = cc. 37–73;
% 1-Foto-1.jpg = cc. 74–112, lote 7BF45D68-EBB0-4F60-86C2-4442F5253E15.
% Cotejadas notas y duraciones de los 112 compases: sin cambios inequívocos.
% Añadidos arcos, digitaciones y «ext. 4» legibles; conservados los saltos.
% Aclaraciones del usuario, 2026-11-13: dudas resueltas.
% C. 27: «(1)» previo indica el paso de tercera a quinta posición (III → V),
% no una nota adicional ni una sustitución del dedo 3 del primer mi.
% C. 66: los ángulos son recordatorios de semitono entre fa'''–mi''',
% do'''–si'', fa''–mi'' y do''–si'. Se imprimen como «½ t.» bajo cada pareja,
% sin añadir articulaciones ni modificar las cuatro ligaduras de tres notas.
% C. 84: se conserva la retoma en re y mp súbito confirmados por el usuario;
% la curva de esta foto no se convierte en otra ligadura mi–re.
% C. 88: confirmados los arcos arriba en el primer do y en la corchea do.
% C. 96: el supuesto segundo «4» era un borrado; no se incorpora.
% Cc. 17, 19, 23: se conservan las dos parejas ligadas con arco arriba,
% confirmadas por el usuario, aunque las curvas nuevas se superpongan.

% Recordatorio de intervalo, texto de estudio sin efecto en MIDI.
semitono = -\tweak self-alignment-X #LEFT _\markup { \teeny "½ t." }

subir = ^\markup { \with-color #red \char #8593 }

violin = \absolute {
  \clef treble
  % Sin alteraciones en la armadura; no se presupone una tonalidad.
  \time 12/8
  \tempo "Misterioso" 4. = 60
  \autoLineBreaksOff
  \set Score.currentBarNumber = #1
  \tag #'layout {
    \once \omit Score.BarNumber
    \override NoteHead.style = #'cross
    si'4.^\markup { \small \bold "Entrada" } si'4. si'4. si'4. |
    \revert NoteHead.style
  }
  \tag #'midi { r1. | }
  \bar "||"
  \set Score.currentBarNumber = #1

  la''1.\miniaturaDigitacionMarcaIII\p\upbow-1(\< ~ |                         % 1
  la''2.\mf\parenthesize\downbow\> ~ la''4. ~ la''8 si''-2 do'''-3)\! | % 2
  la''1.-1\p\< |                              % 3
  do'''4.-3\mf( re'''4.-4) si''4.-2( do'''4.-3) |  % 4
  la''2.-1( ~ la''4. ~ la''8 si''-2 do'''-3) |   % 5
  la''1.-1 |                                  % 6
  la''2.-1\downbow mi'''2.^\markup { \small \italic "ext. 4" } | \break                   % 7
  re'''4.-4( do'''4.-3) si''4.-2( do'''4.-3) |     % 8
  la''2.-1( ~ la''4. ~ la''8 si''-2 do'''-3) |   % 9
  la''2.-1( ~ la''4. ~ la''8 si''-2 do'''-3) |   % 10
  la''2.-1( ~ la''4. ~ la''8 si''-2 do'''-3) |   % 11
  la''1.-1 |                                  % 12
  \barNumberCheck #13
  \mark \markup { \box "13" }
  do'''4.-3\downbow( si''8-2 do'''-3 la''-1) do'''4.-3( si''8-2 do'''-3 la''-1) | \break % 13
  do'''4.-3( si''8-2 do'''-3 la''-1) do'''4.-3( si''8-2 do'''-3 la''-1) | % 14
  do'''4.-3( si''8-2 do'''-3 la''-1) do'''4.-3( la''4.-1) | % 15
  % Ligaduras a lápiz: tres grupos de tres corcheas.
  \once \override NoteHead.color = #(x11-color 'ForestGreen) do'''8-\tweak color #(x11-color 'ForestGreen) -3\downbow\<( si''-2 la''-1) sol''-2\miniaturaDigitacionMarcaI\upbow( fa''-1 mi''-0) re''-\tweak color #blue -3\downbow( do''-2 si'-1) la'4.-0\upbow\f | % 16
  do''4.-2\downbow\mf si'8\upbow-1( do''-2 la'-0) mi'4-\tweak color #blue -1\downbow la'8\upbow-4( ~ la') mi'-1\upbow( la'-\tweak color #blue -0) | \break % 17
  do''8\downbow-2( si'-1 do''-2) re''\upbow-3( do''-2 si'-1) la'4-0 mi'8-\tweak color #blue -1 la'4-\tweak color #blue -0 si'8-1 | % 18
  do''4.-2\downbow si'8-1\upbow( do''-2 la'-0) mi'4-\tweak color #blue -1\downbow la'8\upbow-\tweak color #blue -0( ~ la') la'-0\upbow( si'-1) | % 19
  do''8-2\downbow( si'-1 do''-2) re''-3\upbow( \grace { mi''16-\tweak color #blue -0 re''-\tweak color #blue -3 } do''8-2 si'-1) la'4.-0\downbow\tenuto la'4.-0\upbow\tenuto | % 20
  do''4.-2\downbow si'8-1\upbow( do''-2 la'-0) mi'4-\tweak color #blue -1\downbow la'8\upbow-4( ~ la' mi'4-1\upbow) | \break % 21
  do''8-\tweak color #blue -2\downbow( si'-1 do''-2) re''-3\upbow( do''-2 si'-1) la'4.-0\downbow la'8-0\upbow( do''-2 mi''-\tweak color #blue -0) | % 22
  % Dos ligaduras de arco y dos indicaciones de arco arriba, según la interpretación indicada.
  do'''4.\miniaturaDigitacionMarcaIII\downbow-3 si''8-2\upbow( do'''-3 la''-1) mi''4-\tweak color #blue -2\downbow la''8-\tweak color #blue -1\upbow( ~ la'') la''-1\upbow( si''-2) | % 23
  do'''8-3\downbow\<( si''-2 do'''-3) re'''-4\upbow( do'''-3 si''-2) la''4.-1\downbow\f-> la''4.-1\upbow-> | % 24
  \mark \markup { \box "25" }
  % Regulador oculto: realiza el crescendo indicado por el texto en el MIDI.
  \once \omit Hairpin
  do'''8-3\downbow\mf\<->( si''-2 do'''-3) la''4.-1_\markup { \italic "cresc. poco a poco" } do'''8-3->( si''-2 do'''-3) la''4.-1 | \break % 25
  do'''8-3->( si''-2 do'''-3) la''4.-1 do'''8-3->( si''-2 do'''-3) la''4.-1 | % 26
  mi'''8-3->^\markup \line { \vcenter \small \italic "III → V" \miniaturaDigitacionV }( re'''-2 mi'''-3) do'''4.-1 mi'''8-3->( re'''-2 mi'''-3) do'''4.-1 | % 27
  % Nivel intermedio para continuar hasta el ff del compás 29.
  \once \omit DynamicText
  mi'''8-3\f\<->( re'''-2 mi'''-3) do'''4.-1 mi'''8-3->( re'''-2 mi'''-3) do'''4.-1 | % 28
  \mark \markup { \box "29" }
  la''8-3\miniaturaDigitacionMarcaI\ff-^ la''-3-^ la''-3-^ \once \override NoteHead.color = #(x11-color 'ForestGreen) la''16-\tweak color #(x11-color 'ForestGreen) -3\upbow\f->( sol''-2 fa''-1 mi''-0 re''8-\tweak color #blue -3-.) mi''4-\tweak color #blue -0-> re''8-\tweak color #blue -3\upbow-> ~ re'' do''4-2\upbow-> | \break % 29
  do''8-2\downbow-. la'-0-. re''-3-. la'-0-. mi''-\tweak color #blue -0-. la'-\tweak color #blue -0-. \once \override NoteHead.color = #(x11-color 'ForestGreen) do''16-\tweak color #(x11-color 'ForestGreen) -2\downbow( si'-1 la'-0 sol'-\tweak color #blue -3 mi'8-1-.) do'8-\tweak color #blue -3\upbow( si-2 la-1) | % 30
  la''8-\tweak color #blue -3\ff-^ la''-3-^ la''-3-^ \once \override NoteHead.color = #(x11-color 'ForestGreen) la''16-\tweak color #(x11-color 'ForestGreen) -3\upbow\f->( sol''-2 fa''-1 mi''-0 re''8-\tweak color #blue -3-.) mi''4-\tweak color #blue -0-> re''8-\tweak color #blue -3\upbow-> ~ re'' do''4-2\upbow-> | % 31
  do''8-2\downbow-. la'-0-. re''-3-. la'-0-. mi''-4-. la''-\tweak color #blue -3\upbow-. sols''-\tweak color #red -2\subir\downbow( mi''-0 si''-4) la''4-3-> r8 | % 32
  \barNumberCheck #33
  \mark \markup { \box "33" }
  \compressEmptyMeasures
  R1.*4 | \pageBreak % 33–36: silencio de cuatro compases

  \barNumberCheck #37
  % Página 2.
  \set Staff.midiInstrument = "pizzicato strings"
  fa''4.-1\mp^\markup { \italic "pizz." } fa''4.-1 mi''4.-0 mi''4.-0 | % 37
  re''4.-\tweak color #blue -3 re''4.-3 re''4.-3 re''4.-3 | % 38
  mi''4.-\tweak color #blue -0 r4. r2. | % 39
  r2. la'4.-\tweak color #blue -0-> la'4.-0-> | % 40
  si'4.-1-> r4. r4. \set Staff.midiInstrument = "violin" do''4-2\mf\upbow^\markup { \italic "arco" }( re''8-3) | \break % 41
  mi''4-\tweak color #blue -0( fa''8-1) sol''4-2( la''8-3) \once \override NoteHead.color = #(x11-color 'ForestGreen) mi''8-\tweak color #(x11-color 'ForestGreen) -0( re''-\tweak color #blue -3 do''-2) si'-1( la'-0 sol'-\tweak color #blue -3) | % 42
  la'4.-\tweak color #blue -0( si'8-1 la'-0 sol'-\tweak color #blue -3) \once \override NoteHead.color = #(x11-color 'ForestGreen) la'8-\tweak color #blue -0\>( si'-1 do''-2 re''-3 do''-2 re''-3)\! | % 43
  \mark \markup { \box "44" }
  mi''4.-\tweak color #blue -0\p\downbow( ~ mi''4 re''8-\tweak color #blue -3) do''4.-2( ~ do''4 la'8-0) | % 44
  si'4-1\< do''8-2 ~ do'' si'4-1 la'2.-0\mf | \break % 45
  mi''4.-\tweak color #blue -0\p( ~ mi''4 re''8-\tweak color #blue -3) do''4.-2( ~ do''4 la'8-0) | % 46
  si'4-1\< do''8-2 ~ do'' si'4-1 la'2.-0\mf | % 47
  do''2.-2\p re''2.-3 | % 48
  mi''2.-\tweak color #blue -0\< sol''4-2\mf fa''8-1 ~ fa'' mi''4-0 | % 49
  re''2.-\tweak color #blue -3 do''4.-2( si'4.-1) | \break % 50
  la'8-0\>( do''-2 mi''-\tweak color #blue -0) la''-3( mi''-0 do''-\tweak color #blue -2) la'4.-0 ~ la'8 mi''-\tweak color #blue -0\upbow( fa''-1)\! | % 51
  \bar "||"
  \time 6/8
  \barNumberCheck #52
  \mark \markup { \box "52" }
  \tempo "Half time" 4. = 30
  sol''4.-2\p\downbow sol''8.-2\upbow( fa''32-1 \once \override NoteHead.color = #(x11-color 'ForestGreen) sol''-\tweak color #(x11-color 'ForestGreen) -2 fa''16-1 mi''-0) | % 52
  re''4-\tweak color #blue -3( si'8-1) sol'8-\tweak color #blue -3( la'-\tweak color #blue -0 si'-1) | % 53
  do''4-2( la'8-0) la'8-0( sols'-\tweak color #blue -3\subir la'-\tweak color #blue -0) | % 54
  si'4-\tweak color #blue -3\miniaturaDigitacionMarcaIII\glissando( sols'8-\tweak color #red -3\subir\miniaturaDigitacionMarcaI) mi'4.-1\< | % 55
  sol''?4.-\tweak color #blue -2\mp\downbow sol''4-2( fa''16-1 mi''-0) | \break % 56
  re''4-\tweak color #blue -3( si'8-1) sol'8-\tweak color #blue -3( la'-\tweak color #blue -0 si'-1) | % 57
  do''8-2( si'-1 la'-0) sols'-\tweak color #blue -3\subir( fas'-\tweak color #red -2\subir sols'-\tweak color #red -3\subir) | % 58
  la'4.-\tweak color #blue -0\< la'4.-0 | % 59
  \bar "||"
  \time 12/8
  \barNumberCheck #60
  \mark \markup { \box "60" }
  \tempo "Double time" 4. = 60
  do''8-2\mf\downbow( si'-1 la'-0 mi'-\tweak color #blue -1 la'-\tweak color #blue -0 si'-1) do''-2->( la'-0) re''-3->( la'-0) mi''-4->( la'-0) | % 60
  si'8-1( sol'-\tweak color #blue -3 re'-0 si-\tweak color #blue -2 re'-\tweak color #blue -0 sol'-3) si'-\tweak color #blue -1( sol'-\tweak color #blue -3 si'-\tweak color #blue -1 re''-3 do''-2 si'-1) | \break % 61
  do''8-2( la'-0) re''-3( la'-0) mi''-4( la'-0) la''-\tweak color #blue -3( mi''-0 la''\miniaturaDigitacionMarcaIII-1) do'''4.-3 | % 62
  si''8-2\upbow( do'''-3 si''-2) la''-1( si''-2 la''-1) sols''2.\subir\miniaturaDigitacionMarcaI\upbow-2 | % 63
  la'8\downbow-\tweak color #blue -0( mi''-\tweak color #blue -0 la''-3 si''-4) do''-\tweak color #blue -2\upbow mi''-\tweak color #blue -0\downbow la''\miniaturaDigitacionMarcaIII\upbow-1->( mi''-0) si''-2->( mi''-0) do'''-3->( mi''-0) | \break % 64
  sol'8\miniaturaDigitacionMarcaI-\tweak color #blue -3( re''-\tweak color #blue -3 sol''-\tweak color #blue -2 la''-3) si'\miniaturaDigitacionMarcaIII-\tweak color #blue -3 re''-\tweak color #blue -1 sol''-4\upbow->( re''-1) la''-\tweak color #blue -1->( re''-\tweak color #blue -1) si''-\tweak color #blue -2->( re'''\miniaturaDigitacionMarcaV-2) | % 65
  \once \override NoteHead.color = #(x11-color 'ForestGreen) fa'''8-\tweak color #(x11-color 'ForestGreen) -4\downbow\semitono( mi'''-3 re'''-2) do'''\miniaturaDigitacionMarcaIII-3\semitono( si''-2 la''-1) sols''-\tweak color #red -2\subir\miniaturaDigitacionMarcaI\downbow( fa''?-1\semitono mi''-0) re''-\tweak color #blue -3( do''-2\semitono si'-1) | % 66
  la'2.-0\< mi''2.-\tweak color #blue -0 | \break % 67
  \mark \markup { \box "68" }
  la''8-3\f-^ la'-\tweak color #blue -0-. la''-\tweak color #blue -3-^ fa''16-1\upbow->( \once \override NoteHead.color = #(x11-color 'ForestGreen) sol''-\tweak color #(x11-color 'ForestGreen) -2 fa''-1 mi''-0 re''8-\tweak color #blue -3-.) mi''4-\tweak color #blue -0-> re''8-\tweak color #blue -3\upbow-> ~ re'' do''4-2\upbow-> | % 68
  do''8-2\downbow-. la'-0-. re''-3-. la'-0-. mi''-\tweak color #blue -0-. la'-\tweak color #blue -0-. do''16-2\downbow( re''-3 do''-2 la'-0 mi'8-\tweak color #blue -1-.) do'8-\tweak color #blue -3( si-2 la-1) | % 69
  la''8-\tweak color #blue -3-^ la'-\tweak color #blue -0-. la''-\tweak color #blue -3-^ fa''16-1\upbow->( \once \override NoteHead.color = #(x11-color 'ForestGreen) sol''-\tweak color #(x11-color 'ForestGreen) -2 fa''-1 mi''-0 re''8-\tweak color #blue -3-.) mi''4-\tweak color #blue -0-> re''8-\tweak color #blue -3\upbow-> ~ re'' do''4-2\upbow-> | \break % 70
  do''8-2\downbow-. la'-0-. re''-3-. la'-0-. mi''-\tweak color #blue -0-. la'-\tweak color #blue -0-. sols''-\tweak color #blue -2\subir\downbow( mi''-0 si''-4) la''4-3-> r8 | % 71
  do''4.-\tweak color #blue -2\mf\downbow si'8-1( do''-2 la'-0) mi'4-\tweak color #blue -1 la'8\upbow-4 ~ la' mi'-1\upbow-. ( la'-\tweak color #blue -0\upbow-.) | % 72
  do''8-2( si'-1 do''-2) re''-3( \grace { do''16-2 re''-3 } do''8-2 si'-1) la'4-0( mi'8-\tweak color #blue -1) la'4-\tweak color #blue -0( si'8-1) | \pageBreak % 73

  \barNumberCheck #74
  % Página 3: compases 74–112.
  do''4.-2\downbow si'8-1( do''-2 la'-0) mi'4-\tweak color #blue -1 la'8\upbow-4 ~ la' mi'-1\upbow-.( la'-\tweak color #blue -0-.) | % 74
  do''8-2( si'-1 do''-2) re''-3( do''-2 si'-1) la'4-0( mi'8-\tweak color #blue -1) la'-\tweak color #blue -0( si'-1 la'-0) | % 75
  \mark \markup { \box "76" }
  do''4.-2\downbow si'8-1( do''-2 la'-0) mi'4-\tweak color #blue -1 la'8\upbow-4 ~ la' mi'-1\upbow( la'-\tweak color #blue -0) | \break % 76
  do''8-2( si'-1 do''-2) re''-3( do''-2 si'-1) la'4.-0 \once \override NoteHead.color = #(x11-color 'ForestGreen) la'16-\tweak color #(x11-color 'ForestGreen) -0( si'-1 do''-2 re''-3 mi''8-4) | % 77
  do'''4.\miniaturaDigitacionMarcaIII-\tweak color #blue -3 si''8-2( do'''-3 la''-1) mi''4-\tweak color #blue -2 la''8-\tweak color #blue -1\upbow( ~ la'') la''-1\upbow( si''-2) | % 78
  do'''8-3\<( si''-2 do'''-3) re'''-4( do'''-3 si''-2) la''4.-1\f-> mi''4.-\tweak color #blue -2-> | % 79
  \once \omit Hairpin
  do'''8-\tweak color #blue -3\downbow\mf\<->( si''-2 do'''-3) la''4.-1_\markup { \italic "cresc. poco a poco" } do'''8-3->( si''-2 do'''-3) la''4.-1 | \break % 80
  do'''8-3->( si''-2 do'''-3) la''4.-1 do'''8-3->( si''-2 do'''-3) la''4.-1 | % 81
  mi'''8\miniaturaDigitacionMarcaV-3->( re'''-2 mi'''-3) do'''4.-1 mi'''8-3->( re'''-2 mi'''-3) do'''4.-1 | % 82
  \once \omit DynamicText
  mi'''8-3\f\<->( re'''-2 mi'''-3) do'''4.-1 mi'''8-3->( re'''-2 mi'''-3) \once \omit DynamicText do'''4.-1\ff | % 83
  \barNumberCheck #84
  \mark \markup { \box "84" }
  % El arco abajo en re indica retoma; no es una ligadura mi–re.
  mi''4.-0\miniaturaDigitacionMarcaI-\tweak text \markup { \dynamic "mp" \normal-text \italic \fontsize #-2 " sub." } \mp\downbow-> ~ mi''4 re''8-\tweak color #blue -3\downbow^\markup { \tiny \italic "retoma" } do''4.-2\upbow->( ~ do''4 la'8-0\upbow) | \break % 84
  si'4-1 do''8-2 ~ do'' si'4-1 do''4.-2\mf\upbow( si'8-1\upbow do''-2 la'-0) | % 85
  la'4-0\mp( mi''8-\tweak color #blue -0) mi''4-0( re''8-\tweak color #blue -3) do''4-2( \grace { re''16-3 do''-2 } si'8-1) la'4-0( sol'8-\tweak color #blue -3) | % 86
  sol'4-3( la'8-\tweak color #blue -0) si'4-1\<\glissando( do''8-1\miniaturaDigitacionMarcaII) re''2.-2\mf | % 87
  do''4.-1\mp\upbow ~ do''4 do''8-1\upbow re''4.-2 sol''4.-\tweak color #blue -1 | \break % 88
  fa''4.-1\miniaturaDigitacionMarcaI mi''4.-0 sol''8-2\upbow-- r8 fa''8-1-- r8 mi''8-0\upbow-.\tenuto r8 | % 89
  re''4-\tweak color #blue -3\downbow( si'8-1 ~ si' la'4-0\downbow) sols'4-\tweak color #blue -3\subir\upbow( fas'8-\tweak color #red -2\subir ~ fas' sols'4-\tweak color #red -3\subir)\glissando | % 90
  la'2.-3\miniaturaDigitacionMarcaII\downbow la'2.-3\upbow-> | % 91
  \once \omit Hairpin
  si'1.-4\downbow\<_\markup { \italic "cresc. poco a poco" } | % 92
  do''1.-\tweak color #blue -1\upbow | % 93
  sol''4.-\tweak color #blue -1\downbow mi''4.-\tweak color #blue -3 sol''4.-\tweak color #blue -1 la''4.\miniaturaDigitacionMarcaIII-1 | \break % 94
  \barNumberCheck #95
  \mark \markup { \box "95" }
  la''2.-1\f\downbow-> mi'''2.->^\markup { \small \italic "ext. 4" } | % 95
  re'''4.-4->( do'''4.-3) si''4.-2->( do'''4.-3) | % 96
  la''2.-1( ~ la''4. ~ la''8 si''-2 do'''-3) | % 97
  la''4.-1\upbow\< ~ la''8 si''-2\downbow( do'''-3) mi'''2.\upbow->^\markup { \small \italic "ext. 4" } | % 98
  la''2.-1\ff\downbow mi'''2.\upbow^\markup { \small \italic "ext. 4" } | % 99
  mi'''4\downbow->^\markup { \small \italic "ext. 4" } re'''8\upbow-4 ~ re''' do'''4\downbow-3 re'''4.\upbow-4-> si''4.\downbow-2-> | \break % 100
  la''2.-1\upbow( ~ la''4. ~ la''8 si''-2 do'''-3) | % 101
  mi'''4.^\markup { \small \italic "ext. 4" }( re'''4.-4) mi'''4.\upbow^\markup { \small \italic "ext. 4" }( re'''8.-4 do'''8.-3) | % 102
  \barNumberCheck #103
  \mark \markup { \box "103" }
  \tempo "Misterioso"
  la''1.-1\downbow\>( ~ | % 103
  la''2.\mf\parenthesize\upbow ~ la''4. ~ la''8 si''-2 do'''-3) | % 104
  la''1.-1\downbow ~ | % 105
  la''1.\> <>\! | \break % 106
  la''2.-1\p\upbow( ~ la''4. ~ la''8 si''-2 do'''-3) | % 107
  la''2.-1( ~ la''4. ~ la''8 si''-2 do'''-3) | % 108
  la''1.-1 | % 109
  \barNumberCheck #110
  <mi''-2 la''-1>1.\mp^\markup { \italic "Solo" }_\markup { \italic "Section — poco rit." } | % 110
  <<
    { \voiceOne la''2.-1 re'''4.-4( ~ re'''8 do'''-3 si''-2) |
      la''1.-1\parenthesize\downbow\fermata\> <>\! }
    \\
    { \voiceTwo mi''1.-2 ~ | mi''1.\fermata }
  >> \oneVoice \bar "|." % 111–112
  \barNumberCheck #113
}

% Cambios de tempo para realizar el poco rit. sin añadir cifras a la partitura.
tempoFinal = {
  % Entrada en 12/8, 51 compases de 12/8, 8 de 6/8 y 50 de 12/8: inicio del 110.
  s4*636
  \set Score.tempoHideNote = ##t
  \set Score.tempoWholesPerMinute = #(ly:make-moment 45 2) s2.
  \set Score.tempoWholesPerMinute = #(ly:make-moment 339 16) s2.
  \set Score.tempoWholesPerMinute = #(ly:make-moment 159 8) s2.
  \set Score.tempoWholesPerMinute = #(ly:make-moment 147 8) s2.
  \set Score.tempoWholesPerMinute = #(ly:make-moment 273 16) s2.
  \set Score.tempoWholesPerMinute = #(ly:make-moment 63 4) s2.
}

\score {
  \new Staff <<
    \new Voice { \keepWithTag #'layout \violin }
  >>
  \layout { }
}

\markup \scale #'(0.83 . 0.83) \esquemaDigitacion

\score {
  \new Staff <<
    \new Voice { \keepWithTag #'midi \violin }
    \new NullVoice { \tempoFinal }
  >>
  \midi {
    \context {
      \Score
      dynamicAbsoluteVolumeFunction = #celtic-dynamic-volume
    }
  }
}
