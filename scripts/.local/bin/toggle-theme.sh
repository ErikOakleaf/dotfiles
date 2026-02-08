#!/usr/bin/env bash

STATE_FILE="$HOME/.config/dark-mode"

if [[ -f "$STATE_FILE" ]]; then
    rm "$STATE_FILE"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
else
    touch "$STATE_FILE"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi
