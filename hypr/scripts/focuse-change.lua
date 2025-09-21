#!/usr/bin/env lua

-- pre processing
local args = {...}
local dir = args[1]
if dir ~= 'l' and dir ~= 'r' and dir ~= 'u' and dir ~= 'd' then
	os.exit(1)
end

local json = require("dkjson")
local handle = io.popen("hyprctl activewindow -j")
if handle == nil then os.exit(1) end
local current_window = handle:read("*a")
handle:close()


-- run helper
local function run(cmd)
    local h= io.popen(cmd)
    local result = h:read("*a")
    h:close()
    return result
end

local function temp_func(t)
	for i, j in pairs(t) do
		print(i, j)
	end
end


-- if tiled :
current_window = json.decode(current_window)
if not current_window.floating then
	print(run("hyprctl dispatch movefocus " .. dir))
	os.exit(0)
end



-- main thing:
handle = io.popen("hyprctl -j clients")
if handle == nil then os.exit(1) end
local result = handle:read("*a")
handle:close()


local clients = json.decode(result)

-- selecsion
local floaters = {}
for _ , c in ipairs(clients) do
    if c.floating then
    	if c.workspace.id == current_window.workspace.id and c.pid ~= current_window.pid then
    		table.insert(floaters, c)
    	end
	end
end


local function get_center(w) return {w.at[1] + w.size[1]/2, w.at[2] + w.at[2]/2} end

local current_center = get_center(current_window)


-- the final oporation
local function movefocus(id)
	run("hyprctl dispatch focuswindow pid:" .. id)
	run("hyprctl dispatch bringactivetotop")
	os.exit(0)
end

-- if we have co centeed widows this function will discreminate btween them 
-- i do kindda hate how nested it is
local function cocenter_select(centers)
	if dir == 'l' or dir == 'd' then
		table.sort(centers, function(a, b) return a.id > b.id end)
		for _, i in ipairs(centers) do
			if i.id < current_window.pid then movefocus(i.id) end
		end
	else
		table.sort(centers, function(a, b) return a.id < b.id end)
		for _, i in ipairs(centers) do
			if i.id > current_window.pid then movefocus(i.id) end
		end
	end
end


local function spilit_the_screan(windows)
	local first = {}
	local seccond = {}
	local basis
	if dir == 'l' then
		basis = function(a, b) return a.center[1] > b.center[1] end
	elseif dir == 'd' then
		basis = function(a, b) return a.center[2] < b.center[2] end
	elseif dir == 'r' then
		basis = function(a, b) return a.center[1] < b.center[1] end
	else
		basis = function(a, b) return a.center[2] > b.center[2] end
	end

	for _, i in ipairs(windows) do
		if basis({center = current_center}, i) then
			table.insert(first, i)
		else
			table.insert(seccond, i)
		end
	end
	table.sort(first, basis)
	table.sort(seccond, basis)


	return first, seccond
end



if dir == 'l' or dir == 'r' then	-- horizantal movement
	local processed_floaters = {}
	local cocenters = {}
	for _,  i in ipairs(floaters) do
		local element = {}
		element.id = i.pid

		local center = {i.at[1] + i.size[1]/2, i.at[2] + i.at[2]/2}

		if center[1] == current_center[1] and center[2] == current_center[2] then
			table.insert(cocenters, element)
			goto continue -- this helps filer the co centered windows from messing with our main windows
		end
		element.center = center
		element.pos = i.at
		element.size = i.size

		--temp_func(i)
		--temp_func(i.at)
		--temp_func(i.size)
		table.insert(processed_floaters, element)

		::continue:: -- i feel cool!
	end

	if #cocenters then cocenter_select(cocenters) end

	local function direct_cast(windows)
		for _, i in ipairs(windows) do
			if i.pos[2] == current_window.at[2] or
				((current_window.at[2] + current_window.size[2] >= i.pos[2]) and i.pos[2] > current_window.at[2]) then
				movefocus(i.id)
			elseif i.pos[2] < current_window.at[2] then
				if i.pos[2] + i.size[2] > current_window.at[2] then
					movefocus(i.id)
				end
			end
		end
	end

	local f, s = spilit_the_screan(processed_floaters)
	direct_cast(f)
else
	local processed_floaters = {}
	local cocenters = {}
	for _,  i in ipairs(floaters) do
		local element = {}
		element.id = i.pid

		local center = {i.at[1] + i.size[1]/2, i.at[2] + i.at[2]/2}

		if center[1] == current_center[1] and center[2] == current_center[2] then
			table.insert(cocenters, element)
			goto continue
		end
		element.center = center
		element.pos = i.at
		element.size = i.size

		--temp_func(i)
		--temp_func(i.at)
		--temp_func(i.size)
		table.insert(processed_floaters, element)

		::continue:: -- i feel cool!
	end

	if #cocenters then cocenter_select(cocenters) end

	local function direct_cast(windows)
		for _, i in ipairs(windows) do
			if i.pos[1] == current_window.at[1] or
				((current_window.at[1] + current_window.size[1] >= i.pos[1]) and i.pos[1] > current_window.at[2]) then
				movefocus(i.id)
			elseif i.pos[1] < current_window.at[1] then
				if i.pos[1] + i.size[1] > current_window.at[1] then
					movefocus(i.id)
				end
			end
		end
	end

	local f, s = spilit_the_screan(processed_floaters)
	direct_cast(f)

end





