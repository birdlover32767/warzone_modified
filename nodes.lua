local S = warzone.translator

--[[ special protection block for the stash (SCRAPPED)
for _, state in pairs({"flowing", "source"}) do
	minetest.register_node("warzone:radioactive_"..state, {
		description = state == "source" and S("Radioactive Protection Source") or S("Flowing Radioactive Protection"),
		drawtype = (state == "source" and "liquid" or "flowingliquid"),
		tiles = {{
			name = "technic_corium_"..state.."_animated.png^[colorizehsl:-50",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		}},
		special_tiles = {
			{
				name = "technic_corium_"..state.."_animated.png^[colorizehsl:-50",
				backface_culling = false,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 3.0,
				},
			},
			{
				name = "technic_corium_"..state.."_animated.png^[colorizehsl:-50",
				backface_culling = true,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 3.0,
				},
			},
		},
		paramtype = "light",
		paramtype2 = (state == "flowing" and "flowingliquid" or nil),
		light_source = (state == "source" and 8 or 5),
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		drop = "",
		drowning = 2,
		liquidtype = state,
		liquid_alternative_flowing = "warzone:radioactive_flowing",
		liquid_alternative_source = "warzone:radioactive_source",
		liquid_viscosity = 7,
		liquid_renewable = false,
		damage_per_second = 8,
		post_effect_color = {a=192, r=160, g=80, b=160},
		is_ground_content = state == "flowing",
		groups = {
			liquid = 2,
			hot = 3,
			igniter = (griefing and 1 or 0),
			radioactive = (state == "source" and 16 or 12),
			not_in_creative_inventory = (state == "flowing" and 1 or nil),
		},
	})
end
]]--
