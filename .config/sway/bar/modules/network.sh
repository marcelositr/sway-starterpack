#!/usr/bin/env bash

iface=$(ip route 2>/dev/null | awk '/default/ {print $5}' | head -n1)
[ -z "$iface" ] && exit 0

state=$(cat "/sys/class/net/$iface/operstate" 2>/dev/null)

if [ "$state" != "up" ]; then
  echo "{
    \"name\":\"net\",
    \"full_text\":\"    down  \",
    \"background\":\"#d12f2c\",
    \"color\":\"#ffffff\"
  }"
  exit 0
fi

if [ -d "/sys/class/net/$iface/wireless" ]; then
  ssid=$(iw dev "$iface" link 2>/dev/null | awk -F': ' '/SSID/ {print $2}')
  txt=${ssid:-up}
  icon=""
else
  txt="up"
  icon=""
fi

echo "{
  \"name\":\"net\",
  \"full_text\":\"  $icon  $txt  \",
  \"background\":\"#2587cc\",
  \"color\":\"#ffffff\"
}"
