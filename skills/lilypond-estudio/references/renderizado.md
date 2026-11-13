# Renderizado en ColectivaEMMDZ

Confirma las interfaces actuales en el README y los scripts antes de usarlas.
Desde la raíz, con un `.ly` de ejercicio ya preparado:

```bash
./render_mp4.sh celtic_carol/estudio/c052-c059/c052-c059.ly
```

Este comando compila PDF/MIDI junto al `.ly`, genera el WAV y crea el MP4 en
`out/` junto al ejercicio. Para obtener solo PDF/MIDI/WAV:

```bash
./render_wav.sh celtic_carol/estudio/c052-c059/c052-c059.ly
```

Son comandos de renderizado de una fuente existente, no de extracción.
Para el ejemplo de Celtic Carol, que mezcla una claqueta sintetizada con las
notas de entrada del 51, regenera el conjunto mediante su helper:

```bash
python3 celtic_carol/estudio/c052-c059/render.py
```

La vía `.ly` por sí sola sintetiza el violín, pero no esa claqueta externa.
Las dependencias actuales incluyen LilyPond, FluidSynth, SoX, FFmpeg/ffprobe,
ImageMagick (`magick`) y Ghostscript. Comprueba únicamente las necesarias
para las salidas pedidas y verifica el SoundFont disponible.

## Claqueta

El SoundFont predeterminado es `Violin STR VI (5,353KB).sf2`; no presupongas
que contiene percusión. Opciones:

- Usar MIDI de percusión si se comprueba que el SoundFont reproduce los golpes.
- Sintetizar una pista de claqueta aparte con SoX o una herramienta local y
  mezclarla con el audio del violín, controlando acentos y volumen.

Mantén un único compás de preparación. Si el MIDI del violín ya contiene el
silencio de entrada, mezcla la claqueta en ese silencio sin añadir otro.
Si contiene notas anacrúsicas al final de la preparación, mezcla la claqueta
en el mismo intervalo de tiempo, conservando la entrada de esas notas.
Si el audio empieza directamente con el pasaje, desplázalo exactamente la
duración de un compás antes de mezclar. Calcula esa duración a partir de la
métrica y la unidad del tempo; evita silencios iniciales accidentales.

Normaliza la mezcla final con ganancia uniforme siguiendo el criterio actual
del proyecto (pico de −3 dBFS). No normalices cada nota: perderías la dinámica.
Si preparas la claqueta por separado, genera el vídeo a partir del PDF y del
WAV final, para que el camino `.ly` no vuelva a sintetizarlo y lo sobrescriba:

```bash
./render_mp4.sh celtic_carol/estudio/c052-c059/c052-c059.pdf
```

## Vídeo y verificaciones

El MP4 actual es un pase de páginas con el WAV. Sin tiempos explícitos reparte
la duración equitativamente entre páginas; esto no equivale a sincronización
musical. Para varias páginas, calcula sus tiempos reales teniendo en cuenta
entrada, compases y cambios de tempo y pásalos mediante el cuarto argumento
`T` de `render_mp4.sh`, según el README. Un fragmento corto legible en una
sola página no necesita pase de hojas. Un cursor por notas requeriría una
implementación adicional, no incluida en estos scripts ni en esta skill.

Compara duración musical prevista y medida, separando la cola de reverberación.
Comprueba que el audio empieza con la claqueta, la primera nota entra a tiempo,
no suena el primer compás excluido y el vídeo contiene el audio final.
Cuando no sea posible escuchar, declara las verificaciones estructurales
realizadas y deja la comprobación auditiva como pendiente.

## Variantes de tempo

Para los cuatro ejercicios actuales de Celtic Carol, `render_tempos.py` en
`celtic_carol/estudio/` genera vídeos al 50 % y 75 %. Sin argumentos procesa
los cuatro; admite sus nombres de carpeta para limitar la selección.
Recompila fuentes temporales, modifica el tempo visible, vuelve a sintetizar
el MIDI y adapta la claqueta, incluida la entrada del 51. Conserva solo los
MP4 finales, con sufijos `_t050` y `_t075`, junto al vídeo original.

Verifica el tempo efectivo del MIDI, además del texto impreso: un tempo de
negra con puntillo puede equivaler a una cifra fraccionaria de negras por
minuto que el compilador redondee. El helper corrige el evento de tempo SMF
a la precisión de un microsegundo por negra y comprueba que el resto de los
eventos de canal coincide con el MIDI original. Los MIDI de referencia deben
estar actualizados; no elimina esa comprobación si detecta diferencias.
