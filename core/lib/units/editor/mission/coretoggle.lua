if not CoreToggleUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreToggleUnitElement = slot0
CoreToggleUnitElement.SAVE_UNIT_POSITION = false
CoreToggleUnitElement.SAVE_UNIT_ROTATION = false

if not ToggleUnitElement then
	slot2 = CoreToggleUnitElement
	slot0 = class(slot1)
end

ToggleUnitElement = slot0
ToggleUnitElement.init = function (self, ...)
	slot3 = self

	CoreToggleUnitElement.init(slot2, ...)

	return 
end
CoreToggleUnitElement.init = function (self, unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.toggle = "on"
	self._hed.set_trigger_times = -1
	self._hed.elements = {}
	slot5 = "toggle"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	slot5 = "set_trigger_times"

	table.insert(, self._save_values)

	return 
end
CoreToggleUnitElement.draw_links = function (self, t, dt, selected_unit, all_units)
	slot10 = selected_unit

	MissionElement.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0,
				b = 0,
				r = 0.75,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
CoreToggleUnitElement.get_links_to_unit = function (self, ...)
	slot3 = self

	CoreToggleUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "operator"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
CoreToggleUnitElement.update_editing = function (self)
	return 
end
CoreToggleUnitElement.add_element = function (self)
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		local id = ray.unit.unit_data(slot3).unit_id
		slot6 = id

		if table.contains(ray.unit, self._hed.elements) then
			slot6 = id

			table.delete(slot4, self._hed.elements)
		else
			slot6 = id

			table.insert(slot4, self._hed.elements)
		end
	end

	return 
end
CoreToggleUnitElement.remove_links = function (self, unit)
	slot4 = self._hed.elements

	for _, id in ipairs(slot3) do
		slot9 = unit

		if id == unit.unit_data(slot8).unit_id then
			slot10 = id

			table.delete(slot8, self._hed.elements)
		end
	end

	return 
end
CoreToggleUnitElement.add_triggers = function (self, vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
CoreToggleUnitElement._build_panel = function (self, panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = nil
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot11 = "Select how you want to toggle an element"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "toggle", {
		"on",
		"off",
		"toggle"
	})

	slot11 = "Sets the elements trigger times when toggle on (-1 means do not use)"

	self._build_value_number(slot5, self, panel, panel_sizer, "set_trigger_times", {
		floats = 0,
		min = -1
	})

	return 
end

return 
