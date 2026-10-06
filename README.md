# Creador de Walfas — recreación web

Subir la carpeta completa a tu hosting (necesita servirse por HTTP; para probar en local: `python3 -m http.server`).
Activa gzip/brotli en el servidor: los SVG comprimen ~10x (20 MB -> ~2 MB). Las bibliotecas se cargan bajo demanda.

- `index.html`   App (HTML+CSS+JS sin dependencias)
- `data.json`    Tablas extraídas del juego: partes, 261 presets, fondos, objetos, matrices de capas
- `parts/*.svg`  Assets vectoriales por categoría (cada frame = una variante)
- `sounds/`      15 sonidos originales
- `docs/`        ActionScript descompilado (referencia para portar el resto)
- `tools/`       Scripts de ingeniería inversa (SWF -> SVG/JSON)
                 Uso: `SWF=juego.swf python3 getas.py && python3 asdec.py act1.bin act1.as && python3 export_parts.py && python3 export_data.py`

DNA compatible con el original: `3.39:Nombre:Escala:hat:head:body:arm:shoe:eye:mouth:item:acc:wing:RRGGBB`
