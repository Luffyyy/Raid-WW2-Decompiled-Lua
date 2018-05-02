-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreControllerWrapperSettings"

core.module(slot1, core)

ControllerWrapperSettings = ControllerWrapperSettings or class()
ControllerWrapperSettings.init = function (self, wrapper_type, node, core_setting, debug_path)
	self._wrapper_type = wrapper_type
	self._connection_list = {}
	self._connection_map = {}
	self._editable_connection_map = {}
	self._unselectable_input_map = {}

	if node then
		slot7 = node

		for _, setting_node in ipairs(slot6) do
			local element_name = setting_node._meta

			if element_name == "connections" then
				slot13 = setting_node

				for _, connection_node in ipairs(slot12) do
					local element_name = connection_node._meta
					local name = connection_node.name

					if not name then
						slot25 = element_name
						slot21 = self.get_origin(slot22, self) .. " controller \"" .. tostring(debug_path) .. "\" input had no name attribute."

						Application.error(slot19, Application)
					elseif element_name == "button" then
						if self._connection_map[name] then
							slot25 = name
							slot21 = self.get_origin(slot22, self) .. " Duplicate controller button connection (name: \"" .. tostring(debug_path) .. "\"). Overwriting existing one."

							Application.error(slot19, Application)
						end

						slot21 = name
						slot25 = connection_node

						self.set_connection(slot19, self, ControllerWrapperButton.new(slot23, ControllerWrapperButton))
					elseif element_name == "axis" then
						if self._connection_map[name] then
							slot25 = name
							slot21 = self.get_origin(slot22, self) .. " Duplicate controller axis connection (name: \"" .. tostring(debug_path) .. "\"). Overwriting existing one."

							Application.error(slot19, Application)
						end

						slot21 = name
						slot25 = connection_node

						self.set_connection(slot19, self, ControllerWrapperAxis.new(slot23, ControllerWrapperAxis))
					else
						slot25 = element_name
						slot21 = self.get_origin(slot22, self) .. " Invalid element \"" .. tostring(debug_path) .. "\" inside \"connections\" element."

						Application.error(slot19, Application)
					end
				end
			elseif element_name == "editable" then
				slot13 = setting_node

				for _, editable_node in ipairs(slot12) do
					local element_name = editable_node._meta

					if element_name == ControllerWrapperEditable.TYPE then
						local name = editable_node.name

						if not name then
							slot24 = debug_path
							slot21 = self.get_origin(slot22, self) .. " Editable input element had no name attribute."

							Application.error(slot19, Application)
						else
							if self._editable_connection_map[name] then
								slot25 = name
								slot21 = self.get_origin(slot22, self) .. " Duplicate controller editable connection (name: \"" .. tostring(debug_path) .. "\"). Overwriting existing one."

								Application.error(slot19, Application)
							end

							slot21 = name
							slot25 = editable_node

							self.set_editable_connection(slot19, self, ControllerWrapperEditable.new(slot23, ControllerWrapperEditable))
						end
					else
						slot24 = element_name
						slot20 = self.get_origin(slot21, self) .. " Invalid element \"" .. tostring(debug_path) .. "\" inside \"editable\" element."

						Application.error(slot18, Application)
					end
				end
			elseif element_name == "unselectable" then
				slot13 = setting_node

				for _, unselectable_node in ipairs(slot12) do
					local element_name = unselectable_node._meta

					if element_name == ControllerWrapperUnselectable.TYPE then
						local input_name = unselectable_node.name

						if not input_name then
							slot24 = debug_path
							slot21 = self.get_origin(slot22, self) .. " Unselectable input element had no name attribute."

							Application.error(slot19, Application)
						else
							if self._unselectable_input_map[input_name] then
								slot25 = input_name
								slot21 = self.get_origin(slot22, self) .. " Duplicate controller unselectable connection (name: \"" .. tostring(debug_path) .. "\"). Overwriting existing one."

								Application.error(slot19, Application)
							end

							slot21 = input_name
							slot25 = unselectable_node

							self.set_unselectable_input(slot19, self, ControllerWrapperUnselectable.new(slot23, ControllerWrapperUnselectable))
						end
					else
						slot24 = element_name
						slot20 = self.get_origin(slot21, self) .. " Invalid element \"" .. tostring(debug_path) .. "\" inside \"unselectable\" element."

						Application.error(slot18, Application)
					end
				end
			else
				slot18 = name
				slot20 = self._wrapper_type
				slot14 = self.get_origin(slot15, self) .. " Invalid element \"" .. tostring(debug_path) .. "\" inside \"" .. tostring(slot19) .. "\" element."

				Application.error(slot12, Application)
			end
		end
	end

	if core_setting then
		slot9 = false

		self.merge(slot6, self, core_setting)
	end

	slot7 = self

	self.validate(slot6)

	return 
end
ControllerWrapperSettings.merge = function (self, setting, overwrite)
	slot7 = setting

	for name, connection in pairs(setting.get_connection_map(slot6)) do
		if overwrite or not self._connection_map[name] then
			slot12 = connection

			self.set_connection(slot9, self, name)
		end
	end

	slot7 = setting

	for name, editable_connection in pairs(setting.get_editable_connection_map(slot6)) do
		if overwrite or not self._editable_connection_map[name] then
			self._editable_connection_map[name] = editable_connection
		end
	end

	slot7 = setting

	for name, unselectable_input in pairs(setting.get_unselectable_input_map(slot6)) do
		if overwrite or not self._unselectable_input_map[name] then
			self._unselectable_input_map[name] = unselectable_input
		end
	end

	return 
end
ControllerWrapperSettings.validate = function (self)
	slot3 = self._editable_connection_map

	for connection_name, editable_connection in pairs(slot2) do
		local connection = self._connection_map[connection_name]

		if not connection then
			self._editable_connection_map[connection_name] = nil
			slot12 = editable_connection
			slot14 = connection_name
			slot10 = tostring(slot11) .. " Connection \"" .. tostring(slot13) .. "\" that was supposed to be editable did not exist. It is no longer editable."

			Application.error(nil, Application)
		else
			local input_name_list = connection.get_input_name_list(slot8)
			slot10 = input_name_list

			for _, input_name in ipairs(connection) do
				local unselectable_input = self._unselectable_input_map[input_name]

				if unselectable_input then
					local invalid = nil

					if 1 < #input_name_list then
						slot17 = connection
					else
						slot17 = unselectable_input
						invalid = unselectable_input.get_single(slot16)
					end

					if invalid then
						self._editable_connection_map[connection_name] = nil
						slot20 = unselectable_input
						slot22 = connection_name
						slot24 = input_name
						slot18 = tostring(slot19) .. " Connection \"" .. tostring(slot21) .. "\" was editable but its input \"" .. tostring(slot23) .. "\" is unselectable. It is no longer editable."

						Application.error(nil, Application)
					end
				end
			end
		end
	end

	return 
end
ControllerWrapperSettings.populate_data = function (self, data)
	local sub_data = {}
	local connection_list = nil
	slot6 = self._connection_map

	for _, connection in pairs(slot5) do
		if not connection_list then
			connection_list = {
				_meta = "connections"
			}
			slot12 = connection_list

			table.insert(slot10, sub_data)
		end

		slot12 = connection_list

		connection.populate_data(slot10, connection)
	end

	local editable_list = nil
	slot7 = self._editable_connection_map

	for _, editable in pairs(slot6) do
		if not editable_list then
			editable_list = {
				_meta = "editable"
			}
			slot13 = editable_list

			table.insert(slot11, sub_data)
		end

		slot13 = editable_list

		editable.populate_data(slot11, editable)
	end

	local unselectable_list = nil
	slot8 = self._unselectable_input_map

	for _, unselectable in pairs(slot7) do
		if not unselectable_list then
			unselectable_list = {
				_meta = "unselectable"
			}
			slot14 = unselectable_list

			table.insert(slot12, sub_data)
		end

		slot14 = unselectable_list

		unselectable.populate_data(slot12, unselectable)
	end

	data[self._wrapper_type] = sub_data

	return 
end
ControllerWrapperSettings.wrapper_type = function (self)
	return self._wrapper_type
end
ControllerWrapperSettings.get_connection_list = function (self)
	return self._connection_list
end
ControllerWrapperSettings.get_connection_map = function (self)
	return self._connection_map
end
ControllerWrapperSettings.get_connection = function (self, name)
	return self._connection_map[name]
end
ControllerWrapperSettings.set_connection = function (self, name, connection)
	self._connection_map[name] = connection
	slot6 = name

	table.insert(slot4, self._connection_list)

	return 
end
ControllerWrapperSettings.get_editable_connection_map = function (self)
	return self._editable_connection_map
end
ControllerWrapperSettings.get_editable_connection = function (self, name)
	return self._editable_connection_map[name]
end
ControllerWrapperSettings.set_editable_connection = function (self, name, editable)
	self._editable_connection_map[name] = editable

	return 
end
ControllerWrapperSettings.get_unselectable_input_map = function (self)
	return self._unselectable_input_map
end
ControllerWrapperSettings.get_unselectable_input = function (self, input_name)
	return self._unselectable_input_map[input_name]
end
ControllerWrapperSettings.set_unselectable_input = function (self, input_name, unselectable)
	self._unselectable_input_map[input_name] = unselectable

	return 
end
ControllerWrapperSettings.get_origin = function (self, debug_path)
	if debug_path then
		slot4 = "[Controller][File: %s]"
		slot7 = debug_path

		return string.format(slot3, tostring(slot6))
	else
		return "[Controller]"
	end

	return 
end
ControllerWrapperConnection = ControllerWrapperConnection or class()
ControllerWrapperConnection.TYPE = "generic"
ControllerWrapperConnection.DEFAULT_MIN_SRC_RANGE = 0
ControllerWrapperConnection.DEFAULT_MAX_SRC_RANGE = 1
ControllerWrapperConnection.DEFAULT_MIN_DEST_RANGE = 0
ControllerWrapperConnection.DEFAULT_MAX_DEST_RANGE = 1
ControllerWrapperConnection.DEFAULT_CONNECT_SRC_TYPE = "button"
ControllerWrapperConnection.DEFAULT_CONNECT_DEST_TYPE = "button"
ControllerWrapperConnection.init = function (self, node)
	if node then
		self._name = node.name
		local input_name = nil
		local attribute = "input"
		local count = 1

		repeat
			input_name = node[attribute]

			if input_name then
				self._input_name_list = self._input_name_list or {}
				slot8 = input_name

				table.insert(slot6, self._input_name_list)

				count = count + 1
				attribute = "input" .. count
			end
		until not input_name

		self._controller_id = node.controller

		if node.debug == true then
			self._debug = true
		end

		if node.enabled == false then
			self._disabled = true
		end

		if node.any_input == false then
			self._single_input = true
		end

		slot7 = node.delay
		self._delay = tonumber(slot6)
		slot7 = node.min_src_range
		self._min_src_range = tonumber(slot6)
		slot7 = node.max_src_range
		self._max_src_range = tonumber(slot6)
		slot7 = node.min_dest_range
		self._min_dest_range = tonumber(slot6)
		slot7 = node.max_dest_range
		self._max_dest_range = tonumber(slot6)
		slot7 = node

		for _, child in ipairs(slot6) do
			local child_name = child._meta

			if child_name == ControllerWrapperDelayConnection.TYPE then
				slot14 = child
				local delay_connection = ControllerWrapperDelayConnection.new(slot12, ControllerWrapperDelayConnection)
				self._delay_connection_list = self._delay_connection_list or {}
				slot15 = delay_connection

				table.insert(slot13, self._delay_connection_list)
			end
		end
	end

	return 
end
ControllerWrapperConnection.set_name = function (self, name)
	self._name = name

	return 
end
ControllerWrapperConnection.get_name = function (self)
	return self._name
end
ControllerWrapperConnection.set_input_name_list = function (self, input_name_list)
	if self._input_name_list then
		slot4 = self._input_name_list
	else
		self._input_name_list = nil
	end

	return 
end
ControllerWrapperConnection.get_input_name_list = function (self)
	return self._input_name_list or {}
end
ControllerWrapperConnection.get_controller_id = function (self)
	return self._controller_id
end
ControllerWrapperConnection.set_controller_id = function (self, controller_id)
	self._controller_id = controller_id

	return 
end
ControllerWrapperConnection.set_debug = function (self, debug)
	if debug then
		self._debug = true
	else
		self._debug = nil
	end

	return 
end
ControllerWrapperConnection.get_debug = function (self)
	return self._debug
end
ControllerWrapperConnection.set_enabled = function (self, enabled)
	if not enabled then
		self._disabled = true
	else
		self._disabled = nil
	end

	return 
end
ControllerWrapperConnection.get_enabled = function (self)
	return not self._disabled
end
ControllerWrapperConnection.set_any_input = function (self, any_input)
	if not any_input then
		self._single_input = true
	else
		self._single_input = nil
	end

	return 
end
ControllerWrapperConnection.get_any_input = function (self)
	return not self._single_input
end
ControllerWrapperConnection.set_delay = function (self, delay)
	if self._delay ~= 0 then
		self._delay = delay
	else
		self._delay = nil
	end

	return 
end
ControllerWrapperConnection.get_delay = function (self)
	return self._delay or 0
end
ControllerWrapperConnection.set_delay_connection_list = function (self, delay_connection_list)
	if self._delay_connection_list then
		slot4 = self._delay_connection_list
	else
		self._delay_connection_list = nil
	end

	return 
end
ControllerWrapperConnection.get_delay_connection_list = function (self)
	return self._delay_connection_list or {}
end
ControllerWrapperConnection.set_range = function (self, min_src, max_src, min_dest, max_dest)
	if min_src ~= self.DEFAULT_MIN_SRC_RANGE then
		self._min_src_range = min_src
	else
		self._min_src_range = nil
	end

	if max_src ~= self.DEFAULT_MAX_SRC_RANGE then
		self._max_src_range = max_src
	else
		self._max_src_range = nil
	end

	if min_dest ~= self.DEFAULT_MIN_DEST_RANGE then
		self._min_dest_range = min_dest
	else
		self._min_dest_range = nil
	end

	if max_dest ~= self.DEFAULT_MAX_DEST_RANGE then
		self._max_dest_range = max_dest
	else
		self._max_dest_range = nil
	end

	return 
end
ControllerWrapperConnection.get_range = function (self)
	return self._min_src_range or self.DEFAULT_MIN_SRC_RANGE, self._max_src_range or self.DEFAULT_MAX_SRC_RANGE, self._min_dest_range or self.DEFAULT_MIN_DEST_RANGE, self._max_dest_range or self.DEFAULT_MAX_DEST_RANGE
end
ControllerWrapperConnection.set_connect_src_type = function (self, connect_src_type)
	if self._connect_src_type ~= self.DEFAULT_CONNECT_SRC_TYPE then
		self._connect_src_type = connect_src_type
	else
		self._connect_src_type = nil
	end

	return 
end
ControllerWrapperConnection.get_connect_src_type = function (self)
	return self._connect_src_type or self.DEFAULT_CONNECT_SRC_TYPE
end
ControllerWrapperConnection.set_connect_dest_type = function (self, connect_dest_type)
	if self._connect_dest_type ~= self.DEFAULT_CONNECT_DEST_TYPE then
		self._connect_dest_type = connect_dest_type
	else
		self._connect_dest_type = nil
	end

	return 
end
ControllerWrapperConnection.get_connect_dest_type = function (self)
	return self._connect_dest_type or self.DEFAULT_CONNECT_DEST_TYPE
end
ControllerWrapperConnection.populate_data = function (self, data)
	local sub_data = {
		_meta = self.TYPE
	}
	slot6 = sub_data

	self.populate_data_attributes(slot4, self)

	if self._delay_connection_list then
		slot5 = self._delay_connection_list

		for _, delay_connection in ipairs(slot4) do
			slot11 = sub_data

			delay_connection.populate_data(slot9, delay_connection)
		end
	end

	slot6 = sub_data

	table.insert(slot4, data)

	return 
end
ControllerWrapperConnection.populate_data_attributes = function (self, sub_data)
	sub_data.name = self._name
	sub_data.controller = self._controller_id
	sub_data.delay = self._delay
	sub_data.min_src_range = self._min_src_range
	sub_data.max_src_range = self._max_src_range
	sub_data.min_dest_range = self._min_dest_range
	sub_data.max_dest_range = self._max_dest_range
	sub_data.connect_src_type = self._connect_src_type
	sub_data.connect_dest_type = self._connect_dest_type

	if self._debug then
		sub_data.debug = true
	end

	if self._disabled then
		sub_data.enabled = false
	end

	if self._single_input then
		sub_data.any_input = false
	end

	if self._input_name_list then
		slot4 = self._input_name_list

		for index, input_name in ipairs(slot3) do
			local attribute = "input"

			if 1 < index then
				attribute = attribute .. index
			end

			sub_data[attribute] = input_name
		end
	end

	return 
end
ControllerWrapperConnection.__tostring = function (self, additional_info)

	-- Decompilation error in this vicinity:
	slot2 = string.format
	slot4 = "[Controller][Connection][Type: %s, Name: %s, Input: %s, Controller: %s, Debug: %s, Enabled: %s, Any input: %s, Delay: %s%s]"
	slot5 = tostring(slot6)
	slot8 = self._name
	slot6 = tostring(self.TYPE)
end

if not ControllerWrapperButton then
	slot2 = ControllerWrapperConnection
	slot0 = class(slot1)
end

ControllerWrapperButton = slot0
ControllerWrapperButton.TYPE = "button"
ControllerWrapperButton.init = function (self, node)
	slot5 = node

	ControllerWrapperButton.super.init(slot3, self)

	return 
end
ControllerWrapperButton.__tostring = function (self, additional_info)
	slot5 = additional_info

	return ControllerWrapperConnection.__tostring(slot3, self)
end

if not ControllerWrapperAxis then
	slot2 = ControllerWrapperConnection
	slot0 = class(slot1)
end

ControllerWrapperAxis = slot0
ControllerWrapperAxis.TYPE = "axis"
ControllerWrapperAxis.IS_AXIS = true
ControllerWrapperAxis.DEFAULT_MIN_SRC_RANGE = -1
ControllerWrapperAxis.DEFAULT_MAX_SRC_RANGE = 1
ControllerWrapperAxis.DEFAULT_MIN_DEST_RANGE = -1
ControllerWrapperAxis.DEFAULT_MAX_DEST_RANGE = 1
ControllerWrapperAxis.DEFAULT_CONNECT_SRC_TYPE = "axis"
ControllerWrapperAxis.DEFAULT_CONNECT_DEST_TYPE = "axis"
slot5 = 1
ControllerWrapperAxis.ONE_VECTOR = Vector3(slot2, 1, 1)
ControllerWrapperAxis.init = function (self, node)
	slot5 = node

	ControllerWrapperAxis.super.init(slot3, self)

	self._multiplier = self.ONE_VECTOR
	self._inversion = self.ONE_VECTOR
	self._inversion_unmodified = self.ONE_VECTOR
	self._INVERSION_MODIFIER = self.ONE_VECTOR

	if node then
		local multiplier = node.multiplier

		if multiplier and multiplier.type_name == Vector3.type_name then
			slot6 = multiplier

			self.set_multiplier(slot4, self)
		end

		slot5 = self
		slot8 = node.lerp

		self.set_lerp(slot4, tonumber(slot7))

		local init_lerp_axis = node.init_lerp_axis

		if init_lerp_axis and init_lerp_axis.type_name == Vector3.type_name then
			slot7 = init_lerp_axis

			self.set_init_lerp_axis(slot5, self)
		end

		slot6 = self
		slot9 = node.pad_bottom

		self.set_pad_bottom(slot5, tonumber(slot8))

		slot6 = self
		slot9 = node.pad_top

		self.set_pad_top(slot5, tonumber(slot8))

		slot6 = self
		slot9 = node.soft_top

		self.set_soft_top(slot5, tonumber(slot8))

		if node.no_limit == true then
			self._no_limit = true
		end

		local inversion_modifier = node.inversion_modifier

		if inversion_modifier and inversion_modifier.type_name == Vector3.type_name then
			self._INVERSION_MODIFIER = inversion_modifier
			slot7 = self

			self.set_inversion(slot6)
		end

		local inversion = node.inversion

		if inversion and inversion.type_name == Vector3.type_name then
			slot9 = inversion

			self.set_inversion(slot7, self)
		end
	end

	if node then
		self._btn_connections = {}
		slot5 = node

		self.read_axis_btns(slot3, self)
	end

	return 
end
ControllerWrapperAxis.read_axis_btns = function (self, node)
	slot4 = node

	for _, child in ipairs(slot3) do
		local child_name = child._meta

		if (child_name == "button" or child_name == "axis") and child.name and child.input then
			self._btn_connections[child.name] = {
				type = child_name,
				name = child.input
			}

			if child.dir then
				self._btn_connections[child.name].dir = child.dir
			end

			if child.range1 then
				self._btn_connections[child.name].range1 = child.range1
			end

			if child.range2 then
				self._btn_connections[child.name].range2 = child.range2
			end
		end
	end

	return 
end
ControllerWrapperAxis.print_output = function (self, output, indent)
	slot9 = indent
	slot11 = self
	slot6 = string.rep(slot7, "\t") .. "<" .. self.TYPE .. self.get_output_attributes(slot10) .. ""

	output.print(slot4, output)

	slot5 = self

	if self.has_children(slot4) then
		slot6 = ">"

		output.puts(slot4, output)
		self.print_output_children(slot4, self, output)

		slot9 = indent
		slot6 = string.rep(indent + 1, "\t") .. "</" .. self.TYPE .. ">"

		output.puts(slot4, output)
	elseif self._btn_connections then
		slot6 = ">"

		output.puts(slot4, output)
		self.print_output_axis_btns(slot4, self, output)

		slot9 = indent
		slot6 = string.rep(indent + 1, "\t") .. "</" .. self.TYPE .. ">"

		output.puts(slot4, output)
	else
		slot6 = "/>"

		output.puts(slot4, output)
	end

	return 
end
ControllerWrapperAxis.print_output_axis_btns = function (self, output, indent)
	slot5 = self._btn_connections

	for btn, con in pairs(slot4) do
		if con.type == "button" then
			slot14 = indent
			slot17 = con.name
			slot11 = string.rep(slot12, "\t") .. string.format("\t", "<%s name=\"%s\" input=\"%s\"/>", con.type, btn)

			output.puts(slot9, output)
		elseif con.type == "axis" then
			slot14 = indent
			slot20 = con.range2
			slot11 = string.rep(slot12, "\t") .. string.format("\t", "<%s name=\"%s\" input=\"%s\" dir=\"%s\" range1=\"%s\" range2=\"%s\"/>", con.type, btn, con.name, con.dir, con.range1)

			output.puts(slot9, output)
		end
	end

	return 
end
ControllerWrapperAxis.set_multiplier = function (self, multiplier)
	self._multiplier = multiplier or self.ONE_VECTOR

	return 
end
ControllerWrapperAxis.get_multiplier = function (self)
	return self._multiplier
end
ControllerWrapperAxis.set_lerp = function (self, lerp)
	if lerp then
		slot6 = 1
		slot2 = math.clamp(slot3, lerp, 0)
	end

	self._lerp = slot2

	return 
end
ControllerWrapperAxis.get_lerp = function (self)
	return self._lerp
end
ControllerWrapperAxis.set_init_lerp_axis = function (self, init_lerp_axis)
	self._init_lerp_axis = init_lerp_axis

	return 
end
ControllerWrapperAxis.get_init_lerp_axis = function (self)
	return self._init_lerp_axis
end
ControllerWrapperAxis.set_pad_bottom = function (self, pad_bottom)
	if pad_bottom then
		slot6 = 1
		slot2 = math.clamp(slot3, pad_bottom, 0)
	end

	self._pad_bottom = slot2

	return 
end
ControllerWrapperAxis.get_pad_bottom = function (self)
	return self._pad_bottom
end
ControllerWrapperAxis.set_pad_top = function (self, pad_top)
	if pad_top then
		slot6 = 1
		slot2 = math.clamp(slot3, pad_top, 0)
	end

	self._pad_top = slot2

	return 
end
ControllerWrapperAxis.get_pad_top = function (self)
	return self._pad_top
end
ControllerWrapperAxis.set_soft_top = function (self, soft_top)
	if soft_top then
		slot6 = 1
		slot2 = math.clamp(slot3, soft_top, 0)
	end

	self._soft_top = slot2

	return 
end
ControllerWrapperAxis.get_soft_top = function (self)
	return self._soft_top
end
ControllerWrapperAxis.set_no_limit = function (self, no_limit)
	if no_limit then
		self._no_limit = true
	else
		self._no_limit = nil
	end

	return 
end
ControllerWrapperAxis.get_no_limit = function (self)
	return self._no_limit
end
ControllerWrapperAxis.set_inversion = function (self, inversion)
	self._inversion_unmodified = inversion or self.ONE_VECTOR
	slot6 = self._inversion_unmodified.z * self._INVERSION_MODIFIER.z
	self._inversion = Vector3(slot3, self._inversion_unmodified.x * self._INVERSION_MODIFIER.x, self._inversion_unmodified.y * self._INVERSION_MODIFIER.y)

	return 
end
ControllerWrapperAxis.get_inversion_unmodified = function (self)
	return self._inversion_unmodified
end
ControllerWrapperAxis.get_inversion = function (self)
	return self._inversion
end
ControllerWrapperAxis.get_output_attributes = function (self)
	local additional_attributes = ""

	if self._multiplier and (self._multiplier.x ~= 1 or self._multiplier.y ~= 1 or self._multiplier.z ~= 1) then
		slot8 = self._multiplier.z
		additional_attributes = additional_attributes .. string.format(slot4, " multiplier=\"%g %g %g\"", self._multiplier.x, self._multiplier.y)
	end

	if self._lerp then
		slot6 = self._lerp
		additional_attributes = additional_attributes .. string.format(slot4, " lerp=\"%g\"")

		if self._init_lerp_axis and (self._init_lerp_axis.x ~= 1 or self._init_lerp_axis.y ~= 1 or self._init_lerp_axis.z ~= 1) then
			slot8 = self._init_lerp_axis.z
			additional_attributes = additional_attributes .. string.format(slot4, " init_lerp_axis=\"%g %g %g\"", self._init_lerp_axis.x, self._init_lerp_axis.y)
		end
	end

	if self._pad_bottom and self._pad_bottom ~= 0 then
		slot6 = self._pad_bottom
		additional_attributes = additional_attributes .. string.format(slot4, " pad_bottom=\"%g\"")
	end

	if self._pad_top and self._pad_top ~= 0 then
		slot6 = self._pad_top
		additional_attributes = additional_attributes .. string.format(slot4, " pad_top=\"%g\"")
	end

	if self._soft_top and self._soft_top ~= 0 then
		slot6 = self._soft_top
		additional_attributes = additional_attributes .. string.format(slot4, " soft_top=\"%g\"")
	end

	if self._no_limit then
		slot5 = " no_limit=\"%s\""
		slot8 = not not self._no_limit
		additional_attributes = additional_attributes .. string.format(slot4, tostring(slot7))
	end

	if self._inversion and (self._inversion.x ~= 1 or self._inversion.y ~= 1 or self._inversion.z ~= 1) then
		slot8 = self._inversion.z
		additional_attributes = additional_attributes .. string.format(slot4, " inversion=\"%g %g %g\"", self._inversion.x, self._inversion.y)
	end

	slot4 = self

	return ControllerWrapperConnection.get_output_attributes(slot3) .. additional_attributes
end
ControllerWrapperAxis.__tostring = function (self, additional_info)
	slot7 = additional_info or ""
	slot9 = self._multiplier
	slot11 = self._lerp
	slot13 = self._init_lerp_axis
	slot15 = self._pad_bottom
	slot17 = self._pad_top
	slot19 = self._soft_top
	slot21 = self._no_limit
	slot23 = self._inversion
	slot5 = tostring(slot6) .. ", Multiplier: " .. tostring(slot8) .. ", Lerp: " .. tostring(slot10) .. ", Initial lerp axis: " .. tostring(slot12) .. ", Pad bottom: " .. tostring(slot14) .. ", Pad top: " .. tostring(slot16) .. ", Soft top: " .. tostring(slot18) .. ", No limit: " .. tostring(slot20) .. ", Inversion: " .. tostring(slot22)

	return ControllerWrapperConnection.__tostring(slot3, self)
end
ControllerWrapperDelayConnection = ControllerWrapperDelayConnection or class()
ControllerWrapperDelayConnection.TYPE = "delay"
ControllerWrapperDelayConnection.init = function (self, node)
	if node then
		self._name = node.name
	end

	return 
end
ControllerWrapperDelayConnection.set_name = function (self, name)
	self._name = name

	return 
end
ControllerWrapperDelayConnection.get_name = function (self)
	return self._name
end
ControllerWrapperDelayConnection.populate_data = function (self, data)
	local list = data.connections
	local sub_data = {
		_meta = self.TYPE
	}

	if not list then
		list = {}
		data.connections = list
	end

	sub_data.name = self._name
	slot7 = sub_data

	table.insert(slot5, list)

	return 
end
ControllerWrapperDelayConnection.__tostring = function (self, additional_info)
	slot5 = tostring(slot6)
	slot8 = additional_info

	return string.format(slot3, "[Controller][DelayConnection][Name: %s%s]", tostring(self._name))
end
ControllerWrapperEditable = ControllerWrapperEditable or class()
ControllerWrapperEditable.TYPE = "connection"
ControllerWrapperEditable.init = function (self, node)
	self._connection_name = node.name
	self._caption = node.caption or self._connection_name
	self._locale_id = node.locale_id

	return 
end
ControllerWrapperEditable.get_connection_name = function (self)
	return self._connection_name
end
ControllerWrapperEditable.set_connection_name = function (self, connection_name)
	self._connection_name = connection_name

	return 
end
ControllerWrapperEditable.get_caption = function (self)
	return self._caption
end
ControllerWrapperEditable.set_caption = function (self, caption)
	self._caption = caption or self._connection_name

	return 
end
ControllerWrapperEditable.get_locale_id = function (self)
	return self._locale_id
end
ControllerWrapperEditable.set_locale_id = function (self, locale_id)
	self._locale_id = locale_id

	return 
end
ControllerWrapperEditable.populate_data = function (self, data)
	local sub_data = {
		_meta = self.TYPE,
		name = self._connection_name,
		caption = self._caption,
		locale_id = self._locale_id
	}
	slot6 = sub_data

	table.insert(slot4, data)

	return 
end
ControllerWrapperEditable.__tostring = function (self, additional_info)
	slot9 = self._locale_id

	return string.format(slot3, "[Editable connection name: %s, Caption: %s, Locale id: %s]", tostring(tostring(self._connection_name)), tostring(self._caption))
end
ControllerWrapperUnselectable = ControllerWrapperUnselectable or class()
ControllerWrapperUnselectable.TYPE = "input"
ControllerWrapperUnselectable.init = function (self, node)
	self._input_name = node.name

	if node.single ~= false then
		self._single = true
	end

	if node.multi ~= false then
		self._multi = true
	end

	return 
end
ControllerWrapperUnselectable.get_input_name = function (self)
	return self._input_name
end
ControllerWrapperUnselectable.set_input_name = function (self, input_name)
	self._input_name = input_name

	return 
end
ControllerWrapperUnselectable.get_single = function (self)
	return self._single
end
ControllerWrapperUnselectable.set_single = function (self, single)
	if single then
		self._single = true
	else
		self._single = nil
	end

	return 
end
ControllerWrapperUnselectable.get_multi = function (self)
	return self._multi
end
ControllerWrapperUnselectable.set_multi = function (self, multi)
	if multi then
		self._multi = true
	else
		self._multi = nil
	end

	return 
end
ControllerWrapperUnselectable.populate_data = function (self, data)
	local sub_data = {
		_meta = self.TYPE,
		name = self._input_name
	}

	if not self._single then
		sub_data.single = not not self._single
	end

	if not self._multi then
		sub_data.multi = not not self._sing_multile
	end

	slot6 = sub_data

	table.insert(slot4, data)

	return 
end
ControllerWrapperUnselectable.__tostring = function (self, additional_info)
	slot4 = "[Unselectable input name: \"%s\"]"
	slot7 = self._input_name

	return string.format(slot3, tostring(slot6))
end

return 
