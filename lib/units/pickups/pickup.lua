-- Decompilation Error: _glue_flows(node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
Pickup = Pickup or class()
Pickup.init = function (self, unit)
	slot4 = Network

	if not Network.is_server(slot3) then
		slot4 = unit

		if unit.slot(slot3) == 23 then
			slot5 = 20

			unit.set_slot(slot3, unit)
		end
	end

	self._unit = unit
	self._active = true

	return 
end
local ids_mat_effect = Idstring(function (self, unit)
	slot4 = Network

	if not Network.is_server(slot3) then
		slot4 = unit

		if unit.slot(slot3) == 23 then
			slot5 = 20

			unit.set_slot(slot3, unit)
		end
	end

	self._unit = unit
	self._active = true

	return 
end)
slot3 = "uv0_offset"
local ids_uv0_offset = Idstring("mat_effect")
Pickup._randomize_glow_effect = function (self)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot4 = ids_mat_effect
	local material = self._unit.material(slot2, self._unit)

	if material then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-18, warpins: 1 ---
		slot5 = ids_uv0_offset
		slot10 = 0

		material.set_variable(slot3, material, Vector3(slot7, 0, math.random()))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
Pickup.sync_pickup = function (self)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = self

	self.consume(slot2)

	return 
	--- END OF BLOCK #0 ---



end
Pickup._pickup = function (self)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot4 = "Pickup didn't have a _pickup() function!"

	Application.error(slot2, Application)

	return 
	--- END OF BLOCK #0 ---



end
Pickup.pickup = function (self, unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not self._active then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return 
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-8, warpins: 2 ---
	slot5 = unit

	return self._pickup(slot3, self)
	--- END OF BLOCK #1 ---



end
Pickup.consume = function (self)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = self

	self.delete_unit(slot2)

	return 
	--- END OF BLOCK #0 ---



end
Pickup.set_active = function (self, active)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	self._active = active

	return 
	--- END OF BLOCK #0 ---



end
Pickup.delete_unit = function (self)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot4 = self._unit

	World.delete_unit(slot2, World)

	return 
	--- END OF BLOCK #0 ---



end
Pickup.save = function (self, data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	local state = {}
	state.active = self._active
	data.Pickup = state

	return 
	--- END OF BLOCK #0 ---



end
Pickup.load = function (self, data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	local state = data.Pickup

	if state then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot6 = state.active

		self.set_active(slot4, self)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
Pickup.sync_net_event = function (self, event, peer)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return 
	--- END OF BLOCK #0 ---



end
Pickup.destroy = function (self, unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return 
	--- END OF BLOCK #0 ---



end
Pickup.get_pickup_type = function (self)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return nil
	--- END OF BLOCK #0 ---



end

return 
