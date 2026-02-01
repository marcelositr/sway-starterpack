#!/usr/bin/env bash

for hw in /sys/class/hwmon/hwmon*; do
  [ -f "$hw/name" ] || continue
  name=$(cat "$hw/name")

  case "$name" in
    coretemp|k10temp)
      max=0
      for t in "$hw"/temp*_input; do
        [ -f "$t" ] || continue
        v=$(cat "$t")
        [ "$v" -gt "$max" ] && max="$v"
      done

      [ "$max" -gt 0 ] || exit 0

      temp=$(awk -v t="$max" 'BEGIN { printf "%.1f", t/1000 }')
      color="#FFFFFF"
      awk "BEGIN{exit !($temp >= 75)}" && color="#FF3B3B"

      echo "{
        \"name\":\"temp_data\",
        \"full_text\":\"${temp} °C  \",
        \"background\":\"#0E1A3A\",
        \"color\":\"$color\"
      }"
      exit 0
    ;;
  esac
done
