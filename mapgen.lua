-- Set the 3D noise parameters for the terrain.
local np_terrain = {
	offset = 0,
	scale = 1,
	spread = {x = 200, y = 20, z = 200},
	seed = 123456,
	octaves = 3,
	persist = 0.6,
}


-- memory optimization stuff
local nobj_terrain = nil
local nvals_terrain = {}
local data = {}

local function rand(tbl)
	return tbl[math.random(1,#tbl)]
end

minetest.register_on_generated(function(minp, maxp, seed)
	
	if minp.y < warzone.y_start or maxp.y > warzone.y_start+warzone.y_height then
		return
	end
	
	local sidelen = maxp.x - minp.x + 1
	local dims3d = {x = sidelen, y = sidelen, z = sidelen}
	
	
	nobj_terrain = nobj_terrain or
		minetest.get_perlin_map(np_terrain, dims3d)
	nvals_terrain = nobj_terrain:get_3d_map_flat(minp)

	
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	
	local area = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
	
	vm:get_data(data)
	
	-- make asteroids
	local ni = 1
	for z = minp.z, maxp.z do
	for y = minp.y, maxp.y do
		
		local vi = area:index(minp.x, y, z)
		for x = minp.x, maxp.x do
			local density_noise = nvals_terrain[ni]
			if density_noise > 1.76 then
				data[vi] = minetest.get_content_id("moreores:mineral_mithril")
			elseif density_noise > 1.72 then
				local ores = {"moreores:mineral_silver","default:stone_with_diamond","default:stone_with_gold","default:stone_with_mese","default:stone_with_tin"}
				data[vi] = minetest.get_content_id(rand(ores))
			elseif density_noise > 1.61 then
				local ores = {"default:stone_with_copper","default:stone_with_iron","technic:mineral_uranium","technic:mineral_lead","technic:mineral_zinc","technic:mineral_chromium"}
				data[vi] = minetest.get_content_id(rand(ores))
			elseif density_noise > 1.51 then
				data[vi] = minetest.get_content_id(rand({"default:ice","technic:mineral_sulfur"}))
			elseif density_noise > 1.41 then
				data[vi] = minetest.get_content_id("mapgen_stone")
			end
			
			-- increment
			ni = ni + 1
			vi = vi + 1
		end
	end
	end
	-- set the thingy
	vm:set_data(data)
	
	-- fix our mess
	vm:calc_lighting()
	vm:write_to_map()
	vm:update_liquids()
end)

-- ships
-- TODO: make this work
local function register_deco(schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 8,
		place_on = "vacuum:vacuum",
		fill_ratio = 10,
		y_min = warzone.y_start,
		y_max = warzone.y_start+warzone.y_height,
		schematic = schem,
		flags = "place_center_x, place_center_y, place_center_z",
		rotation = "random",
		flags = {"force_placement"},
	})
end
register_deco("lostscout.mts")
register_deco("fighter.mts")
register_deco("cargomaze.mts")