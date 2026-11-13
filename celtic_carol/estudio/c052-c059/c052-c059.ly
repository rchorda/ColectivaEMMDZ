\version "2.24.0"
\language "espanol"

% Fuente: ../../celtic_carol.ly, Violín 1, intervalo principal [52,60).
% Entrada anacrúsica: las dos últimas corcheas del 51 (mi''–fa'').
% Copia controlada: regenerar los medios NO resincroniza notas con la obra.
% Preparación en la métrica y tempo de destino: 6/8, negra con puntillo = 60.
% Reescritura proporcional del final del 51: sus dos corcheas a 4. = 120
% equivalen aquí a dos semicorcheas a 4. = 60; se conservan tiempos reales.
% Claqueta: seis corcheas, acentos en 1 y 4 (dos pulsos de negra con puntillo).
% El MIDI incluye la preparación de 2 s, con mi–fa desde 1,6667 s.
% render.py mezcla la claqueta sin añadir silencio. En MIDI se reproduce el
% diminuendo del 51 desde el mf vigente del 49, con silencios en lugar de las
% notas omitidas. Arcos/digitación del 52 y accidental del 56 actualizados
% desde la fuente revisada por el usuario.
% Adaptación: el crescendo del 59 llega a mf al final del ejercicio mediante
% una indicación oculta, tomando como referencia el mf del 60 excluido.
% Se omiten tempoFinal y los saltos de página/sistema de la obra completa.
% Regeneración desde cualquier carpeta: python3 /ruta/a/este/render.py

\header {
  title = "Celtic Carol"
  subtitle = "Violín 1 · Compases 52–59 con entrada del 51"
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
  \time 6/8
  \tempo "Half time" 4. = 60
  \set Staff.midiInstrument = "violin"
}

entrada = \absolute {
  \set Score.currentBarNumber = #51
  \once \omit Score.BarNumber
  \tag #'layout {
    r4.^\markup { \small \bold "Preparación en 6/8" }
    r4 mi''16\upbow( fa'') |
  }
  \tag #'midi {
    r4.\mf\> r4 mi''16\upbow( fa'')\! |
  }
  \bar "||"
}

fragmento = \absolute {
  \set Score.currentBarNumber = #52
  \barNumberCheck #52
  sol''4.\p\downbow sol''8.\upbow( fa''32 sol'' fa''16 mi''-0) | % 52
  \barNumberCheck #53
  re''4( si'8) sol'8( la' si') | % 53
  \barNumberCheck #54
  do''4( la'8) la'8( sols' la') | % 54
  \barNumberCheck #55
  si'4\glissando( sols'8) mi'4.\< | \break % 55
  \barNumberCheck #56
  sol''?4.\mp\downbow sol''4( fa''16 mi'') | % 56
  \barNumberCheck #57
  re''4( si'8) sol'8( la' si') | % 57
  \barNumberCheck #58
  do''8( si' la') sols'( fas' sols') | % 58
  \barNumberCheck #59
  la'4.\< la'4.
  \tag #'layout { <>\! }
  \tag #'midi { <>\mf } | % 59: cierre de estudio
  \barNumberCheck #60
  \bar "|."
}

\score {
  \new Staff {
    \global \autoLineBreaksOff
    \keepWithTag #'layout \entrada
    \keepWithTag #'layout \fragmento
  }
  \layout {
    \context {
      \Score
      barNumberVisibility = #all-bar-numbers-visible
      \override BarNumber.break-visibility = ##(#f #t #t)
    }
  }
}

\markup {
  \column {
    \vspace #0.6
    \small "Claqueta: seis corcheas, acentos en 1 y 4; tempo del 52 desde la entrada."
    \small "Mi-fa: dos semicorcheas en la última corchea, con su duración original."
    \small "Adaptación del 51: corcheas a 120 = semicorcheas a 60 (negra con puntillo)."
    \small "Cierre de estudio: el crescendo del 59 alcanza mf al final del fragmento."
  }
}

\score {
  \new Staff {
    \global \keepWithTag #'midi \entrada \keepWithTag #'midi \fragmento
  }
  \midi {
    \context {
      \Score
      dynamicAbsoluteVolumeFunction = #celtic-dynamic-volume
    }
  }
}
