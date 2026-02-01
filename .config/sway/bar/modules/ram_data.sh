#!/usr/bin/env bash

MODULE_NAME="ram_data"
TEXT=""
COLOR="#FFFFFF"
BG="#0E1A3A"

collect() {
    total=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
    avail=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
    used=$((total-avail))
    TEXT=$(awk "BEGIN{printf \"%.1f GiB\",$used/1024/1024}")
}

render() {
cat <<EOF
{"name":"$MODULE_NAME","full_text":"$TEXT  ","background":"$BG","color":"$COLOR"}
EOF
}

collect; render
