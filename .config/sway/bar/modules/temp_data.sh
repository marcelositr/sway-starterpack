#!/usr/bin/env bash

MODULE_NAME="temp_data"
TEXT=""
COLOR="#FFFFFF"
BG="#0E1A3A"
STATE="ok"

collect() {
    for hw in /sys/class/hwmon/hwmon*; do
        [ -f "$hw/name" ] || continue
        case "$(cat "$hw/name")" in
            coretemp|k10temp)
                max=0
                for t in "$hw"/temp*_input; do
                    v=$(cat "$t")
                    [ "$v" -gt "$max" ] && max="$v"
                done
                temp=$(awk -v t="$max" 'BEGIN{printf "%.1f",t/1000}')
                TEXT="$temp °C"
                awk "BEGIN{exit !($temp >= 75)}" && COLOR="#FF3B3B"
                return
            ;;
        esac
    done
}

render() {
cat <<EOF
{"name":"$MODULE_NAME","full_text":"$TEXT  ","background":"$BG","color":"$COLOR"}
EOF
}

collect; render
