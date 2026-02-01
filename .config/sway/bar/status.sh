#!/usr/bin/env bash
# i3bar JSON protocol – swaybar compatible
# Central brain: the ONLY place allowed to talk to swaymsg

BAR_DIR="$HOME/.config/sway/bar"
MOD_DIR="$BAR_DIR/modules"

DEBUG=${SWAY_STATUS_DEBUG:-0}

echo '{ "version": 1, "click_events": true }'
echo '['

first=1
while :; do
    blocks=()

    # =========================
    # SWAY STATE (single IPC)
    # =========================
    if [ "$DEBUG" -eq 1 ]; then
        SWAY_WORKSPACE=$(swaymsg -t get_workspaces -r \
            | jq -r '.[] | select(.focused==true).name' 2>/dev/null)

        SWAY_MODE=$(swaymsg -t get_binding_state -r 2>/dev/null)
    fi

    # =========================
    # MODULES (dumb sensors)
    # =========================
    for mod in \
      cpu_icon cpu_data \
      temp_icon temp_data \
      ram_icon ram_data \
      swap_icon swap_data \
      disk_root_icon disk_root_data \
      disk_home_icon disk_home_data \
      network_icon network_data \
      bluetooth_icon bluetooth_data \
      volume_icon volume_data \
      datetime_icon datetime_data
    do
        out="$("$MOD_DIR/$mod.sh" 2>/dev/null)"
        [ -n "$out" ] && blocks+=("$out")
    done

    # =========================
    # DEBUG BLOCKS (optional)
    # =========================
    if [ "$DEBUG" -eq 1 ]; then
        blocks+=("{
          \"name\":\"ws_debug\",
          \"full_text\":\"WS:$SWAY_WORKSPACE  \",
          \"background\":\"#16285A\",
          \"color\":\"#EAEFFF\"
        }")

        blocks+=("{
          \"name\":\"mode_debug\",
          \"full_text\":\"MODE:$SWAY_MODE  \",
          \"background\":\"#16285A\",
          \"color\":\"#EAEFFF\"
        }")
    fi

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
