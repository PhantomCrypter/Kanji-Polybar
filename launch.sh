#!/bin/bash

# Mata cualquier instancia previa de polybar
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

# Lanza las barras en orden
polybar launcher & 
polybar redpriv & 
polybar vpn &
polybar bspwm &
polybar system &
polybar time &
