#!/usr/bin/env bash
set -eu

activewindow=$(hyprctl activewindow | awk -F': ' '/initialTitle:/ { print $2 }')
activewindowclass=$(hyprctl activewindow | awk -F': ' '/initialClass:/ { print $2 }')

telegramclass="org.telegram.desktop"
is_media_viewer_active=$(hyprctl clients -j | jq 'any(.[]; .initialTitle == "Media viewer" and .class == "org.telegram.desktop")')


if [[ $activewindowclass != $telegramclass ]] ; then
	hyprctl dispatch togglespecialworkspace
	exit 0
fi 


if [[ $activewindow != "Media viewer" ]] ; then 
	if $is_media_viewer_active ; then 
		hyprctl dispatch togglespecialworkspace telemedia
	else 
		hyprctl dispatch togglespecialworkspace
	fi
else 
	hyprctl dispatch togglespecialworkspace telemedia
fi
