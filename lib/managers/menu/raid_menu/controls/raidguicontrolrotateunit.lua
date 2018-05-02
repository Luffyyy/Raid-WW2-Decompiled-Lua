-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlRotateUnit then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlRotateUnit = slot0
RaidGUIControlRotateUnit.init = function (self, parent, params)
	slot7 = params

	RaidGUIControlRotateUnit.super.init(slot4, self, parent)

	self._params.layer = self._params.layer + 1
	slot9 = 1
	slot4 = Color(self, 0.3, 0.3, 0.3)
	self._params.color = slot4
	slot6 = self._params
	self._object = self._panel.panel(slot4, self._panel)
	self._pointer_type = "link"
	slot6 = self

	table.insert(slot4, managers.menu_component._update_components)

	return 
end
RaidGUIControlRotateUnit.set_unit = function (self, unit, position, initial_angle, center_offset, screen_adjust_offset)
	self._unit = unit

	if not unit then
		slot9 = self

		managers.menu_component.removeFromUpdateTable(slot7, managers.menu_component)

		return 
	end

	if not center_offset then
		slot10 = 0
		slot6 = Vector3(slot7, 0, 0)
	end

	self._unit_center_offset = slot6

	if not screen_adjust_offset then
		slot10 = 0
		slot6 = Vector3(slot7, 0, 0)
	end

	self._unit_screen_adjust_offset = slot6
	self._original_position = position
	slot8 = self._unit
	self._original_rotation = self._unit.rotation(slot7)
	slot10 = self._original_rotation

	self._place_unit(slot7, self, position + self._unit_center_offset + self._unit_screen_adjust_offset)

	slot9 = 0

	self._rotate_unit_by(slot7, self)

	return 
end
RaidGUIControlRotateUnit.mouse_moved = function (self, o, x, y)
	slot9 = y

	RaidGUIControlRotateUnit.super.mouse_moved(slot5, self, o, x)

	return 
end
RaidGUIControlRotateUnit.on_mouse_moved = function (self, o, x, y)

	-- Decompilation error in this vicinity:
	if not self._last_x then
		self._last_x = x
		slot6 = self._unit
		slot6 = self._unit.rotation(slot5)
		self._last_sound_click_angle = self._unit.rotation(slot5).yaw(slot5)

		return 
	end

	slot7 = (x - self._last_x) / 4

	self._rotate_unit_by(slot5, self)

	self._last_x = x

	if self._params.sound_click_every_n_degrees then
		slot8 = self._unit
		slot8 = self._unit.rotation(slot7)
		slot6 = self._unit.rotation(slot7).yaw(slot7) - self._last_sound_click_angle

		if self._params.sound_click_every_n_degrees < math.abs(slot5) then
			if not self._params.rotation_click_sound then
				slot9 = self._name
				slot6 = "Rotation click sound not set for rotate unit control " .. tostring(slot8)

				debug_pause(slot5)

				return 
			end

			slot7 = self._params.rotation_click_sound

			managers.menu_component.post_event(slot5, managers.menu_component)

			slot6 = self._unit
			slot6 = self._unit.rotation(slot5)
			self._last_sound_click_angle = self._unit.rotation(slot5).yaw(slot5)
		end
	end

	return 
end
RaidGUIControlRotateUnit._rotate_unit_by = function (self, yaw_delta)
	local rotation = self._unit.rotation(slot3)
	local yaw = rotation.yaw(self._unit)
	local pitch = rotation.pitch(rotation)
	local roll = rotation.roll(rotation)
	yaw = yaw + yaw_delta
	slot10 = roll
	local rot_out = Rotation(rotation, yaw, pitch)
	slot10 = rot_out
	local rotated_offset = self._unit_center_offset.rotate_with(yaw, self._unit_center_offset)
	slot12 = rot_out

	self._place_unit(self._unit_center_offset, self, self._original_position - rotated_offset + self._unit_screen_adjust_offset)

	return 
end
RaidGUIControlRotateUnit.current_position = function (self)

	-- Decompilation error in this vicinity:
	if self._unit then
		slot3 = self._unit

		return self._unit.position(slot2)
	end

	return 
end
RaidGUIControlRotateUnit.current_rotation = function (self)
	if self._unit then
		slot3 = self._unit

		return self._unit.rotation(slot2)
	end

	return 
end
RaidGUIControlRotateUnit.set_position = function (self, position)
	if not self._unit then
		return 
	end

	slot5 = position
	slot8 = self._unit

	self._place_unit(slot3, self, self._unit.rotation(slot7))

	return 
end
RaidGUIControlRotateUnit.set_rotation = function (self, rotation)
	if not self._unit then
		return 
	end

	slot7 = self._unit
	slot6 = rotation

	self._place_unit(slot3, self, self._unit.position(slot6))

	return 
end
RaidGUIControlRotateUnit.update = function (self, t, dt)
	local menu_controller = managers.menu.get_controller(slot4)
	slot6 = managers.menu

	if not managers.menu.is_pc_controller(managers.menu) and menu_controller then
		slot10 = "look"
		slot7 = menu_controller.get_input_axis(slot8, menu_controller).x * 4

		self._rotate_unit_by(slot5, self)
	end

	return 
end
RaidGUIControlRotateUnit._place_unit = function (self, position, rotation)
	slot6 = position

	self._unit.set_position(slot4, self._unit)

	slot6 = rotation

	self._unit.set_rotation(slot4, self._unit)

	slot6 = 2

	self._unit.set_moving(slot4, self._unit)

	return 
end
RaidGUIControlRotateUnit.on_mouse_over = function (self, x, y)
	slot7 = y

	RaidGUIControlRotateUnit.super.on_mouse_over(slot4, self, x)

	if self._params.mouse_over_sound then
		slot6 = self._params.mouse_over_sound

		managers.menu_component.post_event(slot4, managers.menu_component)
	end

	return 
end
RaidGUIControlRotateUnit.on_mouse_out = function (self)
	self._pointer_type = "link"
	self._dragging = false

	return 
end
RaidGUIControlRotateUnit.on_mouse_pressed = function (self)
	slot3 = managers.raid_menu
	self._old_active_control = managers.raid_menu.get_active_control(slot2)
	slot4 = self

	managers.raid_menu.set_active_control(slot2, managers.raid_menu)

	self._dragging = true
	self._last_x = nil
	self._last_sound_click_angle = nil

	if self._params.mouse_click_sound then
		slot4 = self._params.mouse_click_sound

		managers.menu_component.post_event(slot2, managers.menu_component)
	end

	return 
end
RaidGUIControlRotateUnit.on_mouse_released = function (self)
	slot4 = self._old_active_control

	managers.raid_menu.set_active_control(slot2, managers.raid_menu)

	self._dragging = false

	if self._params.mouse_release_sound then
		slot4 = self._params.mouse_release_sound

		managers.menu_component.post_event(slot2, managers.menu_component)
	end

	return 
end

return 
