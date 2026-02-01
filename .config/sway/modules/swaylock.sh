#!/usr/bin/env bash
#
# swaylock module (tema integrado, RGBA ok)
#

LOCK_IMAGE="$HOME/.local/share/wallpaper/.lock.png"

exec swaylock \
  --image "$LOCK_IMAGE" \
  --scaling fill \
  \
  --indicator \
  --indicator-idle-visible \
  --indicator-radius 100 \
  --indicator-thickness 7 \
  \
  --inside-color        0E1A3ACC \
  --inside-clear-color  0E1A3ACC \
  --inside-ver-color    0E1A3ACC \
  --inside-wrong-color  0E1A3ACC \
  --inside-caps-lock-color 0E1A3ACC \
  \
  --ring-color          2F7BFFCC \
  --ring-clear-color    2F7BFFCC \
  --ring-ver-color      2F7BFFCC \
  --ring-wrong-color    FF3B3BCC \
  --ring-caps-lock-color 2F7BFFCC \
  \
  --line-color          00000000 \
  --line-clear-color    00000000 \
  --line-ver-color      00000000 \
  --line-wrong-color    00000000 \
  --line-caps-lock-color 00000000 \
  \
  --key-hl-color        2F7BFF \
  --bs-hl-color         FF3B3B \
  --caps-lock-key-hl-color 2F7BFF \
  --caps-lock-bs-hl-color  FF3B3B \
  \
  --separator-color     00000000 \
  \
  --text-color          EAEFFF \
  --text-clear-color    EAEFFF \
  --text-ver-color      EAEFFF \
  --text-wrong-color    FF3B3B \
  --text-caps-lock-color EAEFFF
