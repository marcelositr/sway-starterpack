#!/usr/bin/env bash

if pactl get-sink-mute @DEFAULT_SINK@ | grep -q yes; then
    echo "{
      \"name\":\"vol\",
      \"full_text\":\"    MUTE  \",
      \"background\":\"#d12f2c\",
      \"color\":\"#ffffff\"
    }"
else
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1)
    echo "{
      \"name\":\"vol\",
      \"full_text\":\"    $vol  \",
      \"background\":\"#2587cc\",
      \"color\":\"#ffffff\"
    }"
fi
