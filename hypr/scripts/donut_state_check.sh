#!/usr/bin/env bash

sleep 10 
state=$(cat ~/.local/state/donut/state)
if [ "$state" = "on" ]; then
	~/scripts/donut_control.sh r
else
	~/scripts/donut_control.sh S
fi
