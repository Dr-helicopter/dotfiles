if status is-interactive
	abbr -a dr2 /mnt/drive2
	abbr -a cd.. cd ..
	abbr -a gh.getTOKEN set TOKEN $(gh auth token)
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


set -Ux MANPAGER 'nvim +Man!'
