-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.module(slot1, core)

slot3 = "CoreXml"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

MissionScriptElement = MissionScriptElement or class()
MissionScriptElement.save = function (self, data)
	data.enabled = self._values.enabled

	return 
end
MissionScriptElement.load = function (self, data)
	slot5 = data.enabled

	self.set_enabled(slot3, self)

	return 
end
MissionScriptElement.init = function (self, mission_script, data)
	self._mission_script = mission_script
	self._id = data.id
	self._editor_name = data.editor_name
	self._values = data.values
	slot5 = mission_script
	self._sync_id = mission_script.sync_id(slot4)

	return 
end
MissionScriptElement.on_created = function (self)
	return 
end
MissionScriptElement.on_script_activated = function (self)
	if self._values.rules_elements then
		self._rules_elements = {}
		slot3 = self._values.rules_elements

		for _, id in ipairs(slot2) do
			slot9 = id
			local element = self.get_mission_element(slot7, self)
			slot10 = element

			table.insert(self, self._rules_elements)
		end
	end

	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
MissionScriptElement.get_mission_element = function (self, id)
	slot5 = id

	return self._mission_script.element(slot3, self._mission_script)
end
MissionScriptElement.editor_name = function (self)
	return self._editor_name
end
MissionScriptElement.id = function (self)
	return self._id
end
MissionScriptElement._unique_string_id = function (self)
	return "" .. self._sync_id .. "_" .. self._id
end
MissionScriptElement.values = function (self)
	return self._values
end
MissionScriptElement.value = function (self, name)
	if self._values.instance_name and self._values.instance_var_names and self._values.instance_var_names[name] then
		slot7 = self._values.instance_var_names[name]
		local value = managers.world_instance.get_instance_param(slot3, managers.world_instance, self._sync_id, self._values.instance_name)

		if value then
			return value
		end
	end

	return self._values[name]
end
MissionScriptElement.get_random_table_value = function (self, value)
	slot4 = value

	if tonumber(slot3) then
		return value
	end

	slot5 = value[2] + 1

	return (value[1] + math.random(slot4)) - 1
end
MissionScriptElement.enabled = function (self)
	return self._values.enabled
end
MissionScriptElement._check_instigator = function (self, instigator)
	slot4 = instigator

	if CoreClass.type_name(slot3) == "Unit" then
		return instigator
	end

	slot4 = managers.player

	return managers.player.player_unit(slot3)
end
MissionScriptElement.on_executed = function (self, instigator, alternative, skip_execute_on_executed)
	if not self._values.enabled then
		return 
	end

	slot7 = instigator
	instigator = self._check_instigator(slot5, self)
	slot6 = Network

	if Network.is_server(slot5) then
		if instigator then
			slot6 = instigator
		else
			slot6 = managers.network
			slot10 = self._last_orientation_index or 0

			managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "run_mission_element_no_instigator", self._sync_id, self._id)
		end
	end

	self._last_orientation_index = nil
	slot7 = instigator

	self._print_debug_on_executed(slot5, self)

	slot6 = self

	self._reduce_trigger_times(slot5)

	slot6 = Network

	if Network.is_server(slot5) then
	end

	return 
end
MissionScriptElement._calc_base_delay = function (self)
	if not self._values.base_delay_rand then
		return self._values.base_delay
	end

	slot4 = self._values.base_delay_rand

	return self._values.base_delay + math.rand(slot3)
end
MissionScriptElement._trigger_execute_on_executed = function (self, instigator, alternative)
	slot5 = self
	local base_delay = self._calc_base_delay(slot4)

	if 0 < base_delay then
		slot12 = {
			instigator = instigator,
			alternative = alternative
		}
		slot9 = 1

		self._mission_script.add(slot5, self._mission_script, callback(slot8, self, self, "_execute_on_executed"), base_delay)
	else
		slot7 = {
			instigator = instigator,
			alternative = alternative
		}

		self.execute_on_executed(slot5, self)
	end

	return 
end
MissionScriptElement._print_debug_on_executed = function (self, instigator)
	slot4 = self

	if self.is_debug(slot3) then
		slot6 = instigator

		self._print_debug(slot3, self, "Element '" .. self._editor_name .. "' executed.")

		if instigator then
		end
	end

	return 
end
MissionScriptElement._print_debug = function (self, debug, instigator)
	slot5 = self

	if self.is_debug(slot4) then
		slot6 = debug

		self._mission_script.debug_output(slot4, self._mission_script)
	end

	return 
end
MissionScriptElement._reduce_trigger_times = function (self)
	if 0 < self._values.trigger_times then
		self._values.trigger_times = self._values.trigger_times - 1

		if self._values.trigger_times <= 0 then
			self._values.enabled = false
		end
	end

	return 
end
MissionScriptElement._execute_on_executed = function (self, params)
	slot5 = params

	self.execute_on_executed(slot3, self)

	return 
end
MissionScriptElement._calc_element_delay = function (self, params)
	if not params.delay_rand then
		return params.delay
	end

	slot5 = params.delay_rand

	return params.delay + math.rand(slot4)
end
MissionScriptElement.execute_on_executed = function (self, execute_params)
	slot4 = self._values.on_executed

	for _, params in ipairs(slot3) do
		if not execute_params.alternative or not params.alternative or execute_params.alternative == params.alternative then
			slot10 = params.id
			local element = self.get_mission_element(slot8, self)

			if element then
				slot11 = params
				local delay = self._calc_element_delay(slot9, self)

				if 0 < delay then

					-- Decompilation error in this vicinity:
					slot11 = self
					slot17 = execute_params.instigator
					slot14 = 1

					self._mission_script.add(slot10, self._mission_script, callback(slot13, element, element, "on_executed"), delay)
				else

					-- Decompilation error in this vicinity:
					slot11 = self
					slot12 = execute_params.instigator

					element.on_executed(slot10, element)
				end
			end
		end
	end

	return 
end
MissionScriptElement.on_execute_element = function (self, element, instigator)
	slot6 = instigator

	element.on_executed(slot4, element)

	return 
end
MissionScriptElement._has_on_executed_alternative = function (self, alternative)
	slot4 = self._values.on_executed

	for _, params in ipairs(slot3) do
		if params.alternative and params.alternative == alternative then
			return true
		end
	end

	return false
end
MissionScriptElement.set_enabled = function (self, enabled)
	self._values.enabled = enabled

	return 
end
MissionScriptElement.on_toggle = function (self, value)
	return 
end
MissionScriptElement.set_trigger_times = function (self, trigger_times)
	self._values.trigger_times = trigger_times

	return 
end
MissionScriptElement.is_debug = function (self)
	if not self._values.debug then
		slot3 = self._mission_script
		slot1 = self._mission_script.is_debug(slot2)
	end

	return slot1
end
MissionScriptElement.stop_simulation = function (self, ...)
	return 
end
MissionScriptElement.operation_add = function (self)
	slot3 = Application

	if Application.editor(slot2) then
		slot7 = self
		slot4 = "Element " .. self.editor_name(slot6) .. " doesn't have an 'add' operator implemented."

		managers.editor.output_error(slot2, managers.editor)
	end

	return 
end
MissionScriptElement.operation_remove = function (self)
	slot3 = Application

	if Application.editor(slot2) then
		slot7 = self
		slot4 = "Element " .. self.editor_name(slot6) .. " doesn't have a 'remove' operator implemented."

		managers.editor.output_error(slot2, managers.editor)
	end

	return 
end
MissionScriptElement.apply_job_value = function (self)
	slot3 = Application

	if Application.editor(slot2) then
		slot7 = self
		slot4 = "Element " .. self.editor_name(slot6) .. " doesn't have a 'apply_job_value' function implemented."

		managers.editor.output_error(slot2, managers.editor)
	end

	return 
end
MissionScriptElement.set_synced_orientation_element_index = function (self, orientation_element_index)
	if orientation_element_index and 0 < orientation_element_index then
		self._synced_orientation_element_index = orientation_element_index
	else
		self._synced_orientation_element_index = nil
	end

	return 
end
MissionScriptElement.get_orientation_by_index = function (self, index)
	if not index or index == 0 then
		return self._values.position, self._values.rotation
	end

	local id = self._values.orientation_elements[index]
	slot6 = id
	local element = self.get_mission_element(slot4, self)

	if self._values.disable_orientation_on_use then
		slot7 = false

		element.set_enabled(slot5, element)
	end

	slot7 = 0

	return element.get_orientation_by_index(slot5, element)
end
MissionScriptElement.get_orientation_index = function (self)
	if self._values.orientation_elements and 0 < #self._values.orientation_elements then
		if not self._unused_orientation_indices then
			self._unused_orientation_indices = {}
			slot3 = self._values.orientation_elements

			for index, id in ipairs(slot2) do
				slot9 = index

				table.insert(slot7, self._unused_orientation_indices)
			end
		end

		local alternatives = {}
		slot4 = self._unused_orientation_indices

		for i, index in ipairs(slot3) do
			local element_id = self._values.orientation_elements[index]
			slot11 = element_id
			local element = self.get_mission_element(slot9, self)
			slot11 = element

			if element.enabled(self) then
				slot12 = i

				table.insert(slot10, alternatives)
			end
		end

		if #alternatives == 0 then
			if #self._unused_orientation_indices == #self._values.orientation_elements then
				slot4 = "There where no enabled orientation elements!"
				slot7 = self

				_G.debug_pause(slot3, self.editor_name(slot6))

				return 
			elseif #self._unused_orientation_indices < #self._values.orientation_elements then
				self._unused_orientation_indices = nil
				slot4 = self

				return self.get_orientation_index(slot3)
			end
		end

		if self._values.use_orientation_sequenced then
			slot2 = 1
		else
			slot4 = #alternatives
			slot2 = math.random(slot3)
		end

		local use_i = alternatives[slot2]
		slot6 = use_i
		local index = table.remove(slot4, self._unused_orientation_indices)
		self._unused_orientation_indices = (0 < #self._unused_orientation_indices and self._unused_orientation_indices) or nil

		return index
	else
		return 0
	end

	return 
end
MissionScriptElement.get_orientation = function (self, use_last_orientation_index)
	local index = use_last_orientation_index and self._last_orientation_index

	if not index and not self._synced_orientation_element_index then
		slot5 = self
		index = self.get_orientation_index(slot4)
	end

	self._last_orientation_index = index
	slot6 = index
	local pos, rot = self.get_orientation_by_index(slot4, self)

	return pos, rot
end
MissionScriptElement.debug_draw = function (self)
	return 
end
MissionScriptElement.pre_destroy = function (self)
	return 
end
MissionScriptElement.destroy = function (self)
	return 
end

return 
