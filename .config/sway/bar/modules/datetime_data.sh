#!/usr/bin/env bash

MODULE_NAME="time_data"
TEXT=""
COLOR="#FFFFFF"
BG="#0E1A3A"

collect() {
    export LC_TIME=pt_BR.UTF-8
    TEXT=$(date '+%d %b %H:%M')
}

render() {
cat <<EOF
{"name":"$MODULE_NAME","full_text":"$TEXT  ","background":"$BG","color":"$COLOR"}
EOF
}

collect; render
