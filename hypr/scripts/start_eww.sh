#!/bin/bash
DEVICE=$(cat ~/.config/.device_specifics/type)


if [ "$DEVICE" = "L" ]; then
    eww open bar_1_bat
else
	eww open bar_1
fi
