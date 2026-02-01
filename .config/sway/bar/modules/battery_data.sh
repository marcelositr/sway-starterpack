#!/usr/bin/env bash

BAT="/sys/class/power_supply/BAT0"
[ -d "$BAT" ] || exit 0

cap=$(<"$BAT/capacity")
stat=$(<"$BAT/status")

color="#FFFFFF"
[ "$cap" -le 15 ] && color="#16285A"

echo "{
  \"name\":\"bat_data\",
  \"full_text\":\"${cap}%  \",
  \"background\":\"#0E1A3A\",
  \"color\":\"$color\"
}"
