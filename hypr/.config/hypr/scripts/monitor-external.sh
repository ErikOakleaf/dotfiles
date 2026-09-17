#!/bin/bash

LAPTOP="eDP-1"

monitors=$(hyprctl monitors all -j)
external=$(echo "$monitors" | jq -r '.[] | select(.name != "'"$LAPTOP"'" and .name != "FALLBACK") | .name' | head -1)

if [ -z "$external" ]; then
    notify-send "No external monitor" "No external monitor detected."
    exit 0
fi
echo $external

hyprctl eval "hl.monitor({ output = '$external', mode = 'preferred', position = 'auto', scale = 1, disabled = false })"

workspaces=$(hyprctl workspaces -j | jq -r '.[].id')
for ws in $workspaces; do
    hyprctl eval "hl.dispatch(hl.dsp.workspace.move({ workspace = $ws, monitor = '$external' }))"
done

hyprctl eval "hl.monitor({ output = '$LAPTOP', disabled = true })"
