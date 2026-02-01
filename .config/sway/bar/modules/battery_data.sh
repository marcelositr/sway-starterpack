#!/usr/bin/env bash

MODULE_NAME="bat_data"
TEXT=""
COLOR="#FFFFFF"
BG="#0E1A3A"

BAT="/sys/class/power_supply/BAT0"
[ -d "$BAT" ] || exit 0

collect() {
    cap=$(<"$BAT/capacity")
    TEXT="${cap}%"
    [ "$cap" -le 15 ] && COLOR="#FF3B3B"
}

render() {
cat <<EOF
{"name":"$MODULE_NAME","full_text":"$TEXT  ","background":"$BG","color":"$COLOR"}
EOF
}

collect; render
