# ColectivaEMMDZ

## Renderizado

Los comandos de renderizado comparten la biblioteca `render_lib.sh`.

Uso directo:

```bash
./render_wav.sh pieza.ly out
./render_mp4.sh pieza.ly out
./render_mp4.sh pieza.ly out "" 20,40
```

Uso como biblioteca desde otro script:

```bash
source ./render_lib.sh

render_wav "pieza.ly" "out"
render_mp4 "pieza.ly" "out" "$RENDER_DEFAULT_SF2" "20,40"
```

Funciones principales:

- `render_wav <archivo.ly|archivo.mid|archivo.midi> [outdir] [sf2_path]`
- `render_mp4 <archivo.ly|archivo.pdf> [outdir] [sf2_path] [T]`

## Biblioteca web: Entre cuerdas

El sitio de partituras se mantiene en un repositorio independiente, situado localmente en `sites/entre-cuerdas/`. Su README contiene el detalle del sitio. Reúne PDF, audio de estudio, fuentes LilyPond e inclusiones, además de un cuaderno de trucos y una guía para seguir editando con Codex y LilyPond Maestro.

Sitio publicado: [Entre cuerdas](https://entre-cuerdas-archivo.leafypixie16384.chatgpt.site). Acceso privado con ChatGPT.

Para actualizar el catálogo a partir de los originales:

```bash
cd sites/entre-cuerdas
python3 scripts/sync-library.py
```

La actualización del catálogo es local. Para que aparezca en la web, pedir a Codex que publique el sitio existente con Sites, conservando su configuración y permisos. Los detalles del flujo y sus comprobaciones están en el README del sitio.

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
