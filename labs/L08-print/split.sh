#!/bin/bash
# Divide labs/L08-random-effects.pdf en las secciones que se imprimen por
# separado. Correr después de renderizar el PDF:
#
#   quarto render labs/L08-random-effects.qmd --to pdf
#   bash labs/L08-print/split.sh
#
# Si cambia la paginación del PDF, ajustar los rangos abajo.

set -euo pipefail

cd "$(dirname "$0")"

src="../L08-random-effects.pdf"
if [[ ! -f "$src" ]]; then
  echo "No se encontró $src. Renderice primero el PDF." >&2
  exit 1
fi

pages=$(pdfinfo "$src" | awk '/^Pages:/ { print $2 }')
if [[ "$pages" -ne 8 ]]; then
  echo "Se esperaban 8 páginas y el PDF tiene $pages. Revise los rangos en este script." >&2
  exit 1
fi

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
pdfseparate "$src" "$tmp/p-%d.pdf"

rm -f ./*.pdf

# Un juego por grupo
pdfunite "$tmp/p-1.pdf" "$tmp/p-2.pdf" 01-intro-y-referencia.pdf
cp "$tmp/p-7.pdf" 06-hoja-de-trabajo.pdf

# Estaciones (3 copias de cada uno)
cp "$tmp/p-3.pdf" 02-caso-1-anidado.pdf
cp "$tmp/p-4.pdf" 03-caso-2-repetidas.pdf
cp "$tmp/p-5.pdf" 04-caso-3-bloques.pdf
cp "$tmp/p-6.pdf" 05-caso-4-sitio.pdf

# Una por estudiante
cp "$tmp/p-8.pdf" 07-bitacora-lote.pdf

echo "Archivos generados en labs/L08-print/:"
ls -1 ./*.pdf
