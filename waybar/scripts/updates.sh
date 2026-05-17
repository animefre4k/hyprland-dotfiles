#!/bin/bash

CACHE="/tmp/waybar-updates"

if [[ ! -f "$CACHE" ]] || [[ $(find "$CACHE" -mmin +5) ]]; then
    updates=$(/usr/bin/checkupdates 2>/dev/null | wc -l)
    echo "$updates" > "$CACHE"
else
    updates=$(cat "$CACHE")
fi

if (( updates > 0 )); then
    printf '{"text":"󱧕 %s","class":"updates"}\n' "$updates"
else
    printf '{"text":"󰏗 0","class":"none"}\n'
fi
