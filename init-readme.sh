#!/bin/bash

echo "🧾 Generando README.md en carpetas vacías..."

declare -A descriptions=(
  ["backend"]="Contiene el código del servidor en Node.js + Express."
  ["frontend"]="Contiene el código del cliente en React.js."
  ["docs"]="Documentación técnica y decisiones del proyecto."
  ["mockups"]="Imágenes de referencia, wireframes y diseños en Figma."
  ["resources"]="Recursos gráficos como logos, paletas, íconos y fuentes."
  ["scripts"]="Scripts de utilidad como instalación, backups y seeders."
)

for dir in */ ; do
  folder_name=$(basename "$dir")
  readme_path="${dir}README.md"

  if [ -d "$dir" ] && [ -z "$(ls -A "$dir")" ]; then
    echo "# ${folder_name^}" > "$readme_path"
    echo "" >> "$readme_path"

    if [[ ${descriptions[$folder_name]+_} ]]; then
      echo "${descriptions[$folder_name]}" >> "$readme_path"
    else
      echo "Esta carpeta contiene archivos relacionados con $folder_name." >> "$readme_path"
    fi

    echo "📝 README.md creado en $dir"
  else
    echo "🔍 $dir ya tiene contenido. No se modificó."
  fi
done

echo "✅ Listo. Haz commit y push para actualizar el repositorio."
