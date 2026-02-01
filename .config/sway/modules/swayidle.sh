#!/usr/bin/env bash
# swayidle module
# Idle / power handling
# Lock delegated to swaylock module

set -euo pipefail

# =========================
# CONFIG
# =========================
LOCK_CMD="$HOME/.config/sway/modules/swaylock.sh"

TIME_LOCK=300
TIME_DPMS=600

# =========================
# EXECUTION
# =========================
pkill -xu "$USER" swayidle 2>/dev/null || true

exec swayidle -w \
    timeout "$TIME_LOCK" "$LOCK_CMD" \
    timeout "$TIME_DPMS" 'swaymsg "output * power off"' \
    resume 'swaymsg "output * power on"' \
    before-sleep "$LOCK_CMD"
