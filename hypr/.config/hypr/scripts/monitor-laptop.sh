#!/bin/bash

LAPTOP="eDP-1"

monitors=$(hyprctl monitors all -j)
externals=$(echo "$monitors" | jq -r '.[] | select(.name != "'"$LAPTOP"'" and .name != "FALLBACK") | .name')

hyprctl eval "hl.monitor({ output = '$LAPTOP', mode = 'preferred', position = 'auto', scale = 1, disabled = false })"

workspaces=$(hyprctl workspaces -j | jq -r '.[].id')
for ws in $workspaces; do
    hyprctl eval "hl.dispatch(hl.dsp.workspace.move({ workspace = $ws, monitor = '$LAPTOP' }))"
done

for mon in $externals; do
    hyprctl eval "hl.monitor({ output = '$mon', disabled = true })"
done
