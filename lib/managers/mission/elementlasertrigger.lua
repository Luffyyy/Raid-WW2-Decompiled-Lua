-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementLaserTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementLaserTrigger = slot0
ElementLaserTrigger.COLORS = {
	red = {
		1,
		0,
		0
	},
	green = {
		0,
		1,
		0
	},
	blue = {
		0,
		0,
		1
	},
	grey = {
		0.5,
		0.5,
		0.5
	},
	black = {
		0.1,
		0.1,
		0.1
	}
}
ElementLaserTrigger.init = function (self, ...)
	slot3 = self

	ElementLaserTrigger.super.init(slot2, ...)

	slot3 = Draw
	slot6 = 1
	slot9 = self.COLORS[self._values.color]
	self._brush = Draw.brush(slot2, Color(slot5, unpack(slot8)))
	slot4 = "solid"

	self._brush.set_blend_mode(slot2, self._brush)

	self._last_project_amount_all = 0
	self._inside = {}
	self._connections = {}
	self._is_cycled = self._values.cycle_interval ~= 0
	self._next_cycle_t = 0
	self._cycle_index = 1
	self._cycle_order = {}
	slot4 = "persons"
	self._slotmask = managers.slot.get_mask(slot2, managers.slot)

	if self._values.instigator == "enemies" then
		slot4 = "enemies"
		self._slotmask = managers.slot.get_mask(slot2, managers.slot)
	elseif self._values.instigator == "civilians" then
		slot4 = "civilians"
		self._slotmask = managers.slot.get_mask(slot2, managers.slot)
	elseif self._values.instigator == "loot" then
		slot4 = 14
		self._slotmask = World.make_slot_mask(slot2, World)
	end

	if not self._values.skip_dummies then
		self._dummy_units = {}
		self._dummies_visible = true
		slot3 = self._values.points

		for _, point in pairs(slot2) do
			slot10 = "units/vanilla/props/props_button/props_button"
			slot10 = point.rot
			local unit = safe_spawn_unit(slot7, Idstring(slot9), point.pos)
			slot12 = "material"
			local materials = unit.get_objects_by_type(Idstring(slot9), Idstring(slot11))
			slot10 = materials

			for _, m in ipairs(unit) do
				slot18 = "contour_opacity"
				slot17 = 0

				m.set_variable(slot14, m, Idstring(slot17))
			end

			slot11 = unit

			table.insert(slot9, self._dummy_units)

			slot11 = point.rot
			point.pos = point.pos + point.rot.y(self._dummy_units) * 3
		end
	end

	slot3 = self._values.connections

	for i, connection in ipairs(slot2) do
		slot9 = i

		table.insert(slot7, self._cycle_order)

		slot9 = {
			enabled = not self._is_cycled,
			from = self._values.points[connection.from],
			to = self._values.points[connection.to]
		}

		table.insert(slot7, self._connections)
	end

	if self._values.cycle_random then
		slot3 = self._cycle_order
		local cycle_order = clone(slot2)
		self._cycle_order = {}

		while 0 < #cycle_order do
			slot4 = self._cycle_order
			slot7 = cycle_order
			slot10 = #cycle_order

			table.insert(slot3, table.remove(slot6, math.random(slot9)))
		end
	end

	return 
end
ElementLaserTrigger.on_script_activated = function (self, ...)
	slot3 = self

	ElementLaserTrigger.super.on_script_activated(slot2, ...)

	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	if self._values.enabled then
		slot3 = self

		self.add_callback(slot2)
	end

	return 
end
ElementLaserTrigger.set_enabled = function (self, enabled)
	slot5 = enabled

	ElementLaserTrigger.super.set_enabled(slot3, self)

	if enabled then
		self._delayed_remove = nil
		slot4 = self

		self.add_callback(slot3)
	else
		slot4 = self

		self.remove_callback(slot3)
	end

	return 
end
ElementLaserTrigger.add_callback = function (self)
	if not self._callback then
		if not self._values.visual_only then
			slot8 = "update_laser"
			slot5 = self._values.interval
			self._callback = self._mission_script.add(slot2, self._mission_script, callback(slot5, self, self))
		end

		slot4 = self._id
		slot9 = "update_laser_draw"

		self._mission_script.add_updator(slot2, self._mission_script, callback(slot6, self, self))
	end

	return 
end
ElementLaserTrigger.remove_callback = function (self)
	if self._callback then
		slot4 = self._callback

		self._mission_script.remove(slot2, self._mission_script)

		self._callback = nil
	end

	if self._values.flicker_remove then
		self._delayed_remove = 7
		self._delayed_remove_t = 0
		self._delayed_remove_state_on = true
	else
		slot4 = self._id

		self._mission_script.remove_updator(slot2, self._mission_script)
	end

	return 
end
ElementLaserTrigger.client_on_executed = function (self, ...)
	return 
end
ElementLaserTrigger.on_executed = function (self, instigator, alternative)
	if not self._values.enabled then
		return 
	end

	slot7 = alternative

	ElementLaserTrigger.super.on_executed(slot4, self, instigator)

	if not self._values.enabled then
		slot5 = self

		self.remove_callback(slot4)
	end

	return 
end
ElementLaserTrigger.instigators = function (self)
	slot3 = self

	return ElementAreaTrigger.project_instigators(slot2)
end
ElementLaserTrigger._check_delayed_remove = function (self, t, dt)
	if not self._delayed_remove then
		return false
	end

	if self._delayed_remove_t <= 0 then
		self._delayed_remove_state_on = not self._delayed_remove_state_on
		slot5 = 0.05
		self._delayed_remove_t = 0.05 + math.rand(slot4)
		self._delayed_remove = self._delayed_remove - 1

		if self._delayed_remove <= 0 then
			slot6 = self._id

			self._mission_script.remove_updator(slot4, self._mission_script)
		end
	end

	self._delayed_remove_t = self._delayed_remove_t - dt

	if not self._delayed_remove_state_on then
		return true
	end

	return false
end
ElementLaserTrigger.update_laser_draw = function (self, t, dt)
	if #self._connections == 0 then
		return 
	end

	slot7 = dt

	if self._check_delayed_remove(slot4, self, t) then
		return 
	end

	slot5 = self._connections

	for _, connection in ipairs(slot4) do
		if connection.enabled then
			slot13 = 0.5

			self._brush.cylinder(slot9, self._brush, connection.from.pos, connection.to.pos)
		end
	end

	if self._is_cycled then
		self._next_cycle_t = self._next_cycle_t - dt

		if self._next_cycle_t <= 0 then
			self._next_cycle_t = self._values.cycle_interval
			slot5 = self._connections

			for i, connection in ipairs(slot4) do
				connection.enabled = false
			end

			local index = self._cycle_index - 1

			for j = 1, self._values.cycle_active_amount, 1 do
				index = index + 1

				if #self._cycle_order < index then
					index = 1
				end

				self._connections[self._cycle_order[index]].enabled = true
			end

			self._cycle_index = ((self._values.cycle_type == "pop" and index) or self._cycle_index) + 1

			if #self._cycle_order < self._cycle_index then
				self._cycle_index = 1
			end
		end
	end

	return 
end
ElementLaserTrigger.project_amount_all = function (self)
	slot3 = self

	return ElementAreaTrigger.project_amount_all(slot2)
end
ElementLaserTrigger.update_laser = function (self)
	if not self._values.enabled then
		return 
	end

	slot3 = self
	local instigators = self.instigators(slot2)

	if #instigators == 0 then
		slot4 = Network
	else
		slot4 = instigators

		for _, unit in ipairs(slot3) do
			slot9 = unit

			if alive(slot8) then
				slot9 = Network

				if Network.is_client(slot8) then
					slot10 = unit

					self._client_check_state(slot8, self)
				else
					slot10 = unit

					self._check_state(slot8, self)
				end
			end
		end
	end

	return 
end
ElementLaserTrigger.sync_enter_area = function (self, unit)
	slot5 = unit

	self._add_inside(slot3, self)

	return 
end
ElementLaserTrigger.sync_exit_area = function (self, unit)
	slot5 = unit

	self._remove_inside(slot3, self)

	return 
end
ElementLaserTrigger.sync_while_in_area = function (self, unit)
	slot5 = unit

	self._while_inside(slot3, self)

	return 
end
ElementLaserTrigger._check_state = function (self, unit)
	slot4 = unit

	if alive(slot3) then
		local rule_ok = self._check_instigator_rules(slot3, self)
		local inside = nil
		slot6 = unit
		local mover = unit.mover(unit)

		if mover then
			slot7 = self._connections

			for i, connection in ipairs(slot6) do
				if connection.enabled then
					slot14 = connection.to.pos
					inside = mover.line_intersection(slot11, mover, connection.from.pos)

					if inside then
						break
					end
				end
			end
		else
			local oobb = unit.oobb(slot6)
			slot8 = self._connections

			for i, connection in ipairs(unit) do
				if connection.enabled then
					slot15 = connection.to.pos
					local hit_oobb = oobb.raycast(slot12, oobb, connection.from.pos)

					if hit_oobb then
						slot22 = "report"
						inside = World.raycast(slot13, World, "ray", connection.from.pos, connection.to.pos, "target_unit", unit, "slot_mask", self._slotmask)
					end

					if inside then
						break
					end
				end
			end
		end

		slot8 = unit

		if table.contains(slot6, self._inside) then
			if not inside or not rule_ok then
				slot8 = unit

				self._remove_inside(slot6, self)
			end
		elseif inside and rule_ok then
			slot8 = unit

			self._add_inside(slot6, self)
		end

		if inside and rule_ok then
			slot8 = unit

			self._while_inside(slot6, self)
		end
	end

	slot4 = self
	local project_amount_all = self.project_amount_all(slot3)

	if project_amount_all ~= self._last_project_amount_all then
		self._last_project_amount_all = project_amount_all
		slot5 = self

		self._clean_destroyed_units(slot4)

		return true
	end

	return false
end
ElementLaserTrigger._add_inside = function (self, unit)
	slot5 = unit

	table.insert(slot3, self._inside)

	slot6 = "enter"

	self.on_executed(slot3, self, unit)

	return 
end
ElementLaserTrigger._while_inside = function (self, unit)
	slot6 = "while_inside"

	self.on_executed(slot3, self, unit)

	return 
end
ElementLaserTrigger._remove_inside = function (self, unit)
	slot5 = unit

	table.delete(slot3, self._inside)

	slot6 = "leave"

	self.on_executed(slot3, self, unit)

	if #self._inside == 0 then
		slot6 = "empty"

		self.on_executed(slot3, self, unit)
	end

	return 
end
ElementLaserTrigger._remove_inside_by_index = function (self, index)
	slot5 = index

	table.remove(slot3, self._inside)

	slot6 = "leave"

	self.on_executed(slot3, self, nil)

	if #self._inside == 0 then
		slot6 = "empty"

		self.on_executed(slot3, self, nil)
	end

	return 
end
ElementLaserTrigger._check_instigator_rules = function (self, unit)
	if not self._rules_elements then
		return true
	end

	slot4 = self._rules_elements

	for _, element in ipairs(slot3) do
		slot11 = unit

		if not element.check_rules(slot8, element, self._values.instigator) then
			return false
		end
	end

	return true
end
ElementLaserTrigger._clean_destroyed_units = function (self)
	local i = 1
	slot4 = self._inside

	while next(slot3) and i <= #self._inside do
		slot4 = self._inside[i]

		if alive(slot3) then
			i = i + 1
		else
			slot5 = i

			self._remove_inside_by_index(slot3, self)
		end
	end

	return 
end
ElementLaserTrigger._client_check_state = function (self, unit)
	local rule_ok = self._check_instigator_rules(slot3, self)
	local inside = nil
	slot6 = unit
	local mover = unit.mover(unit)

	if mover then
		slot7 = self._connections

		for i, connection in ipairs(slot6) do
			if connection.enabled then
				slot14 = connection.to.pos
				inside = mover.line_intersection(slot11, mover, connection.from.pos)

				if inside then
					break
				end
			end
		end
	end

	slot8 = unit

	if table.contains(slot6, self._inside) then
		if not inside or not rule_ok then
			slot8 = unit

			table.delete(slot6, self._inside)

			slot7 = managers.network
			slot12 = unit

			managers.network.session(slot6).send_to_host(slot6, managers.network.session(slot6), "to_server_area_event", 2, self._sync_id, self._id)
		end
	elseif inside and rule_ok then
		slot8 = unit

		table.insert(slot6, self._inside)

		slot7 = managers.network
		slot12 = unit

		managers.network.session(slot6).send_to_host(slot6, managers.network.session(slot6), "to_server_area_event", 1, self._sync_id, self._id)
	end

	if inside and rule_ok then
		slot7 = managers.network
		slot12 = unit

		managers.network.session(slot6).send_to_host(slot6, managers.network.session(slot6), "to_server_area_event", 3, self._sync_id, self._id)
	end

	return 
end
ElementLaserTrigger.operation_add = function (self)
	slot4 = true

	self._set_dummies_visible(slot2, self)

	return 
end
ElementLaserTrigger.operation_remove = function (self)
	slot4 = false

	self._set_dummies_visible(slot2, self)

	return 
end
ElementLaserTrigger._set_dummies_visible = function (self, visible)
	if not self._dummy_units then
		return 
	end

	self._dummies_visible = visible
	slot4 = self._dummy_units

	for _, unit in ipairs(slot3) do
		slot10 = self._dummies_visible

		unit.set_enabled(slot8, unit)
	end

	return 
end
ElementLaserTrigger.save = function (self, data)
	data.enabled = self._values.enabled
	data.cycle_order = self._cycle_order
	data.cycle_index = self._cycle_index
	data.next_cycle_t = self._next_cycle_t
	data.dummies_visible = self._dummies_visible

	return 
end
ElementLaserTrigger.load = function (self, data)
	slot5 = data.enabled

	self.set_enabled(slot3, self)

	self._cycle_order = data.cycle_order
	self._cycle_index = data.cycle_index
	self._next_cycle_t = data.next_cycle_t
	slot5 = data.dummies_visible

	self._set_dummies_visible(slot3, self)

	return 
end

return 
