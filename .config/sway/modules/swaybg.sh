#!/usr/bin/env bash
#
# swaybg module
# Responsible only for setting wallpapers
# Safe to be reloaded with exec_always
#

# Kill previous instances
pkill -xu "$USER" swaybg 2>/dev/null

WALLPAPER="$HOME/.local/share/wallpaper/.wallpaper.png"

[ -f "$WALLPAPER" ] || exit 0

exec swaybg \
    -o '*' \
    -i "$WALLPAPER" \
    -m fill
