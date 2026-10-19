# Walfas Studio — recreación web
Subir la carpeta completa a GitHub/Netlify (sitio estático, sin build; directorio de publicación = raíz).
Local: `python3 -m http.server`. Activa gzip/brotli (Netlify lo hace solo).

- `index.html` App · `data.json` partes, presets, fondos, objetos · `fonts.json` fuentes originales como vectores
- `parts/*.svg` assets vectoriales · `sounds/` audio original · `docs/` ActionScript descompilado · `tools/` scripts SWF->SVG/JSON

Funciones: editor de personajes (DNA compatible 3.39), fondos, objetos, globos de texto, imágenes propias (botón o arrastrar a la escena),
adjuntar objetos/imágenes/globos a un personaje, capas, PNG transparente.

Exportar: «Guardar PNG» (imagen plana) y «Exportar editable» (PSD con una capa por parte, agrupadas por personaje; adjuntos, fondo y globos incluidos). Tamaño del lienzo y resolución configurables.

Discord: el icono junto al título abre la URL de tu servidor. La primera vez te pide la URL (clic derecho o Mayús+clic para cambiarla); se guarda en tu navegador.
Para que **todos** los visitantes vean tu enlace, escríbelo en la constante `DISCORD_URL` al inicio del script de `index.html`.
El icono de Discord está en `icons/discord.png` (se muestra en negro); puedes reemplazarlo por otro PNG o SVG con el mismo nombre (`.png`) o cambiar la ruta en `index.html`.
