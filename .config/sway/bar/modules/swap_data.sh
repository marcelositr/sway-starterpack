#!/usr/bin/env bash

MODULE_NAME="swap_data"
TEXT=""
COLOR="#FFFFFF"
BG="#0E1A3A"

collect() {
    total=$(awk '/SwapTotal/ {print $2}' /proc/meminfo)
    free=$(awk '/SwapFree/ {print $2}' /proc/meminfo)
    [ "$total" -eq 0 ] && exit 0
    used=$((total-free))
    TEXT=$(awk "BEGIN{printf \"%.1f GiB\",$used/1024/1024}")
}

render() {
cat <<EOF
{"name":"$MODULE_NAME","full_text":"$TEXT  ","background":"$BG","color":"$COLOR"}
EOF
}

collect; render
