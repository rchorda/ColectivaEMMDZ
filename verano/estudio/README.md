# Verano · pasajes de escala

La [partitura base](../verano.pdf) y la [partitura con los pasajes marcados](verano_pasajes_marcados.pdf)
están a **negra = 120**, con la indicación *Presto* del original.

Cada ejercicio comienza con un compás en **3/4** subdividido en **12 semicorcheas**.
La claqueta acentúa las tres negras y da un acento más fuerte al inicio del
compás. Suena solo durante la entrada. Los compases 10 y 101 conservan su
silencio inicial de semicorchea. El MIDI contiene el compás de preparación en
silencio y la claqueta se mezcla en el audio y el vídeo.

| Compases | PDF | WAV a 120 | MP4 a 80 | MP4 a 90 | MP4 a 100 | MP4 a 110 | MP4 a 120 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 10–19 | [PDF](c010-c019/c010-c019.pdf) | [Audio](c010-c019/out/c010-c019.wav) | [80](c010-c019/out/c010-c019_t080.mp4) | [90](c010-c019/out/c010-c019_t090.mp4) | [100](c010-c019/out/c010-c019_t100.mp4) | [110](c010-c019/out/c010-c019_t110.mp4) | [120](c010-c019/out/c010-c019.mp4) |
| 21–28 | [PDF](c021-c028/c021-c028.pdf) | [Audio](c021-c028/out/c021-c028.wav) | [80](c021-c028/out/c021-c028_t080.mp4) | [90](c021-c028/out/c021-c028_t090.mp4) | [100](c021-c028/out/c021-c028_t100.mp4) | [110](c021-c028/out/c021-c028_t110.mp4) | [120](c021-c028/out/c021-c028.mp4) |
| 38–40 | [PDF](c038-c040/c038-c040.pdf) | [Audio](c038-c040/out/c038-c040.wav) | [80](c038-c040/out/c038-c040_t080.mp4) | [90](c038-c040/out/c038-c040_t090.mp4) | [100](c038-c040/out/c038-c040_t100.mp4) | [110](c038-c040/out/c038-c040_t110.mp4) | [120](c038-c040/out/c038-c040.mp4) |
| 64–66 | [PDF](c064-c066/c064-c066.pdf) | [Audio](c064-c066/out/c064-c066.wav) | [80](c064-c066/out/c064-c066_t080.mp4) | [90](c064-c066/out/c064-c066_t090.mp4) | [100](c064-c066/out/c064-c066_t100.mp4) | [110](c064-c066/out/c064-c066_t110.mp4) | [120](c064-c066/out/c064-c066.mp4) |
| 101–108 | [PDF](c101-c108/c101-c108.pdf) | [Audio](c101-c108/out/c101-c108.wav) | [80](c101-c108/out/c101-c108_t080.mp4) | [90](c101-c108/out/c101-c108_t090.mp4) | [100](c101-c108/out/c101-c108_t100.mp4) | [110](c101-c108/out/c101-c108_t110.mp4) | [120](c101-c108/out/c101-c108.mp4) |
| 113–114 | [PDF](c113-c114/c113-c114.pdf) | [Audio](c113-c114/out/c113-c114.wav) | [80](c113-c114/out/c113-c114_t080.mp4) | [90](c113-c114/out/c113-c114_t090.mp4) | [100](c113-c114/out/c113-c114_t100.mp4) | [110](c113-c114/out/c113-c114_t110.mp4) | [120](c113-c114/out/c113-c114.mp4) |

Los intervalos de la tabla incluyen ambos extremos. Los PDF y MIDI guardados
junto a las fuentes de los ejercicios corresponden a negra = 120. Cada vídeo
imprime su propio tempo y usa una síntesis nueva con la claqueta correspondiente.
Los nombres de las variantes indican el tempo absoluto (por ejemplo,
`_t080.mp4` corresponde a negra = 80).

## Regeneración

Los fragmentos son copias controladas de `../verano.ly`. Revisa las notas y
los límites si cambia la partitura. El primer comando regenera la partitura
marcada y los seis ejercicios a 120. El segundo genera las variantes de vídeo
según `segments.json`. Puedes pasar uno o varios identificadores al segundo
comando para limitar la selección.

```bash
python3 verano/estudio/preparar_escalas.py
python3 verano/estudio/render_tempos.py
python3 verano/estudio/render_tempos.py c010-c019
```

El renderizador comprueba los eventos MIDI de las variantes frente a su
referencia, los 12 golpes de claqueta y sus acentos, y las pistas del MP4.
