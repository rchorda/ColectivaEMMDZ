# Ejemplo de referencia: Celtic Carol [52, 60)

Fuente: `celtic_carol/celtic_carol.ly`, voz de Violín 1. Vuelve a inspeccionarla
antes de generar: estos datos describen la fuente revisada el 13 de noviembre
de 2026, no sustituyen al archivo vigente.

- Intervalo: inicio 52 incluido, fin 60 excluido; ocho compases, 52–59.
- Carpeta y base: `celtic_carol/estudio/c052-c059/c052-c059`.
- En el 52 cambia a 6/8, «Half time», negra con puntillo = 60.
- Clave de sol, sin alteraciones de armadura; dinámica inicial `p`, arco abajo.
- El 56 establece `mp`. En el 59 hay un crescendo cuya llegada `mf` está en
  el 60. Decide y anota su cierre de estudio sin añadir las notas del 60 ni
  presentar una adaptación dinámica como parte del original.
- El 60 cambia a 12/8 y negra con puntillo = 120; queda fuera del ejercicio.
- La fuente usa alturas absolutas. Conserva digitaciones, arcos y articulaciones
  escritos y vuelve a comprobar los límites de las ligaduras.
- `tempoFinal` contiene silencios y tempos del final de la obra: no copies esa
  voz completa al ejercicio, porque no corresponde a este intervalo.

La versión actual incluye las dos últimas corcheas del 51 (mi''–fa'') como
entrada anacrúsica, a petición del usuario. La preparación usa el 6/8 y el
tempo de destino (negra con puntillo = 60) para interiorizar el pulso del 52.
La claqueta marca seis corcheas, con acentos en 1 y 4. Mi–fa se reescribe
como dos semicorcheas en la última corchea de la preparación: conserva la
duración real de las dos corcheas originales a negra con puntillo = 120.
Esta es una adaptación de estudio documentada, no un cambio en la obra.
El título identifica la entrada del 51 y conserva 52–59 como intervalo principal.

Duración teórica al tempo original: 2 segundos de entrada + 8 × 2 segundos
de música = 18 segundos antes de la cola de sonido. No es una duración medida
de un WAV.

## Ejercicio generado y comprobado

El proyecto contiene `celtic_carol/estudio/c052-c059/c052-c059.ly` y su
`render.py`, que regenera PDF/MIDI, sintetiza la claqueta, mezcla el WAV y
produce el vídeo con los scripts comunes. No resincroniza las notas con la
obra. El cierre impreso del crescendo usa `\!`; el MIDI alcanza `mf` en el
límite final, sin incorporar notas del 60.

Comprobaciones del 13 de noviembre de 2026: compilación con LilyPond 2.24.4
sin advertencias; 38 notas con las alturas, los tiempos reales y las velocidades
MIDI de la fuente (dos del 51 y 36 de 52–59), tras convertir la preparación
al tempo de destino. Golpes de claqueta en 0, 0,3333, 0,6667, 1, 1,3333
y 1,6667 s. Mi–fa entra a 1,6667 y 1,8333 s; el sol del 52, a 2 s.
Final musical a 18 s, salvo redondeo MIDI inferior a 0,00002 s.
WAV de 20,9067 s incluida la cola, pico de −3 dBFS; MP4 con H.264/AAC y
partitura completa horizontal, comprobada visualmente junto al PDF.
La comprobación auditiva queda pendiente.
