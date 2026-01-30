#!/usr/bin/env bash

mem_total=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
mem_avail=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
used=$((mem_total-mem_avail))

ram=$(awk "BEGIN { printf \"%.1f GiB\", $used/1024/1024 }")

echo "{
  \"name\":\"ram\",
  \"full_text\":\"    $ram  \",
  \"background\":\"#bfbaac\",
  \"color\":\"#000000\"
}"
