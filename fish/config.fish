function control
    love ~/lua_apps/control_panel
end




function cls
    printf '\033c'
end

function clear
    printf '\033c'
end

function ifconf
	curl ifconfig.co 
end
	

function wifi.Home
	nmcli device wifi rescan
	sleep 3 
	nmcli device wifi connect weeeee
end

function wifi.Phon
	nmcli device wifi rescan
	sleep 3 
	nmcli device wifi connect Helic
end


set -Ux MANPAGER 'nvim +Man!'
set -Ux EDITOR 'nvim'
status --is-interactive; and source (pyenv init -|psub)


# set keybindings
if status is-interactive
	source ~/.config/fish/keybindings.fish
end
