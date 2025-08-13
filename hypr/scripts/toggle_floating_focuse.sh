#!/bin/bash

# Get current window and workspace
current_window=$(hyprctl activewindow -j | jq)
current_workspace=$(echo "$current_window" | jq -r '.workspace.id')
current_address=$(echo "$current_window" | jq -r '.address')
current_floating=$(echo "$current_window" | jq -r '.floating')

# Determine target type
target_type="true"
[ "$current_floating" = "true" ] && target_type="false"

# Find all windows on current workspace
windows=$(hyprctl clients -j | jq -c ".[] | select(.workspace.id == $current_workspace and .floating == $target_type)")

# Get the first matching window (not current one)
target_address=$(echo "$windows" | jq -r 'select(.address != "'"$current_address"'") | .address' | head -n 1)

if [ -n "$target_address" ]; then
    hyprctl dispatch focuswindow address:$target_address
fi

