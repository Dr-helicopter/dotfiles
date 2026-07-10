local toggle_floating_script='~/.config/hypr/scripts/toggle_floating_focus.sh'


local terminal		= "foot"
local menu			= "menu"
local browser 		= "qutebrowser"

local function bind() end
bind = hl.bind

local mainMod = "SUPER + " -- Sets "Windows" key as main modifier


bind("MOD3 + Hyper_L", hl.dsp.exec_cmd(toggle_floating_script), {release= true})

bind(mainMod .. "c", hl.dsp.exec_cmd(terminal))
bind(mainMod .. "q", hl.dsp.window.close())
bind(mainMod .. "space", hl.dsp.exec_cmd(menu))
bind(mainMod .. "b", hl.dsp.exec_cmd(browser))

-- wasd
bind(mainMod .. "a", hl.dsp.focus({ direction = "left" }))
bind(mainMod .. "d", hl.dsp.focus({ direction = "right" }))
bind(mainMod .. "w", hl.dsp.focus({ direction = "up" }))
bind(mainMod .. "s", hl.dsp.focus({ direction = "down" }))

bind(mainMod .. "SHIFT + a", hl.dsp.window.move({ direction = "left" }))
bind(mainMod .. "SHIFT + d", hl.dsp.window.move({ direction = "right" }))
bind(mainMod .. "SHIFT + w", hl.dsp.window.move({ direction = "up" }))
bind(mainMod .. "SHIFT + s", hl.dsp.window.move({ direction = "down" }))

bind(mainMod .. "CTRL + a", hl.dsp.window.resize({ x = -10, y = 0 , relative = true}), { repeating = true})
bind(mainMod .. "CTRL + d", hl.dsp.window.resize({ x = 10 , y = 0 , relative = true}), { repeating = true})
bind(mainMod .. "CTRL + w", hl.dsp.window.resize({ x = 0, y =  10 , relative = true}), { repeating = true})
bind(mainMod .. "CTRL + s", hl.dsp.window.resize({ x = 0, y = -10 , relative = true}), { repeating = true})



bind(mainMod .. "ALT + a", hl.dsp.focus({workspace = "e-1"}))
bind(mainMod .. "ALT + d", hl.dsp.focus({workspace = "e+1"}))


bind(mainMod .. "v", hl.dsp.layout("togglesplit"))    -- dwindle only
bind(mainMod .. "f", hl.dsp.window.float({ action = "toggle" }))
bind(mainMod .. "ALT + f", hl.dsp.window.fullscreen({ action = "toggle" }))

bind(mainMod .. "SHIFT + p", hl.dsp.exec_cmd('screenshot.sh p'))

for i = 1, 9 do
    hl.bind(mainMod .. i, hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. "SHIFT + " .. i,     hl.dsp.window.move({ workspace = i }))
end


hl.bind(mainMod .. "tab",         hl.dsp.workspace.toggle_special("up"))
hl.bind(mainMod .. "SHIFT + tab", hl.dsp.window.move({ workspace = "special:up" }))


hl.bind(mainMod .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. "mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. "mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. "ALT + 1", hl.dsp.exec_cmd("musicman vdown"))
hl.bind(mainMod .. "ALT + 1", hl.dsp.exec_cmd("musicman pause-play"))
hl.bind(mainMod .. "ALT + 3", hl.dsp.exec_cmd("musicman vup"))


hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("musicman-daemon next"),		{ locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("musicman-daemon pause-play"),{ locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("musicman-daemon pause-play"),{ locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("musicman-daemon prev"),		{ locked = true })

