#!/usr/bin/env bash

MODULE_NAME="net_data"
TEXT=""
COLOR="#FFFFFF"
BG="#0E1A3A"

collect() {
    iface=$(ip route | awk '/default/{print $5;exit}')
    [ -z "$iface" ] && exit 0
    state=$(cat /sys/class/net/$iface/operstate)

    if [ "$state" != "up" ]; then
        TEXT="down"
        COLOR="#FF3B3B"
    else
        TEXT="up"
    fi
}

render() {
cat <<EOF
{"name":"$MODULE_NAME","full_text":"$TEXT  ","background":"$BG","color":"$COLOR"}
EOF
}

collect; render
