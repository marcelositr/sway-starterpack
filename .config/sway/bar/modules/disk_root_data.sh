#!/usr/bin/env bash

MODULE_NAME="disk_root_data"
TEXT=""
COLOR="#FFFFFF"
BG="#0E1A3A"

collect() {
    TEXT=$(df -h / | awk 'NR==2{print $3}')
}

render() {
cat <<EOF
{"name":"$MODULE_NAME","full_text":"$TEXT  ","background":"$BG","color":"$COLOR"}
EOF
}

collect; render
