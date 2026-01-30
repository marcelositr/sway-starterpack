#!/usr/bin/env bash
# i3bar JSON protocol – swaybar compatible

BAR_DIR="$HOME/.config/sway/bar"
MOD_DIR="$BAR_DIR/modules"

echo '{ "version": 1, "click_events": true }'
echo '['

first=1
while :; do
    blocks=()

    for mod in \
        cpu temp ram swap disk network bluetooth volume battery datetime
    do
        out="$("$MOD_DIR/$mod.sh" 2>/dev/null)"
        [ -n "$out" ] && blocks+=("$out")
    done

    json=$(printf ',%s' "${blocks[@]}")
    json="[${json:1}]"

    if [ $first -eq 1 ]; then
        echo "$json"
        first=0
    else
        echo ",$json"
    fi

    sleep 1
done

echo ']'
