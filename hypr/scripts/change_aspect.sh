#!/usr/bin/env bash


DATA=$(hyprctl activewindow -j)

FLOATING=$(echo "$DATA" | jq -r '.floating')

if [[ $FLOATING == "false" ]] then
	hyprctl dispatch layoutmsg togglesplit
	exit 0
fi

# read array safely
read -r X Y <<<$(echo "$DATA" | jq -r '.size | join(" ")')

hyprctl dispatch resizeactive exact $1 $2


read -r A_X A_Y <<<$(hyprctl activewindow -j | jq -r '.size | join(" ")')

N_X=$(( (X - A_X) / 2 ))
N_Y=$(( (Y - A_Y) / 2 ))

hyprctl dispatch moveactive $N_X $N_Y
