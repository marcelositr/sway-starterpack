#!/usr/bin/env bash

swap_total=$(awk '/SwapTotal/ {print $2}' /proc/meminfo)
swap_free=$(awk '/SwapFree/ {print $2}' /proc/meminfo)

[ "$swap_total" -eq 0 ] && exit 0

used=$((swap_total-swap_free))
swap=$(awk "BEGIN { printf \"%.1f GiB\", $used/1024/1024 }")

echo "{
  \"name\":\"swap\",
  \"full_text\":\"    $swap  \",
  \"background\":\"#bfbaac\",
  \"color\":\"#000000\"
}"
