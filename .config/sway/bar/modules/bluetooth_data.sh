#!/usr/bin/env bash

MODULE_NAME="bt_data"
TEXT=""
COLOR="#FFFFFF"
BG="#0E1A3A"

collect() {
    powered=$(bluetoothctl show 2>/dev/null | awk '/Powered/{print $2}')
    if [ "$powered" != "yes" ]; then
        TEXT="off"
        COLOR="#FF3B3B"
    else
        TEXT="on"
    fi
}

render() {
cat <<EOF
{"name":"$MODULE_NAME","full_text":"$TEXT  ","background":"$BG","color":"$COLOR"}
EOF
}

collect; render
