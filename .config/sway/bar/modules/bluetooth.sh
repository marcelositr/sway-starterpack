#!/usr/bin/env bash

powered=$(bluetoothctl show 2>/dev/null | awk '/Powered/ {print $2}')

if [ "$powered" != "yes" ]; then
  echo "{
    \"name\":\"bt\",
    \"full_text\":\"    off  \",
    \"background\":\"#d12f2c\",
    \"color\":\"#ffffff\"
  }"
  exit 0
fi

name=$(bluetoothctl info 2>/dev/null | awk -F': ' '/Name/ {print $2; exit}')

if [ -n "$name" ]; then
  txt="$name"
else
  txt="on"
fi

echo "{
  \"name\":\"bt\",
  \"full_text\":\"    $txt  \",
  \"background\":\"#2587cc\",
  \"color\":\"#ffffff\"
}"
