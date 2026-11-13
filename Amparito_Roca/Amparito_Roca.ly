\version "2.24.4"
\language "espanol"
\include "articulate.ly"


\header{
  title = "Amparito Roca"
  composer = "Jaime Teixidor Dalmau"
  instrument = "Violín 1"
  tagline = ##f
}

global = {
  \key sib \major
  \time 2/4
  % Beam 4 eighth-notes together in 2/4 (only affects consecutive 8ths)
  \set Timing.baseMoment = #(ly:make-moment 1/8)
  \set Timing.beatStructure = #'(4)
  % Keep smaller values grouped by the two quarter-note beats
  \set Timing.beamExceptions = #'((end . (((1 . 16) . (4 4))
                                         ((1 . 32) . (8 8)))))
  \tempo 4 = 117
}

violinI = \relative do'' {
  \global

  % NOTA: La foto provista está recortada; transcribo lo que se ve con claridad en el
  % primer sistema y dejo el resto como plantilla (silencios) para completar cuando
  % compartas el resto de la partitura o una imagen completa.

  % Compases 1–8 (aprox. según la imagen)
  sol'8 sol16 \downbow sol sol sol sol8 
  \stemUp
  fa mib re do
  re mib fa re
  mib re do si 
  do re mib do
  re do si do
  re mib re do
  sol lab16 (sib  \tuplet 5/4 { do re do sib lab }) 
  \break
  sol8 lab16 (sib  \tuplet 5/4 { do re do sib lab }) 
  sol8 r \stemNeutral  sol' r 
  r fa \upbow \stemUp mib re
  do2
  si4 (sol)
  do2 
  si4 (sol)
  do2~
  do8 re16 (do) si8 do16(re)
  do2~
  do8 re16 (do) si8 do16(re)
  \break
  do8 re16(do) si8 do16(re)
  do8 re16(do) si16 (do16 re si)

  do2~
  do8 r sol4
  mib'2-2~ 
  mib8 fa16(mib) re8-1 mib16(fa)
  mib2-2~ 
  mib8 fa16(mib) re8-1 mib16(fa)
  mib8 fa16(mib) re8-1 mib16(fa)
  \break
  mib8 fa16(mib) re16 (mib16 fa re)
  mib2~
  mib8 re mib fa
  \stemNeutral
  sol4. sol8
  sib4. \tuplet 3/2 { la16 (sib la) }
  sol2~
  \stemUp
  sol8 si, do re


}

\score{
  \new Staff \with{
    instrumentName = "Violín 1"
    shortInstrumentName = "Vln. 1"
  }{
    \violinI
  }
  \layout{}
  \midi{}
}