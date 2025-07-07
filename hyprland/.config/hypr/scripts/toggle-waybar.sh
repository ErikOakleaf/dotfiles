#!/bin/bash

# check if waybar is running
if pgrep -x "waybar" > /dev/null; then
    pkill waybar
    hyprctl keyword general:gaps_out 20
else
    waybar &
    hyprctl keyword general:gaps_out 5, 20, 20, 20
fi
