#!/usr/bin/env bash

powered=$(bluetoothctl show 2>/dev/null | awk '/Powered/ {print $2}')

if [ "$powered" != "yes" ]; then
  echo "{
    \"name\":\"bt_data\",
    \"full_text\":\" off  \",
    \"background\":\"#0E1A3A\",
    \"color\":\"#FF3B3B\"
  }"
  exit 0
fi

name=$(bluetoothctl info 2>/dev/null | awk -F': ' '/Name/ {print $2; exit}')
txt=${name:-on}

echo "{
  \"name\":\"bt_data\",
  \"full_text\":\"$txt  \",
  \"background\":\"#0E1A3A\",
  \"color\":\"#FFFFFF\"
}"
