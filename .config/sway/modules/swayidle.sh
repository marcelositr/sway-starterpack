#!/usr/bin/env bash
#
# swayidle module
# Responsible only for idle / sleep handling
# Locking is delegated to swaylock module
#

LOCK_CMD="$HOME/.config/sway/modules/swaylock.sh"

# Kill any previous swayidle instances (reload-safe)
pkill -xu "$USER" swayidle 2>/dev/null

swayidle -w \
    timeout 300 "$LOCK_CMD" \
    timeout 600 'swaymsg "output * power off"' \
    resume 'swaymsg "output * power on"' \
    before-sleep "$LOCK_CMD"
