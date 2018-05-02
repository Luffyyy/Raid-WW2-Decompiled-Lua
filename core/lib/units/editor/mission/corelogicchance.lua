if not CoreLogicChanceUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreLogicChanceUnitElement = slot0

if not LogicChanceUnitElement then
	slot2 = CoreLogicChanceUnitElement
	slot0 = class(slot1)
end

LogicChanceUnitElement = slot0
LogicChanceUnitElement.init = function (self, ...)
	slot3 = self

	CoreLogicChanceUnitElement.init(slot2, ...)

	return 
end
CoreLogicChanceUnitElement.init = function (self, unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.chance = 100
	self._hed.output_monitor_id = nil
	slot5 = "output_monitor_id"

	table.insert(nil, self._save_values)

	slot5 = "chance"

	table.insert(nil, self._save_values)

	return 
end
CoreLogicChanceUnitElement._build_panel = function (self, panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Specifies chance that this element will call its on executed elements (in percent)"

	self._build_value_number(slot4, self, panel, panel_sizer, "chance", {
		min = 0,
		floats = 0,
		max = 100
	})

	return 
end
CoreLogicChanceUnitElement.register_debug_output_unit = function (self, output_monitor_id)
	self._hed.output_monitor_id = output_monitor_id

	return 
end
CoreLogicChanceUnitElement.unregister_debug_output_unit = function (self)
	self._hed.output_monitor_id = nil

	return 
end

if not CoreLogicChanceOperatorUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreLogicChanceOperatorUnitElement = slot0

if not LogicChanceOperatorUnitElement then
	slot2 = CoreLogicChanceOperatorUnitElement
	slot0 = class(slot1)
end

LogicChanceOperatorUnitElement = slot0
LogicChanceOperatorUnitElement.init = function (self, ...)
	slot3 = self

	LogicChanceOperatorUnitElement.super.init(slot2, ...)

	return 
end
CoreLogicChanceOperatorUnitElement.init = function (self, unit)
	slot5 = unit

	CoreLogicChanceOperatorUnitElement.super.init(slot3, self)

	self._hed.operation = "none"
	self._hed.chance = 0
	self._hed.elements = {}
	slot5 = "operation"

	table.insert(, self._save_values)

	slot5 = "chance"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
CoreLogicChanceOperatorUnitElement.draw_links = function (self, t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreLogicChanceOperatorUnitElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.75,
				b = 0.25,
				r = 0.75,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
CoreLogicChanceOperatorUnitElement.get_links_to_unit = function (self, ...)
	slot3 = self

	CoreLogicChanceOperatorUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "operator"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
CoreLogicChanceOperatorUnitElement.update_editing = function (self)
	return 
end
CoreLogicChanceOperatorUnitElement.add_element = function (self)
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = "core/units/mission_elements/logic_chance/logic_chance"

		if ray.unit.name(slot3) == Idstring(ray.unit) then
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
CoreLogicChanceOperatorUnitElement.remove_links = function (self, unit)
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
CoreLogicChanceOperatorUnitElement.add_triggers = function (self, vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
CoreLogicChanceOperatorUnitElement._build_panel = function (self, panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"logic_chance/logic_chance"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot11 = "Select an operation for the selected elements"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "operation", {
		"none",
		"add_chance",
		"subtract_chance",
		"reset",
		"set_chance"
	})

	slot11 = "Amount of chance to add, subtract or set to the logic chance elements."

	self._build_value_number(slot5, self, panel, panel_sizer, "chance", {
		min = 0,
		floats = 0,
		max = 100
	})

	slot7 = "This element can modify logic_chance element. Select logic chance elements to modify using insert and clicking on the elements."

	self._add_help_text(slot5, self)

	return 
end

if not CoreLogicChanceTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreLogicChanceTriggerUnitElement = slot0

if not LogicChanceTriggerUnitElement then
	slot2 = CoreLogicChanceTriggerUnitElement
	slot0 = class(slot1)
end

LogicChanceTriggerUnitElement = slot0
LogicChanceTriggerUnitElement.init = function (self, ...)
	slot3 = self

	LogicChanceTriggerUnitElement.super.init(slot2, ...)

	return 
end
CoreLogicChanceTriggerUnitElement.init = function (self, unit)
	slot5 = unit

	CoreLogicChanceTriggerUnitElement.super.init(slot3, self)

	self._hed.outcome = "fail"
	self._hed.elements = {}
	slot5 = "outcome"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
CoreLogicChanceTriggerUnitElement.draw_links = function (self, t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreLogicChanceTriggerUnitElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.85,
				b = 0.25,
				r = 0.85,
				from_unit = unit,
				to_unit = self._unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
CoreLogicChanceTriggerUnitElement.get_links_to_unit = function (self, ...)
	slot3 = self

	CoreLogicChanceTriggerUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "trigger"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
CoreLogicChanceTriggerUnitElement.update_editing = function (self)
	return 
end
CoreLogicChanceTriggerUnitElement.add_element = function (self)
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = "core/units/mission_elements/logic_chance/logic_chance"

		if ray.unit.name(slot3) == Idstring(ray.unit) then
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
CoreLogicChanceTriggerUnitElement.remove_links = function (self, unit)
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
CoreLogicChanceTriggerUnitElement.add_triggers = function (self, vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
CoreLogicChanceTriggerUnitElement._build_panel = function (self, panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"logic_chance/logic_chance"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot11 = "Select an outcome to trigger on"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "outcome", {
		"fail",
		"success"
	})

	slot7 = "This element is a trigger to logic_chance element."

	self._add_help_text(slot5, self)

	return 
end

return 
