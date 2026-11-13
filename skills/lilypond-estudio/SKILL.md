---
name: lilypond-estudio
description: "Prepara segmentos de estudio de partituras LilyPond con LilyPond Maestro, claqueta de entrada y salidas PDF, WAV y MP4. Úsala para extraer compases, preparar pasajes de práctica o regenerar sus materiales en ColectivaEMMDZ y proyectos con un flujo equivalente."
---

# LilyPond: segmentos de estudio

## Maestro y alcance

Antes del trabajo musical, localiza en el catálogo de skills de la sesión
`gpt-671cf660e9c93379cc42aa9401c9e676:instructions`, del complemento
**LilyPond Maestro (notación española)**. Lee su `SKILL.md` y aplica sus
instrucciones de notación y revisión. Usa la ubicación vigente del catálogo;
no fijes una versión ni una ruta de caché en esta skill. Maestro aporta
instrucciones: no supongas una API de compilación ni un segundo agente.
Si no está disponible, indica esa limitación y continúa con las fuentes locales
y la documentación oficial de LilyPond, sin afirmar que has usado Maestro.

Esta skill añade el flujo de estudio al trabajo musical de Maestro. Conserva
la versión y el idioma del original; en este proyecto es habitual
`\language "espanol"`. Si la petición es explorar una idea, revisa y explica;
si pide generar el segmento, produce los archivos solicitados y compruébalos.
Crear esta skill no equivale a haber implementado un extractor universal.

## Fuente y selección

- Localiza la raíz del proyecto y lee su README y las instrucciones aplicables.
  En ColectivaEMMDZ reutiliza `render_lib.sh`, `render_wav.sh` y `render_mp4.sh`.
- Inspecciona el `.ly`, sus inclusiones y las voces de tempo/MIDI. La selección
  se refiere a la numeración musical, no a líneas ni a posiciones de texto.
- Respeta los límites indicados. La convención de este flujo es `[inicio, fin)`:
  52–60 excluye el 60 y contiene 52–59; un compás 52 equivale a `[52,53)`.
  Si se solicitan límites inclusivos, conviértelos expresamente. Si una petición
  ambigua cambia el contenido musical, aclara solo ese límite.
- Por defecto conserva las voces de la partitura seleccionada y un intervalo
  continuo. Varios intervalos generan ejercicios separados, salvo que se pida
  concatenarlos. Identifica partes y variantes antes de elegir una fuente.
- Si se pide una entrada anacrúsica anterior al intervalo, registra por separado
  el intervalo principal y esas notas previas. Para preparar el pasaje, usa
  preferentemente la métrica y el tempo de destino en la claqueta. Conserva
  los tiempos reales de las notas previas: si deben reescribirse sus valores
  para expresarlos al nuevo tempo, documenta esa adaptación y verifícala en
  segundos. En Celtic Carol, dos corcheas a negra con puntillo = 120 equivalen
  a dos semicorcheas a negra con puntillo = 60. Si se pide practicar el cambio
  de tempo original, conserva la notación y transición originales. El compás
  de preparación puede incluir las notas previas al final; no añadas otro
  compás de espera salvo que se solicite.

## Construir el ejercicio

1. Recupera clave, armadura, compás, tempo con su unidad de pulso, dinámica,
   instrumento MIDI y técnicas vigentes al inicio. Conserva digitaciones,
   articulaciones, arcos, alteraciones y voces simultáneas del pasaje.
2. Usa una extracción consciente de la estructura musical. No dividas un
   LilyPond arbitrario por `|`, comentarios de compás o líneas: silencios
   múltiples, repeticiones, tuplets y voces simultáneas rompen ese criterio.
   Para un caso acotado se admite una copia controlada cotejada con la fuente;
   no la describas como extracción automática ni sincronización permanente.
   Con `\relative`, resuelve y verifica las octavas al comenzar el recorte.
3. Revisa ambos extremos: ligaduras que entran o salen, anacrusas, reguladores,
   pedales, trinos y otros signos abiertos. Cierra lo necesario para un
   ejercicio independiente y registra la adaptación; no inventes una dinámica
   final como si estuviera escrita en el original. No importes notas del
   compás excluido. Revisa también silencios o tempos auxiliares que podrían
   alargar el MIDI fuera del segmento.
4. Añade un compás previo de claqueta, rotulado «Entrada», sin numerarlo como
   parte de la obra. Conserva la numeración original desde la primera nota.
   Si incluye una entrada tomada de la obra, identifica su origen en el título
   o una nota y aclara cualquier reescritura proporcional; mantén el número
   del primer compás principal.
   Por defecto la claqueta suena solo en la entrada. Elige pulsos/subdivisiones
   según la métrica y el pasaje; permite cambiarlos. Para 6/8, dos pulsos de
   negra con puntillo o seis corcheas con acento en 1 y 4 son opciones distintas.
5. Mantén el tempo original salvo petición de otra velocidad. Expresa siempre
   la unidad: negra = 60 y negra con puntillo = 60 no son equivalentes.
   Por defecto usa una pasada; para repeticiones escritas y saltos, define
   explícitamente cómo se recorrerá el fragmento antes de renderizar.
6. Guarda bajo `<obra>/estudio/cNNN-cMMM/`, donde NNN y MMM son el primer y
   último compás realmente incluidos. Conserva `.ly`, PDF y MIDI junto a la
   fuente del ejercicio; guarda WAV, MP4 y auxiliares en `out/`.
   Si hay variantes de parte o tempo, distingue sus nombres para no
   sobrescribirlas. No alteres la obra original para construir un ejercicio.

Cuando haya entrada anacrúsica, el nombre sigue identificando el intervalo
principal; el título y los comentarios declaran además las notas previas.

Registra en comentarios del `.ly` la fuente relativa, el intervalo exclusivo,
la parte, tempo/unidad, claqueta, adaptaciones de extremos y cómo regenerar.
Si la extracción depende de copiar notas, señala que regenerar los medios
no actualiza automáticamente el fragmento cuando cambia la obra. Crea un
helper reutilizable solo cuando el alcance y la estructura lo permitan.

## PDF, WAV y MP4

Lee [references/renderizado.md](references/renderizado.md) cuando vayas a
generar archivos. Contiene los comandos existentes y las precauciones de
sincronización. PDF, audio y vídeo deben representar la misma entrada y
selección musical. No prometas seguimiento por notas con un vídeo que solo
muestra páginas.

## Comprobación y entrega

- Compila y revisa advertencias, duraciones y la numeración, incluida la
  transición desde la entrada al primer compás seleccionado.
- Renderiza e inspecciona visualmente el PDF: notas, signos, extremos y
  legibilidad. Aplica la skill PDF disponible si corresponde a esta inspección.
- Comprueba en MIDI/WAV el tempo, los límites, la duración y el desplazamiento
  causado por la claqueta. Escucha si tienes reproducción accesible; distingue
  esa comprobación de medir el archivo. Verifica con `ffprobe` las pistas y
  duración del MP4, y revisa un fotograma de cada página relevante.
- Entrega enlaces a los archivos y resume lo comprobado y cualquier limitación.
  Si falta una dependencia, identifica qué salida queda pendiente; no declares
  comprobados resultados no generados. No publiques en Sites por generar un
  ejercicio local.

Para el ejemplo concreto de Celtic Carol lee
[references/celtic-carol.md](references/celtic-carol.md).
