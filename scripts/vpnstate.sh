#!/bin/sh

if ip a show tun0 2>/dev/null | grep -q 'inet '; then
    /usr/bin/ip a show tun0 | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1
else
    echo "Disconnected"
fi
