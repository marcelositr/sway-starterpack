#!/usr/bin/env bash

MODULE_NAME="cpu_data"
TEXT=""
COLOR="#FFFFFF"
BG="#0E1A3A"
STATE="ok"

collect() {
    read _ u n s i w irq sirq _ < /proc/stat
    t1=$((u+n+s+i+w+irq+sirq))
    i1=$((i+w))
    sleep 0.1
    read _ u2 n2 s2 i2 w2 irq2 sirq2 _ < /proc/stat
    t2=$((u2+n2+s2+i2+w2+irq2+sirq2))
    i2=$((i2+w2))

    dt=$((t2-t1))
    di=$((i2-i1))
    usage=$(awk "BEGIN{printf \"%.1f\",100*($dt-$di)/$dt}")

    TEXT="${usage}%"

    awk "BEGIN{exit !($usage >= 85)}" && COLOR="#FF3B3B"
}

render() {
cat <<EOF
{"name":"$MODULE_NAME","full_text":"$TEXT  ","background":"$BG","color":"$COLOR"}
EOF
}

collect; render
