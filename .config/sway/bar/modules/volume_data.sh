#!/usr/bin/env bash

if pactl get-sink-mute @DEFAULT_SINK@ | grep -q yes; then
  echo "{
    \"name\":\"vol_data\",
    \"full_text\":\" MUTE  \",
    \"background\":\"#0E1A3A\",
    \"color\":\"#FF3B3B\"
  }"
else
  vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1)
  echo "{
    \"name\":\"vol_data\",
    \"full_text\":\"$vol  \",
    \"background\":\"#0E1A3A\",
    \"color\":\"#FFFFFF\"
  }"
fi
