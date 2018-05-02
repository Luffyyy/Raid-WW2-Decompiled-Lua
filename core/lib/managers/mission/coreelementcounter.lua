-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreElementCounter"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

if not ElementCounter then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementCounter = slot0
ElementCounter.init = function (self, ...)
	slot3 = self

	ElementCounter.super.init(slot2, ...)

	self._digital_gui_units = {}
	self._triggers = {}

	return 
end
ElementCounter.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
ElementCounter.on_script_activated = function (self)
	slot5 = "counter_target"
	self._values.counter_target = self.value(slot3, self)
	self._original_value = self._values.counter_target

	if self._values.output_monitor_id then
	end

	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	if self._values.digital_gui_unit_ids then
		slot3 = self._values.digital_gui_unit_ids

		for _, id in ipairs(slot2) do
			if false then
				slot9 = id
				local unit = managers.editor.unit_with_id(slot7, managers.editor)
				slot10 = unit

				table.insert(managers.editor, self._digital_gui_units)

				slot9 = unit
				slot10 = self._values.counter_target

				unit.digital_gui(managers.editor).number_set(managers.editor, unit.digital_gui(managers.editor))
			else
				slot8 = self._mission_script
				slot9 = id
				slot14 = "_load_unit"
				local unit = self._mission_script.worlddefinition(slot7).get_unit_on_load(slot7, self._mission_script.worlddefinition(slot7), callback(slot11, self, self))

				if unit then
					slot10 = unit

					table.insert(slot8, self._digital_gui_units)

					slot9 = unit
					slot10 = self._values.counter_target

					unit.digital_gui(slot8).number_set(slot8, unit.digital_gui(slot8))
				end
			end
		end
	end

	slot3 = self

	self.monitor_output_change(slot2)

	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
ElementCounter._load_unit = function (self, unit)
	slot5 = unit

	table.insert(slot3, self._digital_gui_units)

	slot4 = unit
	slot5 = self._values.counter_target

	unit.digital_gui(slot3).number_set(slot3, unit.digital_gui(slot3))

	return 
end
ElementCounter.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	if 0 < self._values.counter_target then
		self._values.counter_target = self._values.counter_target - 1
		slot4 = self

		self._update_digital_guis_number(self._values.counter_target - 1)

		slot4 = self

		if self.is_debug(self._values.counter_target - 1) then
			slot5 = "Counter " .. self._editor_name .. ": " .. self._values.counter_target .. " Previous value: " .. self._values.counter_target + 1
			slot11 = 0

			self._mission_script.debug_output(slot3, self._mission_script, Color(": ", 1, 0, 0.75))
		end

		if self._values.counter_target == 0 then
			slot5 = instigator

			ElementCounter.super.on_executed(slot3, self)
		end
	else
		slot4 = self

		if self.is_debug(slot3) then
			slot5 = "Counter " .. self._editor_name .. ": already exhausted!"
			slot11 = 0

			self._mission_script.debug_output(slot3, self._mission_script, Color(": already exhausted!", 1, 0, 0.75))
		end
	end

	slot4 = self

	self.monitor_output_change(slot3)

	return 
end
ElementCounter.reset_counter_target = function (self, counter_target)
	self._values.counter_target = counter_target
	slot4 = self

	self._update_digital_guis_number(slot3)

	slot4 = self

	self.monitor_output_change(slot3)

	return 
end
ElementCounter.counter_operation_add = function (self, amount)
	self._values.counter_target = self._values.counter_target + amount
	slot4 = self

	self._update_digital_guis_number(self._values.counter_target + amount)

	slot5 = "add"

	self._check_triggers(self._values.counter_target + amount, self)

	slot5 = "value"

	self._check_triggers(self._values.counter_target + amount, self)

	slot4 = self

	self.monitor_output_change(self._values.counter_target + amount)

	return 
end
ElementCounter.counter_operation_subtract = function (self, amount)
	self._values.counter_target = self._values.counter_target - amount
	slot4 = self

	self._update_digital_guis_number(self._values.counter_target - amount)

	slot5 = "subtract"

	self._check_triggers(self._values.counter_target - amount, self)

	slot5 = "value"

	self._check_triggers(self._values.counter_target - amount, self)

	slot4 = self

	self.monitor_output_change(self._values.counter_target - amount)

	return 
end
ElementCounter.counter_operation_reset = function (self, amount)
	self._values.counter_target = self._original_value
	slot4 = self

	self._update_digital_guis_number(self._original_value)

	slot5 = "reset"

	self._check_triggers(self._original_value, self)

	slot5 = "value"

	self._check_triggers(self._original_value, self)

	slot4 = self

	self.monitor_output_change(self._original_value)

	return 
end
ElementCounter.counter_operation_set = function (self, amount)
	self._values.counter_target = amount
	slot4 = self

	self._update_digital_guis_number(slot3)

	slot5 = "set"

	self._check_triggers(slot3, self)

	slot5 = "value"

	self._check_triggers(slot3, self)

	slot4 = self

	self.monitor_output_change(slot3)

	return 
end
ElementCounter.apply_job_value = function (self, amount)
	slot4 = amount
	local type = CoreClass.type_name(slot3)

	if type ~= "number" then
		slot6 = "[ElementCounter:apply_job_value] " .. self._id .. "(" .. self._editor_name .. ") Can't apply job value of type " .. type

		Application.error(slot4, Application)

		return 
	end

	slot6 = amount

	self.counter_operation_set(slot4, self)

	return 
end
ElementCounter.add_trigger = function (self, id, type, amount, callback)
	self._triggers[type] = self._triggers[type] or {}
	self._triggers[type][id] = {
		amount = amount,
		callback = callback
	}

	return 
end
ElementCounter.counter_value = function (self)
	return self._values.counter_target
end
ElementCounter._set_counter_value = function (self, counter_value)
	self._values.counter_target = counter_value

	return 
end
ElementCounter._update_digital_guis_number = function (self)
	slot3 = self._digital_gui_units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot8 = unit
			slot10 = true

			unit.digital_gui(slot7).number_set(slot7, unit.digital_gui(slot7), self._values.counter_target)
		end
	end

	return 
end
ElementCounter._check_triggers = function (self, type)
	if not self._triggers[type] then
		return 
	end

	slot4 = self._triggers[type]

	for id, cb_data in pairs(slot3) do
		if type ~= "value" or cb_data.amount == self._values.counter_target then
			cb_data.callback()
		end
	end

	return 
end
ElementCounter.monitor_output_change = function (self)
	if self.monitor_element then
		local output_string = self._values.counter_target
		slot6 = output_string

		self.monitor_element.on_monitored_element(slot3, self.monitor_element, self._editor_name)
	end

	return 
end
ElementCounter.save = function (self, data)
	slot4 = self
	data.counter_value = self.counter_value(slot3)
	data.original_value = self._original_value
	data.enabled = self._values.enabled

	return 
end
ElementCounter.load = function (self, data)
	if data.counter_value then
		slot5 = data.counter_value

		self._set_counter_value(slot3, self)
	end

	self._original_value = data.original_value
	slot5 = data.enabled

	self.set_enabled(slot3, self)

	return 
end

if not ElementCounterReset then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementCounterReset = slot0
ElementCounterReset.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
ElementCounterReset.init = function (self, ...)
	slot3 = self

	ElementCounterReset.super.init(slot2, ...)

	return 
end
ElementCounterReset.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._values.elements

	for _, id in ipairs(slot3) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)

		if element then
			slot10 = self

			if self.is_debug(slot9) then
				slot14 = element
				slot11 = "Counter reset " .. element.editor_name(slot13) .. " to: " .. self._values.counter_target
				slot17 = 0

				self._mission_script.debug_output(slot9, self._mission_script, Color(" to: ", 1, 0, 0.75))
			end

			slot11 = self._values.counter_target

			element.reset_counter_target(slot9, element)
		end
	end

	slot5 = instigator

	ElementCounterReset.super.on_executed(slot3, self)

	return 
end

if not ElementCounterOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementCounterOperator = slot0
ElementCounterOperator.init = function (self, ...)
	slot3 = self

	ElementCounterOperator.super.init(slot2, ...)

	return 
end
ElementCounterOperator.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
ElementCounterOperator.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = "amount"
	local amount = self.value(slot3, self)
	slot5 = self._values.elements

	for _, id in ipairs(self) do
		slot11 = id
		local element = self.get_mission_element(slot9, self)

		if element then
			slot11 = element

			if not element.counter_value(slot10) then
				slot14 = element
				slot13 = amount

				_G.debug_pause(slot10, "[ElementCounterOperator:on_executed] Counter operator called on element without value!", element.editor_name(slot13))
			end

			if self._values.operation == "add" then
				slot12 = amount

				element.counter_operation_add(slot10, element)
			elseif self._values.operation == "subtract" then
				slot12 = amount

				element.counter_operation_subtract(slot10, element)
			elseif self._values.operation == "reset" then
				slot12 = amount

				element.counter_operation_reset(slot10, element)
			elseif self._values.operation == "set" then
				slot12 = amount

				element.counter_operation_set(slot10, element)
			end
		end
	end

	slot6 = instigator

	ElementCounterOperator.super.on_executed(slot4, self)

	return 
end

if not ElementCounterTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementCounterTrigger = slot0
ElementCounterTrigger.init = function (self, ...)
	slot3 = self

	ElementCounterTrigger.super.init(slot2, ...)

	return 
end
ElementCounterTrigger.on_script_activated = function (self)
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self._values.elements

		for _, id in ipairs(slot2) do
			slot9 = id
			local element = self.get_mission_element(slot7, self)
			slot12 = self._values.amount
			slot17 = "on_executed"

			element.add_trigger(self, element, self._id, self._values.trigger_type, callback(slot14, self, self))
		end
	end

	return 
end
ElementCounterTrigger.client_on_executed = function (self, ...)
	return 
end
ElementCounterTrigger.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementCounterTrigger.super.on_executed(slot3, self)

	return 
end

if not ElementCounterFilter then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementCounterFilter = slot0
ElementCounterFilter.init = function (self, ...)
	slot3 = self

	ElementCounterFilter.super.init(slot2, ...)

	return 
end
ElementCounterFilter.on_script_activated = function (self)
	return 
end
ElementCounterFilter.client_on_executed = function (self, ...)
	return 
end
ElementCounterFilter.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self

	if not self._values_ok(slot3) then
		return 
	end

	slot5 = instigator

	ElementCounterFilter.super.on_executed(slot3, self)

	return 
end
ElementCounterFilter._values_ok = function (self)
	if self._values.check_type == "counters_equal" then
		slot3 = self

		return self._all_counter_values_equal(slot2)
	end

	if self._values.check_type == "counters_not_equal" then
		slot3 = self

		return not self._all_counter_values_equal(slot2)
	end

	if self._values.needed_to_execute == "all" then
		slot3 = self

		return self._all_counters_ok(slot2)
	end

	if self._values.needed_to_execute == "any" then
		slot3 = self

		return self._any_counters_ok(slot2)
	end

	return 
end
ElementCounterFilter._all_counter_values_equal = function (self)
	local test_value = nil
	slot4 = self._values.elements

	for _, id in ipairs(slot3) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)

		if not test_value then
			slot10 = element
			test_value = element.counter_value(slot9)
		end

		slot10 = element

		if test_value ~= element.counter_value(slot9) then
			return false
		end
	end

	return true
end
ElementCounterFilter._all_counters_ok = function (self)
	slot3 = self._values.elements

	for _, id in ipairs(slot2) do
		slot8 = self
		slot12 = id

		if not self._check_type(slot7, self.get_mission_element(slot10, self)) then
			return false
		end
	end

	return true
end
ElementCounterFilter._any_counters_ok = function (self)
	slot3 = self._values.elements

	for _, id in ipairs(slot2) do
		slot8 = self
		slot12 = id

		if self._check_type(slot7, self.get_mission_element(slot10, self)) then
			return true
		end
	end

	return false
end
ElementCounterFilter._check_type = function (self, element)
	if not self._values.check_type or self._values.check_type == "equal" then
		slot4 = element

		return element.counter_value(slot3) == self._values.value
	end

	if self._values.check_type == "less_or_equal" then
		slot4 = element

		return element.counter_value(slot3) <= self._values.value
	end

	if self._values.check_type == "greater_or_equal" then
		slot4 = element

		return self._values.value <= element.counter_value(slot3)
	end

	if self._values.check_type == "less_than" then
		slot4 = element

		return element.counter_value(slot3) < self._values.value
	end

	if self._values.check_type == "greater_than" then
		slot4 = element

		return self._values.value < element.counter_value(slot3)
	end

	return 
end

return 
