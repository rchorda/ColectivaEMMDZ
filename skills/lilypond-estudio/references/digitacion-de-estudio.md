# Digitación de estudio

Prepara la digitación de violín de **[obra]**, **[parte o voz]**, para **[segmento o lista de segmentos]**. Usa **[partitura original]** como referencia y trabaja en **[copias de estudio]**. Entrega **[formatos y velocidades solicitados]**. Si el encargo ya identifica estos datos, utilízalos directamente.

Lee la clave, la afinación, la armadura vigente en cada punto y las indicaciones de cuerda y posición de la parte. Coteja las cifras con el original antes de añadir marcas. Conserva alturas, ritmo, arcos, articulaciones y numeración.

1. Identifica las cifras originales y deduce cuerda y posición. Respeta las posiciones escritas, identifica dónde aparecen y señala cualquier ambigüedad que afecte a la digitación. Si se piden también cambios de posición, aplica el prompt [Cambios de posición](cambios-de-posicion.md). En primera posición, prefiere la cuerda al aire cuando dé la altura exacta. Usa cuarto bajo cuando corresponda, por ejemplo para mi♭ en la cuerda de la. Desde segunda posición, usa cuerdas al aire solo si están indicadas en la partitura.
2. Marca en verde la cabeza de la primera nota de cada escala, aunque haya una nota de enlace anterior. Su dedo también va en verde salvo cuando tenga prioridad una de las reglas siguientes.
3. **El cambio de cuerda tiene prioridad en el color del número.** En la primera nota sobre la cuerda de llegada, escribe el dedo en azul, incluido el 0 de cuerda al aire. Si esa misma nota lleva alteración, conserva el número azul y añade la flecha roja. Aplica esta regla también a cifras originales, inicios de escala y cruces entre compases. La cifra azul basta para indicar el cruce.
4. Compara la altura con la armadura. Añade ↑ roja si sube un semitono y ↓ roja si baja uno. Una alteración de precaución que confirma la armadura no lleva flecha. Cuando la nota alterada continúa en la misma cuerda, deja negra la cifra original correcta o usa rojo si añades o corriges la cifra. Conserva en negro las demás referencias ordinarias. Si sustituyes un dedo, imprime una sola cifra.
5. Revisa el descenso completo. Si un cruce exige cuarto dedo y otro permite cuerda al aire seguida de un cruce con tercero, ofrece la alternativa viable en esa misma posición. Coloca (4) azul sobre la nota que se tocaría al aire y conserva el 3 azul en la siguiente. El cuarto obligatorio se escribe sin paréntesis.
6. Si se repite una escala con la misma posición y el mismo recorrido de cuerdas, reproduce las referencias de su primera aparición. Distingue las cifras copiadas de las originales al resumir los cambios.
7. Revisa la copia compilada nota a nota. Comprueba el dedo de llegada, el color de cada flecha y la nota que lleva cada alternativa. Si se piden varias velocidades, deriva todas de la misma copia anotada y verifica las marcas en cada formato solicitado, incluida la página visible en los vídeos. Entrega los archivos y resume qué digitaciones proceden del original, cuáles has añadido o corregido y cuáles son opcionales.

## Miniaturas de posición y esquema al pie

En cada nuevo pasaje con digitación de estudio, añade por defecto una
miniatura junto a cada indicación de posición impresa, tanto original como
añadida. Incluye las indicaciones de una digitación alternativa cuando
aparezcan en el pentagrama. Conserva también el esquema detallado al pie, con
un diagrama vertical de cuatro cuerdas por cada posición usada, incluso
si se toca una sola nota o cuerda en ella.

Genera ambos formatos con [`esquema_digitacion.py`](../scripts/esquema_digitacion.py)
a partir de la misma ficha, una vez comprobados el recorrido de la mano y
los cambios de cuerda. Cada fila del esquema equivale a un semitono. El 0
de cuerda al aire se asocia a la posición del tramo en que suena.

Las líneas van en gris oscuro. Todos los nombres de nota comparten tamaño y
negrita. Las notas de la armadura van en negro, las ajenas a la armadura que
se usan van en gris y las ajenas que no se usan van en gris muy claro. Solo
se numeran las digitaciones empleadas. Si una digitación aparece varias veces,
su cifra es azul cuando sirve de llegada a la cuerda en alguna aparición.
En la misma altura pueden coexistir la cifra azul y la flecha roja. El verde
en la cifra indica inicio de escala cuando no prevalece el azul o el rojo.
Cada flecha roja representa un semitono respecto a la armadura.

1. Junto al `.ly`, guarda una ficha `esquema-digitacion.json` con `armadura`
   (0, número positivo de sostenidos o negativo de bemoles), `notas` y, si
   ayuda, un texto breve de `recorrido` por compases. Si cambia la armadura en
   el pasaje, haz una ficha por tramo y reúne sus esquemas en el pie.
2. Registra cada digitación como `[posición, "Cuerda", "NotaOctava", dedo]`,
   con nombres en español y octava científica (Do4 central, cuerdas al aire
   Sol3, Re4, La4 y Mi5).
   Escribe un sostenido con `#` y un bemol con `b`. Tras el dedo añade
   `"cruce"` si alguna aparición llega desde otra cuerda, `"escala"` si
   comienza una escala, `"cifra-original"` si se conserva en negro una cifra
   alterada original, o `"alternativa"` si el número se imprime entre paréntesis.
   Conserva grafía y octava de la partitura y coteja la cuerda. Si se usan dos
   grafías enarmónicas en una misma cuerda y posición, haz diagramas separados
   para mostrar la grafía de cada tramo.
3. Desde la raíz del proyecto, genera las dos inclusiones de LilyPond con Python 3.
   Este ejemplo usa los [datos de Celtic Carol, 64–67](../../../celtic_carol/estudio/c064-c067/esquema-digitacion.json).

   ```bash
   python3 skills/lilypond-estudio/scripts/esquema_digitacion.py \
     celtic_carol/estudio/c064-c067/esquema-digitacion.json \
     celtic_carol/estudio/c064-c067/esquema-digitacion.ily

   python3 skills/lilypond-estudio/scripts/esquema_digitacion.py --miniatura \
     celtic_carol/estudio/c064-c067/esquema-digitacion.json \
     celtic_carol/estudio/c064-c067/miniatura-digitacion.ily
   ```

4. Incluye `esquema-digitacion.ily` y `miniatura-digitacion.ily` al principio
   del `.ly`. Coloca las miniaturas en el pentagrama y añade
   `\markup \esquemaDigitacion` después del último `\score` de impresión.
   Puede sustituir el texto explicativo del pie. Conserva en la fuente los
   comentarios necesarios para documentar claqueta y adaptaciones. Para reunir
   varias inclusiones en un ejercicio, usa un nombre de variable distinto por
   esquema con `--nombre`, por ejemplo `--nombre esquemaTramoFinal`.
5. Si la página es estrecha, prueba `--columnas 2` o `--columnas 1`. Para
   cuatro posiciones en una fila, usa `--columnas 4` y ajusta el pie con
   `\scale` si hace falta. Compila el PDF y comprueba que cada indicación de
   posición tiene su miniatura, que el pie muestra todas las posiciones usadas
   y que las cifras y los colores son legibles. Reutiliza ambas inclusiones
   en las variantes de tempo y comprueba que ambos formatos aparecen en los
   vídeos solicitados. Regenera las dos inclusiones cuando cambien la armadura
   o las digitaciones.

### Miniatura junto al número romano

Tras la nota donde se indica la posición, usa `\miniaturaDigitacionMarcaI`,
`\miniaturaDigitacionMarcaII` o la marca correspondiente. La variable sin
`Marca`, como `\miniaturaDigitacionI`, contiene solo el diagrama y permite
colocarlo junto a una indicación ya compuesta sin duplicar su número romano.

Las cuatro líneas representan Sol, Re, La y Mi de izquierda a derecha.
La distancia vertical entre puntos sigue los semitonos. Los puntos negros
muestran los cuatro apoyos de la armadura por cuerda y, en primera, las
cuerdas al aire propias de la armadura. Los puntos rojos marcan las
alteraciones del pasaje en esa cuerda y posición. Comprueba que la miniatura
y las cifras se leen sin solaparse en la partitura a tamaño real.
