# Verano: pasajes de escala

[Partitura completa con los seis pasajes marcados](verano_pasajes_marcados.pdf).
Se ha conservado `../verano.ly` y se han señalado en una copia los comienzos
de los intervalos de estudio.

| Compases incluidos | PDF | WAV con claqueta | MP4 |
| --- | --- | --- | --- |
| 10–19 | [Partitura](c010-c019/c010-c019.pdf) | [Audio](c010-c019/out/c010-c019.wav) | [Vídeo](c010-c019/out/c010-c019.mp4) |
| 21–28 | [Partitura](c021-c028/c021-c028.pdf) | [Audio](c021-c028/out/c021-c028.wav) | [Vídeo](c021-c028/out/c021-c028.mp4) |
| 38–40 | [Partitura](c038-c040/c038-c040.pdf) | [Audio](c038-c040/out/c038-c040.wav) | [Vídeo](c038-c040/out/c038-c040.mp4) |
| 64–66 | [Partitura](c064-c066/c064-c066.pdf) | [Audio](c064-c066/out/c064-c066.wav) | [Vídeo](c064-c066/out/c064-c066.mp4) |
| 101–108 | [Partitura](c101-c108/c101-c108.pdf) | [Audio](c101-c108/out/c101-c108.wav) | [Vídeo](c101-c108/out/c101-c108.mp4) |
| 113–114 | [Partitura](c113-c114/c113-c114.pdf) | [Audio](c113-c114/out/c113-c114.wav) | [Vídeo](c113-c114/out/c113-c114.mp4) |

Todos los intervalos se indican con sus dos extremos incluidos. Cada ejercicio
contiene un compás de preparación en 3/4 con tres pulsos de claqueta; a negra =
160 dura 1,125 s. Los compases 10 y 101 comienzan con un silencio de semicorchea,
por lo que su primera nota se escucha después de ese silencio. La indicación
negra = 160 es orientativa y se ha tomado de la transcripción, que señala que
el original indica «Presto». Los vídeos muestran una página fija con el audio;
no incluyen seguimiento por notas. El MIDI conserva el silencio de entrada,
pero la claqueta se mezcla aparte y está en el WAV y el MP4.

Los fragmentos son copias controladas. Si cambia la fuente, hay que revisarlos
antes de regenerar. El script está adaptado a la estructura actual de esta
partitura, no es un extractor universal:

```bash
python3 verano/estudio/preparar_escalas.py
```

Las alturas y los tiempos de las notas MIDI de los seis fragmentos se han
comparado con el MIDI de `verano.ly`. Se han revisado los PDF, un fotograma de
cada vídeo, los flujos de audio y vídeo y los pulsos de entrada. No se ha hecho
una comprobación auditiva. Los ejercicios se describen también en
`segments.json` para su posible importación posterior al sitio.
