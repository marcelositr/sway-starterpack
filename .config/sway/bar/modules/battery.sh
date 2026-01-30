#!/usr/bin/env bash

BAT="/sys/class/power_supply/BAT0"
[ -d "$BAT" ] || exit 0

cap=$(<"$BAT/capacity")
stat=$(<"$BAT/status")

bg="#819400"
[ "$cap" -le 15 ] && bg="#d12f2c"

echo "{
  \"name\":\"bat\",
  \"full_text\":\"    ${cap}%  \",
  \"background\":\"$bg\",
  \"color\":\"#ffffff\"
}"
