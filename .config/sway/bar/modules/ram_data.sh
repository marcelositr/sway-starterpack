#!/usr/bin/env bash

mem_total=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
mem_avail=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
used=$((mem_total-mem_avail))

ram=$(awk "BEGIN { printf \"%.1f GiB\", $used/1024/1024 }")

echo "{
  \"name\":\"ram_data\",
  \"full_text\":\"$ram  \",
  \"background\":\"#0E1A3A\",
  \"color\":\"#FFFFFF\"
}"
