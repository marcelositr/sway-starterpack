#!/usr/bin/env bash

iface=$(ip route | awk '/default/ {print $5}' | head -n1)
[ -z "$iface" ] && exit 0

state=$(cat /sys/class/net/$iface/operstate)

if [ "$state" != "up" ]; then
  echo "{
    \"name\":\"net_data\",
    \"full_text\":\" down  \",
    \"background\":\"#0E1A3A\",
    \"color\":\"#FF3B3B\"
  }"
  exit 0
fi

if [ -d "/sys/class/net/$iface/wireless" ]; then
  ssid=$(iw dev "$iface" link | awk -F': ' '/SSID/ {print $2}')
  txt=${ssid:-up}
else
  txt="up"
fi

echo "{
  \"name\":\"net_data\",
  \"full_text\":\"$txt  \",
  \"background\":\"#0E1A3A\",
  \"color\":\"#FFFFFF\"
}"
