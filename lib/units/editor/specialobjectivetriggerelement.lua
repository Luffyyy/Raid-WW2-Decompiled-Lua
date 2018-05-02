if not SpecialObjectiveTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

SpecialObjectiveTriggerUnitElement = slot0
SpecialObjectiveTriggerUnitElement.init = function (self, unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._options = {
		"anim_act_01",
		"anim_act_02",
		"anim_act_03",
		"anim_act_04",
		"anim_act_05",
		"anim_act_06",
		"anim_act_07",
		"anim_act_08",
		"anim_act_09",
		"anim_act_10",
		"administered",
		"admin_fail",
		"anim_start",
		"complete",
		"fail"
	}
	self._hed.event = self._options[1]
	self._hed.elements = {}
	slot5 = "event"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
SpecialObjectiveTriggerUnitElement.draw_links = function (self, t, dt, selected_unit, all_units)
	slot10 = selected_unit

	MissionElement.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.75,
				b = 0,
				r = 0,
				from_unit = unit,
				to_unit = self._unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
SpecialObjectiveTriggerUnitElement.update_editing = function (self)
	return 
end
SpecialObjectiveTriggerUnitElement.add_element = function (self)
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot4 = self
		slot7 = ray.unit
		slot7 = ray.unit.name(slot6)

		if self._correct_unit(slot3, ray.unit.name(slot6).s(slot6)) then
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
	end

	return 
end
SpecialObjectiveTriggerUnitElement._correct_unit = function (self, u_name)
	local names = {
		"point_special_objective",
		"ai_so_group",
		"point_nav_link"
	}
	slot5 = names

	for _, name in ipairs(slot4) do
		slot13 = true

		if string.find(slot9, u_name, name, 1) then
			return true
		end
	end

	return false
end
SpecialObjectiveTriggerUnitElement.remove_links = function (self, unit)
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
SpecialObjectiveTriggerUnitElement.add_triggers = function (self, vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
SpecialObjectiveTriggerUnitElement._build_panel = function (self, panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"point_special_objective",
		"ai_so_group"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot11 = "Select an event from the combobox"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "event", self._options)

	return 
end

return 
