warzone = {
	-- starting height
	y_start = tonumber(minetest.settings:get("warzone.y_start")) or 17000,

	-- end height
	y_height = tonumber(minetest.settings:get("warzone.y_height")) or 1000, -- 18000
	
	translator = minetest.get_translator("warzone")
}

local MP = minetest.get_modpath("warzone")
dofile(MP.."/skybox.lua")
dofile(MP.."/nodes.lua")
dofile(MP.."/protector.lua")
dofile(MP.."/mapgen.lua")

print("[OK] warzone (start: " .. warzone.y_start .. ", height:" .. warzone.y_height .. ")")
