#!/usr/bin/env bash

MODULE_NAME="disk_home_data"
TEXT=""
COLOR="#FFFFFF"
BG="#0E1A3A"

collect() {
    TEXT=$(df -h "$HOME" | awk 'NR==2{print $3}')
}

render() {
cat <<EOF
{"name":"$MODULE_NAME","full_text":"$TEXT  ","background":"$BG","color":"$COLOR"}
EOF
}

collect; render
