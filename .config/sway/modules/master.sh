#!/bin/bash
# Module Master Script
# Executes all individual swaymsg modules

BASE="$HOME/.config/sway/modules"

echo "== SWAY Version =="
"$BASE/01_version.sh"

echo -e "\n== Outputs =="
"$BASE/02_outputs.sh"

echo -e "\n== Inputs =="
"$BASE/03_inputs.sh"

echo -e "\n== Workspaces =="
"$BASE/04_workspaces.sh"

echo -e "\n== Seats =="
"$BASE/05_seats.sh"

echo -e "\n== Marks =="
"$BASE/06_marks.sh"

echo -e "\n== Binding Modes =="
"$BASE/07_modes.sh"

echo -e "\n== Events (Ctrl+C to stop) =="
"$BASE/08_events.sh"
