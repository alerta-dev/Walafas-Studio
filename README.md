# Creador de Walfas — recreación web
Subir la carpeta completa a GitHub/Netlify (sitio estático, sin build; directorio de publicación = raíz).
Local: `python3 -m http.server`. Activa gzip/brotli (Netlify lo hace solo).

- `index.html` App · `data.json` partes, presets, fondos, objetos · `fonts.json` fuentes originales como vectores
- `parts/*.svg` assets vectoriales · `sounds/` audio original · `docs/` ActionScript descompilado · `tools/` scripts SWF->SVG/JSON

Funciones: editor de personajes (DNA compatible 3.39), fondos, objetos, globos de texto, imágenes propias,
adjuntar elementos a un personaje, capas (ocultar, borrar, subir/bajar, arrastrar, renombrar), lienzo de tamaño libre, PNG transparente hasta ×4.
