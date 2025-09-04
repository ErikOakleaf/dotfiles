#!/usr/bin/env bash

WP1="$HOME/.config/backgrounds/wallhaven-1.png"
WP3="$HOME/.config/backgrounds/wallhaven-3.png"

current_wp=""

set_wallpaper() {
    local wp=$1
    if [[ "$current_wp" != "$wp" ]]; then
        hyprctl hyprpaper wallpaper ",$wp"
        current_wp="$wp"
    fi
}

socat - UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock | \
while read -r event; do
    # Filter only workspace events
    if [[ "$event" =~ "workspace" ]]; then
        ws=$(hyprctl activeworkspace -j | jq -r '.id')
        if [[ "$ws" == "1" || "$ws" == "2" ]]; then
            set_wallpaper "$WP1"
        else
            set_wallpaper "$WP3"
        fi
    fi
done

