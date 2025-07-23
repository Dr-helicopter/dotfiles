#!/usr/bin/env sh

[ -f "$HOME/.config/.device_specifics/.localrc" ] && source "$HOME/.config/.device_specifics/.localrc"

mpvpaper $MONITORNAME ~/.config/backgrounds/donut.mp4 -o "--loop --no-audio --vf='pad=1366:786:ow-iw/2:(oh-ih)/2:0x080D10'"
