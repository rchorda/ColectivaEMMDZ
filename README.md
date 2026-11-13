# ColectivaEMMDZ

## Organización de las partituras

Cada obra tiene una carpeta en la raíz. Incluye las fuentes LilyPond, las
inclusiones locales, el PDF, el MIDI y los documentos relacionados. Las variantes
de una misma obra, como `hey_jude`, `verano` y `Compendio`, comparten carpeta.
La plantilla `base.ly`, los scripts y los SoundFonts son recursos comunes y
permanecen en la raíz.

```text
celtic_carol/
  celtic_carol.ly
  celtic_carol.pdf
  celtic_carol.midi
  out/
    celtic_carol.wav
    celtic_carol.mp4
    ... imágenes y tiempos del pase de hojas
```

Los resultados del antiguo `out/` común se conservan en el `out/` de cada obra,
incluidos sus PDF y MIDI históricos. En `tu_pieza/out/legacy-root/` se conservan
el WAV y las imágenes que estaban en la raíz, además del MP4 vacío de un intento
fallido, para evitar sobrescribir archivos del mismo nombre. Los nuevos
renderizados actualizan PDF y MIDI junto al `.ly` y guardan el audio, el vídeo y
los archivos auxiliares del vídeo en `out/`.

Los movimientos de archivos versionados se han realizado con `git mv`.
Git conserva el historial en los commits anteriores y reconoce los cambios de
ruta al comparar versiones; para seguir una fuente puede usarse, por ejemplo,
`git log --follow -- celtic_carol/celtic_carol.ly`.
Los directorios `out/` vacíos se crean al renderizar y no necesitan versionarse.

## Renderizado

Los comandos de renderizado comparten la biblioteca `render_lib.sh`.
El WAV generado se normaliza a un pico de −3 dBFS con una ganancia uniforme,
por lo que conserva los contrastes dinámicos de la interpretación MIDI. El MP4
utiliza ese audio; al partir de un PDF y un WAV existentes, normaliza una copia
temporal para el vídeo sin modificar el WAV original.

Uso directo:

```bash
./render_wav.sh celtic_carol/celtic_carol.ly
./render_mp4.sh celtic_carol/celtic_carol.ly
./render_mp4.sh celtic_carol/celtic_carol.ly "" "" 20,40
./render_wav.sh "The First Noel/The First Noel.midi"
```

Uso como biblioteca desde otro script:

```bash
source ./render_lib.sh

render_wav "celtic_carol/celtic_carol.ly"
render_mp4 "celtic_carol/celtic_carol.ly" "" "$RENDER_DEFAULT_SF2" "20,40"
```

Funciones principales:

- `render_wav <archivo.ly|archivo.mid|archivo.midi> [outdir] [sf2_path]`
- `render_mp4 <archivo.ly|archivo.pdf> [outdir] [sf2_path] [T]`

Sin `outdir` (o pasando `""`), la salida es `out/` junto a la entrada. Si la
entrada ya está en una carpeta llamada `out`, se reutiliza esa carpeta. Un
`outdir` explícito sigue siendo relativo al directorio de trabajo, o puede ser
una ruta absoluta. El SoundFont predeterminado se localiza junto a los scripts,
sin depender de la ubicación del repositorio ni del directorio de trabajo.

Los scripts pueden invocarse también desde dentro de una obra:

```bash
cd celtic_carol
../render_wav.sh celtic_carol.ly
../render_mp4.sh celtic_carol.pdf
```

Para generar el vídeo a partir de un PDF, se busca su WAV en la salida elegida,
en el `out/` junto al PDF o junto al propio PDF. El parámetro `T` conserva el
control de los tiempos del pase de hojas: sin él, la duración del audio se
reparte por igual entre páginas; no se calcula seguimiento por notas.
El comando antiguo `b.midi2wav` delega en `render_wav.sh` y acepta tanto una
ruta base sin extensión como un archivo `.mid` o `.midi`.

## Transcripción y revisión con fotografías en Codex

La skill [lilypond-transcripcion](skills/lilypond-transcripcion/SKILL.md)
organiza la lectura de fotografías y escaneos, la escritura en LilyPond y el
cotejo con los originales. También permite revisar una partitura existente con
nuevas fotos, detalles ampliados o anotaciones añadidas. Usa LilyPond Maestro como apoyo para notación y
revisión; añade las convenciones de archivos y renderizado de este proyecto.
Su fuente se mantiene en `skills/lilypond-transcripcion/` y se descubre mediante
el enlace `.agents/skills/lilypond-transcripcion`.

Ejemplo de petición:

> Usa $lilypond-transcripcion para continuar esta obra con las fotografías:
> primero notas y duraciones, después anotaciones a lápiz. Indica las dudas,
> conserva los bloques musicales y actualiza LilyPond, PDF, MIDI, WAV y MP4.

Para revisar una fuente existente:

> Usa $lilypond-transcripcion para revisar verano/verano.ly con estas nuevas
> fotografías. Localiza los compases, compara notas y anotaciones y señala las
> discrepancias y dudas. Aplica las correcciones confirmadas y actualiza los
> archivos manteniendo las tres páginas y los bloques musicales.

Si se pide solo revisar, entrega los hallazgos; si se pide corregir, aplica
los cambios confirmados. Una nueva fotografía no sustituye automáticamente
las decisiones interpretativas anteriores ni la maquetación acordada.

La skill distingue errores confirmados, lecturas pendientes y diferencias
entre ediciones. Es un procedimiento de trabajo, no un OCR automático.
Para preparar ejercicios desde una fuente ya transcrita, usa `lilypond-estudio`.

## Segmentos de estudio con Codex

La skill [lilypond-estudio](skills/lilypond-estudio/SKILL.md) combina las
instrucciones del complemento **LilyPond Maestro (notación española)** con
el flujo de preparación de fragmentos, claqueta y renderizado PDF/WAV/MP4.
Su fuente se mantiene en `skills/lilypond-estudio/`; el registro de proyecto
en `.agents/skills/lilypond-estudio` enlaza a esa carpeta.

Ejemplo de petición:

> Usa $lilypond-estudio para generar Celtic Carol desde el compás 52 hasta el
> 60, excluido, con un compás de claqueta, PDF, WAV y MP4.

La selección usa límites `[inicio, fin)` y los nombres indican los compases
realmente incluidos: este ejemplo se guarda en `celtic_carol/estudio/c052-c059/`.
La fuente, PDF y MIDI quedan en esa carpeta; WAV y MP4, en su `out/`.
La skill contiene instrucciones reutilizables y un caso de referencia;
no incorpora todavía un extractor automático general.
Requiere tener disponible Maestro para aplicar sus instrucciones originales;
si falta, debe indicarlo y trabajar con las fuentes y herramientas locales.

El primer ejercicio generado es [Celtic Carol, compases 52–59](celtic_carol/estudio/c052-c059/c052-c059.pdf),
con [WAV](celtic_carol/estudio/c052-c059/out/c052-c059.wav) y
[MP4](celtic_carol/estudio/c052-c059/out/c052-c059.mp4). Incluye las dos últimas
corcheas del 51 (mi–fa), reescritas como semicorcheas dentro de la preparación
en 6/8, a negra con puntillo = 60. La claqueta prepara el pulso de destino:
seis corcheas con acentos en 1 y 4; mi–fa ocupa la última corchea.
Esta reescritura conserva la duración real de las dos corcheas originales
a negra con puntillo = 120. Las 38 notas mantienen sus alturas, tiempos reales
y velocidades MIDI. La preparación ocupa 2 s,
la música termina a los 18 s y el WAV dura 20,91 s con la cola de sonido.
El vídeo muestra la partitura completa en una página, sin cursor por notas.

Para regenerar todos sus medios, incluida la mezcla de claqueta:

```bash
python3 celtic_carol/estudio/c052-c059/render.py
```

La fuente del ejercicio es una copia controlada: este comando no vuelve a
extraer las notas de la obra. La revisión inicial verificó compilación,
correspondencia MIDI, pulsos, duraciones y presentación visual; la escucha
queda pendiente.

También están preparados estos ejercicios en 12/8, a negra con puntillo = 120,
con un compás de claqueta de cuatro pulsos subdivididos en corcheas:

| Selección | Compases incluidos | PDF | WAV | MP4 |
| --- | --- | --- | --- | --- |
| `[29,33)` | 29–32 | [Partitura](celtic_carol/estudio/c029-c032/c029-c032.pdf) | [Audio](celtic_carol/estudio/c029-c032/out/c029-c032.wav) | [Vídeo](celtic_carol/estudio/c029-c032/out/c029-c032.mp4) |
| `[60,64)` | 60–63 | [Partitura](celtic_carol/estudio/c060-c063/c060-c063.pdf) | [Audio](celtic_carol/estudio/c060-c063/out/c060-c063.wav) | [Vídeo](celtic_carol/estudio/c060-c063/out/c060-c063.mp4) |
| `[64,68)` | 64–67 | [Partitura](celtic_carol/estudio/c064-c067/c064-c067.pdf) | [Audio](celtic_carol/estudio/c064-c067/out/c064-c067.wav) | [Vídeo](celtic_carol/estudio/c064-c067/out/c064-c067.mp4) |

En los ejercicios 60–63 y 64–67 se comprobaron respectivamente 41 y 38 notas frente al MIDI de la fuente,
con igualdad de alturas, tiempos y velocidades. Ambos tienen 2 s de entrada,
8 s de música y una duración WAV de 12,906 s incluida la cola. El segundo
cierra el crescendo del 67 hacia el `f` del límite final, sin añadir notas
del 68; la adaptación se indica en la partitura. PDF y fotogramas del vídeo
revisados visualmente; escucha pendiente.

El ejercicio 29–32 conserva sus cambios `ff`–`f`, arcos y articulaciones;
se cotejaron 46 notas con igualdad de alturas, tiempos y velocidades MIDI.
Su WAV dura 12,739 s, incluida la cola; el 32 termina con un silencio de
corchea. PDF y fotograma de vídeo revisados; escucha pendiente.

Para regenerar los tres ejercicios en 12/8, o uno indicando su nombre:

```bash
python3 celtic_carol/estudio/render_12_8.py
python3 celtic_carol/estudio/render_12_8.py c029-c032
python3 celtic_carol/estudio/render_12_8.py c064-c067
```

### Vídeos a tempo reducido

Cada segmento dispone de vídeos al 50 % (`_t050.mp4`) y 75 % (`_t075.mp4`).
Se recompila la partitura con el tempo visible correcto y se vuelve a
sintetizar el MIDI, conservando alturas, articulaciones y velocidades.
La claqueta y la entrada anacrúsica se escalan junto con el pasaje.
Los valores de la tabla corresponden a la negra con puntillo:

| Compases | 1/2 del tempo original | 3/4 del tempo original |
| --- | --- | --- |
| 29–32 | [60](celtic_carol/estudio/c029-c032/out/c029-c032_t050.mp4) | [90](celtic_carol/estudio/c029-c032/out/c029-c032_t075.mp4) |
| 52–59, con entrada del 51 | [30](celtic_carol/estudio/c052-c059/out/c052-c059_t050.mp4) | [45](celtic_carol/estudio/c052-c059/out/c052-c059_t075.mp4) |
| 60–63 | [60](celtic_carol/estudio/c060-c063/out/c060-c063_t050.mp4) | [90](celtic_carol/estudio/c060-c063/out/c060-c063_t075.mp4) |
| 64–67 | [60](celtic_carol/estudio/c064-c067/out/c064-c067_t050.mp4) | [90](celtic_carol/estudio/c064-c067/out/c064-c067_t075.mp4) |

Regeneración de los ocho vídeos, o de las dos velocidades de un segmento:

```bash
python3 celtic_carol/estudio/render_tempos.py
python3 celtic_carol/estudio/render_tempos.py c052-c059
```

El script genera PDF/MIDI/WAV intermedios en una carpeta temporal y conserva
los MP4 en `out/`. Requiere los MIDI originales actualizados: compara todos
los eventos de canal antes de renderizar. Verifica el tempo en microsegundos
por negra y corrige el redondeo observado en LilyPond 2.24.4 para negra con
puntillo = 45 (negra = 67,5), sin cambiar los eventos musicales.
Los ocho vídeos tienen comprobación de pistas y duración, golpes de claqueta
en audio decodificado y revisión visual del tempo y la partitura. Escucha
pendiente. Las colas de sonido se sintetizan de nuevo y no se estiran con
el tempo, por lo que la duración total no es un múltiplo exacto del MP4 original.

## Biblioteca web: Entre cuerdas

El sitio de partituras se mantiene en un repositorio independiente, situado localmente en `sites/entre-cuerdas/`. Su README contiene el detalle del sitio. Reúne PDF, audio de estudio, fuentes LilyPond e inclusiones, además de un cuaderno de trucos y una guía para seguir editando con Codex y LilyPond Maestro.

Sitio publicado: [Entre cuerdas](https://entre-cuerdas-archivo.rchorda.chatgpt.site). Acceso privado con ChatGPT.

Los segmentos se consultan desde **Estudio** en el menú del sitio y desde la
ficha de su obra, mediante el acceso **Segmentos de estudio** y la pestaña
**Estudio**. Ambos llevan al mismo ejercicio. El índice se encuentra en
[Segmentos de estudio](https://entre-cuerdas-archivo.rchorda.chatgpt.site/#estudio).
Cada ejercicio ofrece PDF, escucha con claqueta, vídeos al tempo preparado y
descargas. El catálogo incorpora los segmentos declarados en
`<obra>/estudio/segments.json`; al crear o modificar un ejercicio, actualiza su
manifiesto antes de importar y publicar el sitio. Las fuentes y los medios
locales siguen siendo los originales del proyecto.

Para actualizar el catálogo a partir de los originales:

```bash
cd sites/entre-cuerdas
python3 scripts/sync-library.py
```

La actualización del catálogo es local. Para que aparezca en la web, pedir a Codex que publique el sitio existente con Sites, conservando su configuración y permisos. Los detalles del flujo y sus comprobaciones están en el README del sitio.

El importador admite las carpetas por obra, busca el audio en su `out/` y
conserva los identificadores de las fichas existentes. La reorganización local
no modifica el catálogo publicado.

## Organización de Git

Se utilizan dos repositorios independientes, cada uno con su remoto `origin`:

| Repositorio | Carpeta local | Rama habitual | Remoto |
| --- | --- | --- | --- |
| Partituras y renderizado | Raíz de ColectivaEMMDZ | `develop` | `git@github.com:rchorda/ColectivaEMMDZ.git` |
| Sitio Entre cuerdas | `sites/entre-cuerdas/` | `main` | Repositorio de código de Sites, vinculado en `.openai/hosting.json` |

La carpeta del sitio está excluida mediante el `.gitignore` del proyecto principal. No es un submódulo y no se añade al índice de ColectivaEMMDZ. Los archivos de las partituras permanecen en el repositorio principal; el sitio conserva una copia preparada para su publicación.

### Trabajo habitual

1. Editar, revisar y guardar las partituras en este proyecto. Crear los commits y enviarlos a `origin/develop` en GitHub.
2. Cuando una edición deba aparecer en la web, actualizar el catálogo dentro de `sites/entre-cuerdas/` y revisar el resultado.
3. Pedir a Codex que sincronice y publique **el sitio existente** con Sites. Ese flujo guarda los cambios en el remoto del sitio y despliega su versión. No crear otro sitio ni cambiar su `project_id`.

Un push a GitHub no publica la web. Publicar la web no guarda los cambios pendientes de las partituras en GitHub. El estado de cada repositorio puede consultarse con `git status` desde su carpeta; las ramas siguen respectivamente a `origin/develop` y `origin/main`.

El remoto de Sites utiliza credenciales temporales obtenidas mediante las herramientas de Sites. La URL de `origin` no contiene credenciales; no guardar tokens en archivos, URLs ni configuración de Git. Para consultar o sincronizar ese remoto desde Codex, pedirle que utilice el acceso de Sites, en lugar de intentar un push sin autenticación.

### Recuperar el sitio en otro equipo

Clonar ColectivaEMMDZ desde GitHub recupera las partituras y los scripts. Para recuperar también la web, abrir en Codex el sitio existente `appgprj_6adb02b2bda081918fa8614d830a1074` y pedir que restaure su repositorio en `sites/entre-cuerdas/`, usando las herramientas de Sites. Son dos recuperaciones independientes; no hace falta registrar un nuevo sitio.

Los directorios temporales, los metadatos de macOS y el MP4 vacío de un render fallido quedan fuera del control de versiones. Las fuentes y los resultados de renderizado útiles mantienen el criterio de archivo que ya utilizaba el proyecto.
