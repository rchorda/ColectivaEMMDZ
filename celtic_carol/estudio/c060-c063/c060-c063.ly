\version "2.24.0"
\language "espanol"

% Fuente: ../../celtic_carol.ly, Violín 1. Petición [60,64).
% Copia controlada de 60–63; regenerar medios NO resincroniza las notas.
% Contexto: clave de sol, sin armadura, 12/8, negra con puntillo = 120,
% mf indicado en el 60. No se añaden notas previas.
% Un compás de preparación: 2 s, cuatro pulsos con subdivisión ternaria.
% No hay ligaduras ni reguladores abiertos en los extremos.
% Regenerar desde raíz: python3 celtic_carol/estudio/render_12_8.py c060-c063

\header {
  title = "Celtic Carol"
  subtitle = "Violín 1 · Estudio de los compases 60–63"
  composer = "Lindsey Stirling"
  arranger = "Adaptación: Sean O'Loughlin"
  tagline = ##f
}

#(set-global-staff-size 19)
\paper {
  #(set-paper-size "a5landscape")
  top-margin = 8\mm
  bottom-margin = 8\mm
  left-margin = 10\mm
  right-margin = 10\mm
  indent = 0\mm
  ragged-last = ##f
  ragged-bottom = ##t
  print-page-number = ##f
  system-system-spacing.basic-distance = #22
}

#(define (celtic-dynamic-volume name)
  (or (assoc-ref '(("ppp" . 0.20) ("pp" . 0.30) ("p" . 0.42)
                   ("mp" . 0.54) ("mf" . 0.68) ("f" . 0.92)
                   ("ff" . 0.96)) name)
      (default-dynamic-absolute-volume name)))

global = {
  \clef treble
  \time 12/8
  \tempo "Double time" 4. = 120
  \set Staff.midiInstrument = "violin"
}

entrada = \absolute {
  \set Score.currentBarNumber = #59
  \once \omit Score.BarNumber
  \override NoteHead.style = #'cross
  si'4.^\markup { \small \bold "Entrada" } si'4. si'4. si'4. |
  \revert NoteHead.style
}

fragmento = \absolute {
  \set Score.currentBarNumber = #60
  \barNumberCheck #60
  do''8\mf\downbow( si' la' mi' la' si') do''-2->( la') re''-3->( la') mi''-4->( la') | % 60
  \barNumberCheck #61
  si'8-1( sol'-3 re' si-2 re' sol'-3) si'-1( sol'-3 si'-1 re''-3 do''-2 si'-1) | \break % 61
  \barNumberCheck #62
  do''8-2( la') re''-3( la') mi''-4( la') la''( mi'' la''-1) do'''4. | % 62
  \barNumberCheck #63
  si''8\upbow( do''' si'') la''( si'' la'') sols''2.\upbow-2 | % 63
  \barNumberCheck #64
  \bar "|."
}

\score {
  \new Staff { \global \autoLineBreaksOff \entrada \fragmento }
  \layout {
    \context {
      \Score
      barNumberVisibility = #all-bar-numbers-visible
      \override BarNumber.break-visibility = ##(#f #t #t)
    }
  }
}

\markup \column {
  \vspace #0.6
  \small "Entrada: cuatro pulsos de negra con puntillo, con subdivisión en corcheas."
  \small "Claqueta solo al inicio. Selección [60,64): compases 60–63, ambos incluidos."
}

\score {
  \new Staff { \global r1. \fragmento }
  \midi {
    \context {
      \Score
      dynamicAbsoluteVolumeFunction = #celtic-dynamic-volume
    }
  }
}
