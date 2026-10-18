# Auditoría de Sprite-Studio

Fecha: 18 de octubre de 2026. Revisión del código y comprobaciones de interfaz realizadas con Chromium headless contra el servidor local `127.0.0.1:8765`.

## Resumen

La auditoría encontró y corrigió dos defectos de comportamiento además del error de inicio ya corregido en la pasada anterior. No se detectaron excepciones JavaScript durante las rutas de navegador verificadas. Esto no constituye una prueba de que todos los flujos sean perfectos: la importación de carpetas a través del selector nativo, la extracción del ZIP resultante y los gestos táctiles requieren una comprobación manual adicional en Windows.

| Área | Resultado | Evidencia / alcance |
|---|---|---|
| Inicio y registro de controles | Correcto tras la corrección anterior | La excepción de inicialización por selector de un solo nodo impedía registrar el resto de los eventos. La ruta actual carga y registra los botones. |
| Carga de muestra | Verificado | La muestra carga los 113 cuadros y JSON local. |
| Herramientas y paneles | Verificado parcialmente | Se activaron herramientas de varios grupos, el panel Propiedades y el zoom. Las categorías Canvas, Select, Paint y Shape muestran grupos compactos; los atajos llaman a `setTool`, que actualiza la pestaña activa. Los gestos de dibujo y selección no se reprodujeron mediante arrastre en esta pasada. |
| Texto | Verificado | Se introdujo contenido y se creó una capa de texto en el cuadro de muestra. |
| Capas y máscaras | Revisado en código | La creación de capas, máscara, bloqueo, historial y exportación están conectados. Prueba visual completa pendiente. |
| Animación | Verificado parcialmente | La línea temporal y los selectores de secuencia están conectados; no se validó reproducción sostenida cuadro a cuadro en dispositivo físico. |
| Exportación | Revisado en código; descarga UI pendiente de round-trip | El código genera un ZIP en el navegador. Hace falta abrir el ZIP descargado y comparar su estructura al final de una sesión manual. |
| Compatibilidad | Parcial | Comprobación automatizada en Chromium; no se hizo una matriz de navegadores ni prueba táctil física. |

## Defectos corregidos

### P1 — La vista de onion skin no se actualizaba al alternar

**Ubicación:** `app.js`, conexión de `#onionBtn`. **Impacto:** el botón cambiaba de estado y mostraba un mensaje, pero el lienzo conservaba la imagen anterior hasta el siguiente redibujado. **Corrección:** se llama a `renderCanvas()` al alternar la opción.

### P2 — Borrar una selección rectangular fallaba después de mover una capa

**Ubicación:** `app.js`, `clearSelection()`. **Impacto:** el rectángulo de selección usa coordenadas del cuadro, mientras que los píxeles de una capa desplazada usan coordenadas locales. **Corrección:** se resta el desplazamiento de la capa antes de limpiar el rectángulo. La ruta de borrado de varita ya transformaba sus coordenadas.

### P3 — El navegador solicitaba un favicon inexistente

**Ubicación:** `index.html`. **Impacto:** producía una respuesta 404 de recurso durante el arranque. **Corrección:** se añadió un icono SVG local y una referencia explícita en el documento.

## Comprobaciones realizadas

- `node --check app.js` para detectar errores de sintaxis.
- Inicio en Chromium, carga de muestra, zoom, activación de Text y cambio al panel Propiedades; no se observaron errores JavaScript.
- Creación de texto desde la interfaz con el contenido de prueba «Audit test»; la secuencia de acciones terminó sin error.
- Revisión estática de conexiones de botones, importación, selección, máscaras, edición, transformaciones, animación, historial y exportación.
- Revisión de la muestra: 113 archivos PNG numerados y `palomin_sprites.json`.
- Revisión de todas las herramientas declaradas en HTML frente a las cuatro categorías y los atajos en `setTool`; no se encontraron herramientas fuera de un grupo.
- Escaneo visual Impeccable después de los cambios: no señala texto diminuto ni controles con texto por debajo del umbral de legibilidad. Conserva avisos de estilo: 15 de espaciado compacto, 134 colores, 7 tamaños tipográficos y 15 radios no documentados en el sistema de diseño. Los controles compactos de un editor y la paleta ya usada generan la mayoría de esos avisos; siguen pendientes de normalización si se desea una pasada de consistencia visual.

## Pendiente de verificación manual

1. Abrir la aplicación con `Run Sprite-Studio.bat` en Windows y cargar una carpeta con subcarpetas, varios PNG y su JSON.
2. Dibujar y arrastrar selecciones con ratón; revisar varita, lazo libre, poligonal y magnético sobre varios bordes.
3. Probar borrado y relleno sobre una capa desplazada, máscaras, deshacer/rehacer y exportar; extraer el ZIP y verificar nombres, carpetas y JSON.
4. Reproducir las secuencias Wave y Thinking y comprobar onion skin al avanzar entre cuadros.
5. Repetir en Edge y Chrome, y validar un dispositivo táctil si se necesita compatibilidad móvil.

La última captura automatizada posterior a la agrupación de herramientas no pudo completarse porque el capturador REA agotó el tiempo de limpieza del navegador. Por ese motivo, el comportamiento de las nuevas pestañas se revisó en el código y la estructura HTML; no se presenta como una comprobación interactiva completa.

## Riesgos y alcance

- La interfaz está orientada a escritorio y declara un ancho mínimo cercano a 810 px.
- La limpieza de bordes y la varita trabajan con píxeles RGBA y tolerancias; el resultado depende del arte y requiere revisión visual.
- Cargas de imágenes grandes pueden elevar el consumo de memoria y bloquear brevemente la interfaz mientras se procesan.
