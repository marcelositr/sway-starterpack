#!/usr/bin/env bash
#
# swaylock module (vanilla compatible)
#

LOCK_IMAGE="$HOME/.local/share/wallpaper/lock.png"

exec swaylock \
  --image "$LOCK_IMAGE" \
  --scaling fill \
  --indicator-idle-visible \
  --indicator-radius 100 \
  --indicator-thickness 7 \
  --inside-color 00000088 \
  --ring-color ffffff88 \
  --line-color ffffff88 \
  --key-hl-color ffffff \
  --text-color ffffff
