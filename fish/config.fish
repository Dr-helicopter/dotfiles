if status is-interactive
	abbr -a dr2 /mnt/drive2
	abbr -a cd.. cd ..
	abbr -a gh.getTOKEN set TOKEN $(gh auth token)
	abbr -a wifi.scn nmcli device wifi rescan
	abbr -a wifi.cnct nmcli device wifi connect
end



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
	sleep 2 
	nmcli device wifi connect weeeee
end

function wifi.Phon
	nmcli device wifi rescan
	sleep 2 
	nmcli device wifi connect Helic
end


set -Ux MANPAGER 'nvim +Man!'
set -Ux EDITOR 'nvim'
status --is-interactive; and source (pyenv init -|psub)


# set keybindings
source ~/.config/fish/keybindings.fish
