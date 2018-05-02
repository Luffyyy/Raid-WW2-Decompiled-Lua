slot2 = "lib/managers/menu/raid_menu/controls/RaidGUIPanel"

require(slot1)

if not RaidGUIControlTableRow then
	slot2 = RaidGUIPanel
	slot0 = class(slot1)
end

RaidGUIControlTableRow = slot0
RaidGUIControlTableRow.init = function (self, parent, params, row_data, table_params)
	slot9 = params

	RaidGUIControlTableRow.super.init(slot6, self, parent)

	self.cells = {}
	self.row_data = row_data
	self._selected = false
	self._type = "raid_gui_control_table_row"
	local cell_params = clone(slot6)
	slot8 = self
	cell_params.layer = self.layer(params) + 150
	cell_params.y = 0
	slot9 = {
		visible = false,
		y = 0,
		w = 2,
		x = 0,
		h = params.height,
		color = tweak_data.gui.colors.raid_red
	}
	self._selector_mark = self.rect(params, self)
	local x = 0
	slot9 = table_params.columns

	for column_index, column_data in ipairs(self) do
		local cell_class = column_data.cell_class or RaidGUIControlTableCell
		cell_params.name = self._params.name .. "_column_" .. column_index
		cell_params.x = x + (column_data.padding or 0)
		cell_params.w = column_data.w - 2 * (column_data.padding or 0)

		if row_data[column_index] and row_data[column_index].text then
			cell_params.text = row_data[column_index].text or ""
			cell_params.color = row_data[column_index].color or column_data.color or Color.white
		end

		cell_params.align = column_data.align
		cell_params.vertical = column_data.vertical
		cell_params.on_cell_click_callback = column_data.on_cell_click_callback
		cell_params.on_cell_double_click_callback = column_data.on_cell_double_click_callback
		cell_params.value = row_data[column_index].value or nil
		slot15 = column_data

		for column_data_item_key, column_data_value in pairs(slot14) do
			cell_params[column_data_item_key] = column_data_value
		end

		slot19 = table_params
		local cell = self.create_custom_control(slot14, self, cell_class, cell_params, row_data)
		slot17 = cell

		table.insert(self, self.cells)

		x = x + column_data.w
	end

	return 
end
RaidGUIControlTableRow.get_cells = function (self)
	return self.cells
end
RaidGUIControlTableRow.mouse_moved = function (self, o, x, y)
	slot6 = self

	if self.selected(slot5) then
		return 
	end

	slot8 = y

	if self.inside(slot5, self, x) then
		if not self._mouse_inside then
			slot8 = y

			self.on_mouse_over(slot5, self, x)
		end

		return true, self._pointer_type
	end

	if self._mouse_inside then
		slot8 = y

		self.on_mouse_out(slot5, self, x)
	end

	return false
end
RaidGUIControlTableRow.selected = function (self)
	return self._selected
end
RaidGUIControlTableRow.on_mouse_over = function (self, x, y)
	self._mouse_inside = true
	slot5 = self

	self.highlight_on(slot4)

	return 
end
RaidGUIControlTableRow.on_mouse_out = function (self, x, y)
	self._mouse_inside = false
	slot5 = self

	self.highlight_off(slot4)

	return 
end
RaidGUIControlTableRow.highlight_on = function (self)
	if self._selected then
		return 
	end

	slot3 = self.cells

	for _, cell in pairs(slot2) do
		slot8 = cell

		cell.highlight_on(slot7)
	end

	if self._params.highlight_background_color and self._params.background_color then
		slot4 = self._params.highlight_background_color

		self.set_background_color(slot2, self)
	end

	return 
end
RaidGUIControlTableRow.highlight_off = function (self)
	if self._selected then
		return 
	end

	slot3 = self.cells

	for _, cell in pairs(slot2) do
		slot8 = cell

		cell.highlight_off(slot7)
	end

	if self._params.highlight_background_color and self._params.background_color then
		slot4 = self._params.background_color

		self.set_background_color(slot2, self)
	end

	return 
end
RaidGUIControlTableRow.select_on = function (self)
	slot3 = self.cells

	for _, cell in pairs(slot2) do
		slot8 = cell

		cell.select_on(slot7)
	end

	if self._params.selected_background_color and self._params.background_color then
		slot4 = self._params.selected_background_color

		self.set_background_color(slot2, self)
	end

	if self._params.use_selector_mark then
		slot3 = self._selector_mark

		self._selector_mark.show(slot2)
	end

	return 
end
RaidGUIControlTableRow.select_off = function (self)
	slot3 = self.cells

	for _, cell in pairs(slot2) do
		slot8 = cell

		cell.select_off(slot7)
	end

	if self._params.selected_background_color and self._params.background_color then
		slot4 = self._params.background_color

		self.set_background_color(slot2, self)
	end

	if self._params.use_selector_mark then
		slot3 = self._selector_mark

		self._selector_mark.hide(slot2)
	end

	return 
end
RaidGUIControlTableRow.select = function (self)
	self._selected = true
	slot3 = self

	self.select_on(slot2)

	slot3 = self

	self.highlight_on(slot2)

	return 
end
RaidGUIControlTableRow.unselect = function (self)
	self._selected = false
	slot3 = self

	self.select_off(slot2)

	slot3 = self

	self.highlight_off(slot2)

	return 
end
RaidGUIControlTableRow.confirm_pressed = function (self)
	slot3 = self.cells

	for _, cell in pairs(slot2) do
		if cell.on_double_click then
			slot9 = cell

			return cell.on_double_click(slot7, cell)
		end
	end

	return 
end
RaidGUIControlTableRow.mouse_released = function (self, o, button, x, y)
	slot7 = self

	return self.on_mouse_released(slot6)
end
RaidGUIControlTableRow.on_mouse_released = function (self, button)
	if self._params.on_row_click_callback then
		slot5 = self._params.row_index

		self._params.on_row_click_callback(slot3, self.row_data)
	end

	return true
end
RaidGUIControlTableRow.mouse_double_click = function (self, button)
	if self._params.on_row_double_click_callback then
		slot5 = self._params.row_index

		self._params.on_row_double_click_callback(slot3, self.row_data)
	end

	return true
end
RaidGUIControlTableRow.get_data = function (self)
	return self.row_data
end

return 
