# Laboratorio de Ecologia General B-0305 - Ciclo II 2026

Sitio web del curso para materiales de clase, laboratorios y giras.

## Estructura

- `index.qmd` - pagina principal del sitio
- `programa/` - programa y materiales generales del curso
- `lectures/` - clases y presentaciones
- `labs/` - guias de laboratorio, actividades y entregables
- `giras/` - materiales de trabajo de campo

## Edicion y renderizado

```bash
./render.sh
# o
quarto render .
```

Para un render mas rapido sin ejecutar chunks:

```bash
./render.sh --no-execute
```

Los archivos HTML renderizados se escriben en la raiz del repositorio para poder servirlos directamente con GitHub Pages.
