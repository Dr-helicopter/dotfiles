local hl = hl

local terminal		= "foot"
local menu			= "dwl_menu"
local browser 		= "qutebrowser"


local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + c", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + q", hl.dsp.window.close())
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd(browser))

-- wasd
hl.bind(mainMod .. " + a",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + d", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + w",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + s",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + v", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + f", hl.dsp.window.float({ action = "toggle" }))


for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. i,     hl.dsp.window.move({ workspace = i }))
end


hl.bind(mainMod .. " + tab",         hl.dsp.workspace.toggle_special("up"))
hl.bind(mainMod .. " + SHIFT + tab", hl.dsp.window.move({ workspace = "special:up" }))


hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


