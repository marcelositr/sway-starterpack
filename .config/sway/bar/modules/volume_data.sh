#!/usr/bin/env bash

MODULE_NAME="vol_data"
TEXT=""
COLOR="#FFFFFF"
BG="#0E1A3A"

collect() {
    if pactl get-sink-mute @DEFAULT_SINK@ | grep -q yes; then
        TEXT="MUTE"
        COLOR="#FF3B3B"
    else
        TEXT=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5;exit}')
    fi
}

render() {
cat <<EOF
{"name":"$MODULE_NAME","full_text":"$TEXT  ","background":"$BG","color":"$COLOR"}
EOF
}

collect; render
