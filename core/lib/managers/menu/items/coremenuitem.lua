-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuItem"

core.module(slot1, core)

Item = Item or class()
Item.TYPE = "item"
Item.init = function (self, data_node, parameters)
	self._type = ""
	local params = parameters or {}
	params.info_panel = ""

	if data_node then
		slot6 = data_node

		for key, value in pairs(slot5) do
			if key ~= "_meta" then
				slot11 = value

				if type(slot10) ~= "table" then
					params[key] = value
				end
			end
		end
	end

	local required_params = {
		"name"
	}
	slot7 = required_params

	for _, p_name in ipairs(slot6) do
		if not params[p_name] then
			slot13 = "Menu item without parameter '" .. p_name .. "'"

			Application.error(slot11, Application)
		end
	end

	if params.visible_callback then
		slot8 = " "
		self._visible_callback_name_list = string.split(slot6, params.visible_callback)
	end

	if params.enabled_callback then
		slot8 = " "
		self._enabled_callback_name_list = string.split(slot6, params.enabled_callback)
	end

	if params.icon_visible_callback then
		slot8 = " "
		self._icon_visible_callback_name_list = string.split(slot6, params.icon_visible_callback)
	end

	if params.callback then
		slot8 = " "
		params.callback = string.split(slot6, params.callback)
	else
		params.callback = {}
	end

	if params.callback then
		params.callback_name = params.callback
		params.callback = {}
	end

	if params.callback_disabled then
		slot8 = " "
		params.callback_disabled = string.split(slot6, params.callback_disabled)
	else
		params.callback_disabled = {}
	end

	if params.callback_disabled then
		params.callback_disabled_name = params.callback_disabled
		params.callback_disabled = {}
	end

	slot8 = params

	self.set_parameters(slot6, self)

	self._enabled = true

	return 
end
Item.set_enabled = function (self, enabled)
	self._enabled = enabled
	slot4 = self

	self.dirty(slot3)

	return 
end
Item.enabled = function (self)
	return self._enabled
end
Item.type = function (self)
	return self._type
end
Item.name = function (self)
	return self._parameters.name
end
Item.info_panel = function (self)
	return self._parameters.info_panel
end
Item.parameters = function (self)
	return self._parameters
end
Item.parameter = function (self, name)
	return self._parameters[name]
end
Item.set_parameter = function (self, name, value)
	self._parameters[name] = value

	return 
end
Item.set_parameters = function (self, parameters)
	self._parameters = parameters

	return 
end
Item.set_callback_handler = function (self, callback_handler)
	self._callback_handler = callback_handler
	slot4 = self._parameters.callback_name

	for _, callback_name in pairs(slot3) do
		slot9 = self._parameters.callback
		slot14 = callback_name

		table.insert(slot8, callback(slot11, callback_handler, callback_handler))
	end

	slot4 = self._parameters.callback_disabled_name

	for _, callback_name in pairs(slot3) do
		slot9 = self._parameters.callback_disabled
		slot14 = callback_name

		table.insert(slot8, callback(slot11, callback_handler, callback_handler))
	end

	if self._visible_callback_name_list then
		slot4 = self._visible_callback_name_list

		for _, visible_callback_name in pairs(slot3) do
			self._visible_callback_list = self._visible_callback_list or {}
			slot9 = self._visible_callback_list
			slot14 = visible_callback_name

			table.insert(slot8, callback(slot11, callback_handler, callback_handler))
		end
	end

	if self._icon_visible_callback_name_list then
		slot4 = self._icon_visible_callback_name_list

		for _, visible_callback_name in pairs(slot3) do
			self._icon_visible_callback_list = self._icon_visible_callback_list or {}
			slot9 = self._icon_visible_callback_list
			slot14 = visible_callback_name

			table.insert(slot8, callback(slot11, callback_handler, callback_handler))
		end
	end

	if self._enabled_callback_name_list then
		slot4 = self._enabled_callback_name_list

		for _, enabled_callback_name in pairs(slot3) do
			if callback_handler[enabled_callback_name] then
				slot9 = self

				if not callback_handler[enabled_callback_name](slot8) then
					slot10 = false

					self.set_enabled(slot8, self)

					break
				end
			else
				slot11 = enabled_callback_name

				Application.error(slot8, Application, "[Item:set_callback_handler] inexistent callback:")
			end
		end
	end

	return 
end
Item.trigger = function (self)

	-- Decompilation error in this vicinity:
	slot1 = pairs
	slot5 = self

	for _, callback in slot1(slot2) do
		slot8 = self

		callback(slot7)
	end

	return 
end
Item.dirty = function (self)
	if self.dirty_callback then
		slot3 = self

		self.dirty_callback(slot2)
	end

	return 
end
Item.visible = function (self)
	if self._visible_callback_list then
		slot3 = self._visible_callback_list

		for _, visible_callback in pairs(slot2) do
			slot8 = self

			if not visible_callback(slot7) then
				return false
			end
		end
	end

	return true
end
Item.on_delete_row_item = function (self)
	return 
end
Item.on_delete_item = function (self)
	self._parameters.callback = {}
	self._parameters.callback_disabled = {}
	self._visible_callback_list = nil
	self._icon_visible_callback_list = nil

	return 
end
Item.on_item_position = function (self, row_item, node)
	return 
end
Item.on_item_positions_done = function (self, row_item, node)
	return 
end
Item.get_h = function (self, row_item)
	return nil
end
Item.setup_gui = function (self, node, row_item)
	return false
end
Item.reload = function (self, row_item)
	return false
end
Item.highlight_row_item = function (self, node, row_item, mouse_over)
	return false
end
Item.fade_row_item = function (self, node, row_item)
	return false
end
Item.menu_unselected_visible = function (self)
	return true
end
Item.icon_visible = function (self)
	if self._icon_visible_callback_list then
		slot3 = self._icon_visible_callback_list

		for _, visible_callback in pairs(slot2) do
			slot8 = self

			if not visible_callback(slot7) then
				return false
			end
		end
	end

	return true
end

return 
