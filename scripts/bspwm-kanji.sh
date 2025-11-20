#!/bin/bash
# Kanji de los 10 workspaces
workspaces=("火" "水" "風" "山" "月" "花" "龍" "雲" "鬼" "心")
sep="%{F#FFFFFF} • %{F-}"

# Colores
color_active="#F37F97"   # rojo
color_occupied="#79E6F3" # cyan
color_empty="#FFFFFF"    # blanco

# Nombre del workspace activo
current=$(bspc query -D -d focused --names)
# Todos los nombres de los desktops en orden
desktops=($(bspc query -D --names))

for i in "${!workspaces[@]}"; do
    ws=${workspaces[$i]}
    desk=${desktops[$i]}

    # Verifica si hay ventanas abiertas
    num_windows=$(bspc query -N -d "$desk" -n .window | wc -l)

    if [[ "$desk" == "$current" ]]; then
        echo -n "%{F$color_active}$ws"
    elif [[ "$num_windows" -gt 0 ]]; then
        echo -n "%{F$color_occupied}$ws"
    else
        echo -n "%{F$color_empty}$ws"
    fi

    # Agrega el separador solo si no es el último
    if [[ $i -lt $((${#workspaces[@]} - 1)) ]]; then
        echo -n "$sep"
    fi
done

# Resetea color al final
echo "%{F-}"
