# Celtic Carol · Estudio de la obra completa

Parte de Violín 1, compases 1–112. Antes del compás 1, el WAV y el vídeo reproducen
un compás de claqueta en 12/8, con doce corcheas y acento en cada negra con
puntillo. El MIDI conserva ese compás de preparación en silencio.

| Negra con puntillo inicial | Half time, c. 52–59 | Partitura | Vídeo | WAV | MIDI | LilyPond |
| ---: | ---: | --- | --- | --- | --- | --- |
| 60 | 30 | [PDF](celtic-carol-estudio-60.pdf) | [MP4](celtic-carol-estudio-60.mp4) | [WAV](celtic-carol-estudio-60.wav) | [MIDI](celtic-carol-estudio-60.midi) | [LY](celtic-carol-estudio-60.ly) |
| 90 | 45 | [PDF](celtic-carol-estudio-90.pdf) | [MP4](celtic-carol-estudio-90.mp4) | [WAV](celtic-carol-estudio-90.wav) | [MIDI](celtic-carol-estudio-90.midi) | [LY](celtic-carol-estudio-90.ly) |
| 120 | 60 | [PDF](celtic-carol-estudio-120.pdf) | [MP4](celtic-carol-estudio-120.mp4) | [WAV](celtic-carol-estudio-120.wav) | [MIDI](celtic-carol-estudio-120.midi) | [LY](celtic-carol-estudio-120.ly) |

En el compás 60 vuelve el tempo inicial. El ritardando de 110–112 se escala
en la misma proporción. Los vídeos resaltan el compás activo desde la claqueta
y pasan a las páginas 2 y 3 al comenzar los compases 37 y 74. En el silencio
múltiple de los compases 33–36, el número cambia sobre el mismo símbolo.

Las cifras azules indican la llegada a otra cuerda. El verde marca el inicio
de una escala y la flecha roja una nota un semitono por encima de la armadura.
Los números romanos bajo el pentagrama sitúan la mano. El la inicial con dedo 1
se toca en III sobre la cuerda de mi. Se conserva la indicación original
**III → V** sobre el primer mi del 27 y las marcas de cuarto extendido.
La digitación añadida es una propuesta de estudio. En el 55 se mantiene
el dedo 3 en la cuerda de re, de III a I. En el 87 se propone deslizar el
dedo 1 en la cuerda de la, de I a II. Entre 90 y 91 se propone deslizar
el dedo 3 en la de re, de I a II.

La fuente a 120 es la copia anotada de referencia. Regenera las tres versiones
desde la raíz con:

```bash
python3 celtic_carol/estudio/completa/render.py
```

También se puede indicar 60, 90 o 120 como argumento. El render coteja los
eventos MIDI con la obra completa y ajusta la precisión de los tempos.
Con los PDF, MIDI y WAV ya preparados, `python3 render_compas_activo.py celtic-carol`
regenera solo los vídeos desde la raíz del repositorio.
