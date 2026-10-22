# L08: archivos para imprimir

Esta carpeta no se renderiza en el sitio. Los PDF se generan a partir de
`labs/L08-random-effects.pdf` con `split.sh`; no editar los PDF directamente.

```bash
quarto render labs/L08-random-effects.qmd --to pdf
bash labs/L08-print/split.sh
```

## Cantidades para 10 grupos de 4

| Archivo | Contenido | Copias | Para |
|---|---|---|---|
| `01-intro-y-referencia.pdf` | Introducción, actividad, sintaxis, tabla fijo/aleatorio (2 págs.) | 10 | Un juego por grupo |
| `02-caso-1-anidado.pdf` | Caso 1 | 3 | Estaciones |
| `03-caso-2-repetidas.pdf` | Caso 2 | 3 | Estaciones |
| `04-caso-3-bloques.pdf` | Caso 3 | 3 | Estaciones |
| `05-caso-4-sitio.pdf` | Caso 4 | 3 | Estaciones |
| `06-hoja-de-trabajo.pdf` | Tabla y pregunta de discusión | 10 | Un juego por grupo |
| `07-bitacora-lote.pdf` | Caso de bitácora individual | 40 | Uno por estudiante |

Total: 20 + 12 + 10 + 40 = 82 hojas.

Si la paginación del PDF cambia (por ejemplo, un caso pasa a dos páginas),
`split.sh` se detiene y hay que ajustar los rangos.
