# Notación y revisión de LilyPond

- Conserva la versión, el idioma, las octavas, las voces y la instrumentación
  de la fuente existente. En fuentes nuevas del proyecto usa
  `\language "espanol"` y preferentemente `\absolute` con octavas explícitas.
- Verifica primero las alturas, alteraciones y figuras. Después coteja las
  ligaduras, arcos, digitaciones, articulaciones, dinámicas y anotaciones.
  Comprueba la duración de cada voz y las ligaduras y reguladores que
  atraviesen los límites del pasaje.
- Distingue lo que se ve en la fuente de las decisiones de interpretación.
  Localiza las dudas por compás, posición y voz. Conserva las decisiones
  confirmadas por el usuario al cotejar una fuente nueva.
- Compila con LilyPond, revisa los avisos e inspecciona el PDF. Coteja el
  resultado con la foto o la fuente musical para verificar la lectura.

LilyPond Maestro (notación española) puede complementar estos criterios si el
complemento está disponible. Para dudas de sintaxis, consulta el manual de la
versión de LilyPond que se esté usando.
