#!/usr/bin/env bash
# Uso: ./sesion.sh "qué hice" "tiempo"
set -e
cd "$(dirname "$0")"

if [ $# -lt 2 ]; then
  echo 'Uso: ./sesion.sh "qué hice" "1h"'
  exit 1
fi

fecha=$(date +%F)

# Asegura que el archivo termina en salto de línea antes de añadir la fila
[ -n "$(tail -c1 PROGRESO.md)" ] && echo >> PROGRESO.md

echo "| $fecha | $1 | $2 |" >> PROGRESO.md
git add PROGRESO.md
git commit -m "Sesión $fecha: $1"
git push
echo "✅ Sesión registrada y subida a GitHub"