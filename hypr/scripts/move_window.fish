#!/usr/bin/env fish

set -l floating $(hyprctl activewindow -j | jq '.floating')
set -l direction $argv[1]
set -l x $argv[2]
set -l y $argv[3]
		
if $floating
	hyprctl dispatch moveactive $x $y
else 
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
end
