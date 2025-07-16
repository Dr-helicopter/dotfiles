#!/bin/bash

hyprctl dispatch togglespecialworkspace > /dev/null  # Ensure it's created

# Listen to new windows
socat - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | \
while read -r line; do
    if [[ "$line" == *"openwindow"* ]]; then
        # Get window ID of last created window
        win=$(hyprctl activewindow -j | jq -r '.address')
        ws=$(hyprctl activewindow -j | jq -r '.workspace.name')

        if [[ "$ws" == "special" ]]; then
            hyprctl dispatch togglefloating "$win"
        fi
    fi
done

