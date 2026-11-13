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

## Biblioteca web: Entre cuerdas

El sitio de partituras se mantiene en un repositorio independiente, situado localmente en `sites/entre-cuerdas/`. Su README contiene el detalle del sitio. Reúne PDF, audio de estudio, fuentes LilyPond e inclusiones, además de un cuaderno de trucos y una guía para seguir editando con Codex y LilyPond Maestro.

Sitio publicado: [Entre cuerdas](https://entre-cuerdas-archivo.leafypixie16384.chatgpt.site). Acceso privado con ChatGPT.

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
