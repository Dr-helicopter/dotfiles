#!/usr/bin/env fish

set -l direction $argv[1]

set -l amoumt $argv[2]

switch $direction
	case 'w'
		hyprctl dispatch moveactive 0 -$amoumt
		hyprctl dispatch resizeactive 0 $amoumt
	case 'a' 
		hyprctl dispatch moveactive -$amoumt 0
		hyprctl dispatch resizeactive $amoumt 0
	case 's' 
		hyprctl dispatch moveactive 0 $amoumt 
		hyprctl dispatch resizeactive 0 -$amoumt
	case 'd' 
		hyprctl dispatch moveactive $amoumt 0
		hyprctl dispatch resizeactive -$amoumt 0
end

