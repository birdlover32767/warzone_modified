
local min_y = warzone.y_start
local max_y = warzone.y_start + warzone.y_height

local old_is_protected = minetest.is_protected

function minetest.is_protected(pos, digger)
	if pos.y >= min_y and pos.y <= max_y then
		-- no protection in warzone
		return false
	end

	return old_is_protected(pos, digger)
end
