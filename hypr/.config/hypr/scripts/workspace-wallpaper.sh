#!/usr/bin/env bash

STATE_FILE="$HOME/.config/dark-mode"
LOG_FILE="$HOME/.config/hypr/scripts/wallpaper.log"

# Clear old log
echo "=== Script started at $(date) ===" > "$LOG_FILE"

# Function to get wallpapers based on current theme
get_wallpapers() {
    if [[ -f "$STATE_FILE" ]]; then
        # Dark mode
        WP1="$HOME/.config/backgrounds/a_white_lines_on_a_black_background.jpeg"
        WP3="$HOME/.config/backgrounds/a_mountain_with_a_lake_in_the_background.jpg"
        echo "Dark mode: WP1=$WP1, WP3=$WP3" >> "$LOG_FILE"
    else
        # Light mode
        WP1="$HOME/.config/backgrounds/wallhaven-1.png"
        WP3="$HOME/.config/backgrounds/wallhaven-3.png"
        echo "Light mode: WP1=$WP1, WP3=$WP3" >> "$LOG_FILE"
    fi
}

# Initialize wallpapers
get_wallpapers

current_wp=""

set_wallpaper() {
    local wp=$1
    if [[ "$current_wp" != "$wp" ]]; then
        echo "Setting wallpaper to: $wp" >> "$LOG_FILE"
        hyprctl hyprpaper wallpaper ",$wp" >> "$LOG_FILE" 2>&1
        current_wp="$wp"
    fi
}

# Set initial wallpaper based on current workspace
ws=$(hyprctl activeworkspace -j | jq -r '.id')
echo "Initial workspace: $ws" >> "$LOG_FILE"

if [[ "$ws" == "1" || "$ws" == "2" ]]; then
    set_wallpaper "$WP1"
else
    set_wallpaper "$WP3"
fi

echo "Starting socat listener..." >> "$LOG_FILE"

# Listen for workspace changes
socat - UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock 2>> "$LOG_FILE" | \
while read -r event; do
    echo "Event received: $event" >> "$LOG_FILE"
    
    if [[ "$event" =~ "workspace" ]]; then
        ws=$(hyprctl activeworkspace -j | jq -r '.id')
        echo "Workspace changed to: $ws" >> "$LOG_FILE"
        
        if [[ "$ws" == "1" || "$ws" == "2" ]]; then
            set_wallpaper "$WP1"
        else
            set_wallpaper "$WP3"
        fi
    fi
done

echo "!!! Script exited at $(date) !!!" >> "$LOG_FILE"
