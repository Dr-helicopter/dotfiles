#     __              __    _           ___                 
#    / /_____  __  __/ /_  (_)___  ____/ (_)___  ____ ______
#   / //_/ _ \/ / / / __ \/ / __ \/ __  / / __ \/ __ `/ ___/
#  / ,< /  __/ /_/ / /_/ / / / / / /_/ / / / / / /_/ (__  ) 
# /_/|_|\___/\__, /_.___/_/_/ /_/\__,_/_/_/ /_/\__, /____/  
#           /____/                            /____/


# clear commandline
bind \e 'commandline -r ""'
bind alt-z 'commandline -r ""'

# menu -> '~'
bind \uE014 'commandline -i "~"'
bind \uE013 'commandline -i "~"'

# alt space/e -> enter
bind alt-space execute
bind alt-e execute

# alt x -> delete
bind alt-x backward-delete-char
bind alt-X backward-kill-word

# alt c -> clear screan 
bind alt-c  'cls ; commandline -f repaint ;'

# alt q -> exit
bind alt-q exit

bind alt-r "echo '' ;  ls -C --width=80 ; commandline -f repaint "


#  ___  _            _   _               _    
# |   \(_)_ _ ___ __| |_(_)___ _ _  __ _| |___
# | |) | | '_/ -_) _|  _| / _ \ ' \/ _` | (_-<
# |___/|_|_| \___\__|\__|_\___/_||_\__,_|_/__/
#
bind alt-w up-or-search
bind alt-s down-or-search
bind alt-a backward-char
bind alt-d forward-char

bind alt-A backward-word
bind alt-D forward-word



#         __               __             __      
#   _____/ /_  ____  _____/ /________  __/ /______
#  / ___/ __ \/ __ \/ ___/ __/ ___/ / / / __/ ___/
# (__  ) / / / /_/ / /  / /_/ /__/ /_/ / /_(__  ) 
#/____/_/ /_/\____/_/   \__/\___/\__,_/\__/____/  
#

abbr -a dr2 /mnt/drive2
abbr -a gh.getTOKEN set TOKEN $(gh auth token)
abbr -a wifi.scn nmcli device wifi rescan
abbr -a wifi.cnct nmcli device wifi connect
abbr -a nano nvim
abbr -a car cat

abbr -a cdz cd ..
abbr -a cd.. cd ..
abbr -a ee nvim
abbr -a dd lsd 
abbr -a rr rm -r
abbr -a vv mv
abbr -a ccd mkdir -p

bind ctrl-d 'true'
