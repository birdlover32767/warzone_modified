local has_skybox_mod = minetest.get_modpath("skybox")

local min_y = warzone.y_start
local max_y = warzone.y_start + warzone.y_height

if has_skybox_mod then
	skybox.register({
		-- http://www.custommapmakers.org/skyboxes.php
		name = "warzone",
		miny = min_y,
		maxy = max_y,
		always_day = true,
		fly = true,
		message = "You are now entering a warzone, protections won't work here!",
		textures = {
			"warzone_up.png^[transformR270",
			"warzone_dn.png^[transformR90",
			"warzone_ft.png",
			"warzone_bk.png",
			"warzone_lf.png",
			"warzone_rt.png"
		}
	})

end
