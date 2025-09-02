#!/usr/bin/env bash

if pgrep -x rofi >/dev/null; then
    pkill -x rofi
else
    ~/.config/rofi/launchers/type-4/launcher.sh
fi

