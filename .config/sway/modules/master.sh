#!/usr/bin/env bash
# SWAY DEBUG MASTER
# Read-only inspection tool

set -euo pipefail

# =========================
# CONFIG
# =========================
DATE_CMD="date"
JQ_CMD="jq"

# =========================
# HELPERS
# =========================
section() {
    echo
    echo "== $1 =="
}

# =========================
# MAIN
# =========================
echo "===== SWAY DEBUG DUMP ====="
$DATE_CMD

section "Version"
swaymsg -t get_version

section "Outputs"
swaymsg -t get_outputs -r | $JQ_CMD

section "Inputs"
swaymsg -t get_inputs -r | $JQ_CMD

section "Workspaces"
swaymsg -t get_workspaces -r | $JQ_CMD

section "Seats"
swaymsg -t get_seats -r | $JQ_CMD

section "Binding Modes"
swaymsg -t get_binding_state -r

section "Tree (containers/layouts)"
swaymsg -t get_tree -r | $JQ_CMD

echo
echo "== End of dump =="
