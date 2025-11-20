#!/bin/bash

# CPU usage (promedio)
cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print int(usage)}')

# RAM usage (en GB)
mem_info=$(free -m | awk '/Mem:/ {printf "%.1f", $3/1024}')

# Íconos
icon_cpu=" -"
icon_ram="  -"

# Salida final para Polybar
echo "$icon_cpu ${cpu_usage}%  $icon_ram ${mem_info}G "
