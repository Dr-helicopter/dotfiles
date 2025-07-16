#!/usr/bin/env sh

display=eDP-1
#display=HDMI-A-1

mpvpaper $display ~/.config/backgrounds/donut.mp4 -o "--loop --no-audio --vf='pad=1366:786:ow-iw/2:(oh-ih)/2:0x080D10'"
