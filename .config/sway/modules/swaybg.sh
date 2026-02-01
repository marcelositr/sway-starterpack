#!/usr/bin/env bash
# swaybg module
# Responsible only for setting wallpapers
# Reload-safe

set -euo pipefail

# =========================
# CONFIG
# =========================
WALLPAPER="$HOME/.local/share/wallpaper/.wallpaper.png"

# =========================
# PRE-CHECK
# =========================
[ -f "$WALLPAPER" ] || exit 0

# =========================
# EXECUTION
# =========================
pkill -xu "$USER" swaybg 2>/dev/null || true

exec swaybg \
    -o '*' \
    -i "$WALLPAPER" \
    -m fill
