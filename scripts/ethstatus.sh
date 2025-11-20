#!/bin/sh
if ip a show ens33 2>/dev/null | grep -q 'inet '; then
    /usr/bin/ip a show ens33 | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1
else
    echo "Disconnected"
fi
