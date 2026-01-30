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

            bg="#bfbaac"
            awk "BEGIN{exit !($temp >= 75)}" && bg="#d12f2c"

            echo "{
              \"name\":\"temp\",
              \"full_text\":\"    ${temp}°C  \",
              \"background\":\"$bg\",
              \"color\":\"#000000\"
            }"
            exit 0
        ;;
    esac
done

exit 0
