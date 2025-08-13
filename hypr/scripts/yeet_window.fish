#!/usr/bin/env fish

set -l direction $argv[1]

if test $argv[2] = 'c'
	hyprctl dispatch centerwindow
end

switch $direction
	case 'w'
		hyprctl dispatch movewindow u
	case 'a' 
		hyprctl dispatch movewindow l
	case 's' 
		hyprctl dispatch movewindow d
	case 'd' 
		hyprctl dispatch movewindow r
end

