-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
RaidGUIControl = RaidGUIControl or class()
RaidGUIControl.ID = 1
RaidGUIControl.init = function (self, parent, params)
	self._type = self._type or "raid_gui_control"
	self._control_id = RaidGUIControl.ID
	RaidGUIControl.ID = RaidGUIControl.ID + 1
	self._name = params.name or self._type .. "_" .. self._control_id
	self._parent = parent

	if not params.panel then
	end

	self._parent_panel = slot3
	slot5 = params
	self._params = clone(slot4)
	self._params.name = params.name or self._name
	self._mouse_inside = false
	self._params.color = params.color or Color.white
	slot3 = self._params

	if not params.layer then
		slot6 = self._parent_panel
		slot3.layer = self._parent_panel.layer(slot5) or RaidGuiBase.FOREGROUND_LAYER
		self._params.blend_mode = params.blend_mode or "normal"
		self._panel = self._parent_panel
		self._params.panel = self._panel
		self._pointer_type = "arrow"
		self._on_mouse_enter_callback = params.on_mouse_enter_callback
		self._on_mouse_exit_callback = params.on_mouse_exit_callback
		self._autoconfirm = params.autoconfirm
		self._on_menu_move = params.on_menu_move
		self._selected_control = false
		slot5 = RaidMenuCallbackHandler
		self._callback_handler = RaidMenuCallbackHandler.new(self._panel)
		self._enabled = self._params.enabled or true
		self._selectable = self._params.selectable or true

		return 
	end
end
RaidGUIControl.name = function (self)
	return self._params.name
end
RaidGUIControl.set_param_value = function (self, param_name, param_value)
	self._params[param_name] = param_value

	return 
end
RaidGUIControl.create_border = function (self)
	if not self._object then
		return 
	end

	local border_thickness = 1.6
	local x = self._object.x(slot3)
	local y = self._object.y(self._object)
	local w = self._object.w(self._object)
	local h = self._object.h(self._object)
	slot9 = {
		name = "border_left",
		orientation = "vertical",
		layer = 2,
		x = x,
		y = y,
		w = border_thickness,
		h = h
	}
	self._border_left = self._parent_panel.gradient(self._object, self._parent_panel)
	slot9 = {
		0,
		Color(slot11, 0.19215686274509805, 0.23529411764705882),
		1,
		Color(slot11, 0.3137254901960784, 0.40784313725490196)
	}
	slot14 = 0.25098039215686274
	slot14 = 0.35294117647058826

	self._border_left.set_gradient_points(self._object, self._border_left)

	slot9 = {
		name = "border_right",
		orientation = "vertical",
		layer = 2,
		x = (x + w) - border_thickness,
		y = y,
		w = border_thickness,
		h = h
	}
	self._border_right = self._parent_panel.gradient(self._object, self._parent_panel)
	slot9 = {
		0,
		Color(slot11, 0.3058823529411765, 0.40784313725490196),
		1,
		Color(slot11, 0.3411764705882353, 0.35294117647058826)
	}
	slot14 = 0.36470588235294116
	slot14 = 0.3176470588235294

	self._border_right.set_gradient_points(self._object, self._border_right)

	slot9 = {
		name = "border_up",
		orientation = "horizontal",
		layer = 2,
		x = x,
		y = y,
		w = w,
		h = border_thickness
	}
	self._border_up = self._parent_panel.gradient(self._object, self._parent_panel)
	slot9 = {
		0,
		Color(slot11, 0.19215686274509805, 0.23529411764705882),
		0.38,
		Color(slot11, 0.34901960784313724, 0.34901960784313724),
		0.544,
		Color(slot11, 0.596078431372549, 0.6274509803921569),
		0.77,
		Color(slot11, 0.34901960784313724, 0.34901960784313724),
		1,
		Color(slot11, 0.3058823529411765, 0.40784313725490196)
	}
	slot14 = 0.25098039215686274
	slot14 = 0.3411764705882353
	slot14 = 0.5843137254901961
	slot14 = 0.3411764705882353
	slot14 = 0.36470588235294116

	self._border_up.set_gradient_points(self._object, self._border_up)

	slot9 = {
		name = "border_down",
		orientation = "horizontal",
		layer = 2,
		x = x,
		y = (y + h) - border_thickness,
		w = w,
		h = border_thickness
	}
	self._border_down = self._parent_panel.gradient(self._object, self._parent_panel)
	slot9 = {
		0,
		Color(slot11, 0.3137254901960784, 0.40784313725490196),
		0.3,
		Color(slot11, 0.596078431372549, 0.615686274509804),
		0.69,
		Color(slot11, 0.6039215686274509, 0.615686274509804),
		1,
		Color(slot11, 0.3411764705882353, 0.35294117647058826)
	}
	slot14 = 0.35294117647058826
	slot14 = 0.592156862745098
	slot14 = 0.5882352941176471
	slot14 = 0.3176470588235294

	self._border_down.set_gradient_points(self._object, self._border_down)

	return 
end
RaidGUIControl.remove_border = function (self)
	if self._object then
		slot3 = self._border_left
		slot4 = self._border_left

		self._border_left.parent(slot2).remove(slot2, self._border_left.parent(slot2))

		self._border_left = nil
		slot3 = self._border_right
		slot4 = self._border_right

		self._border_right.parent(slot2).remove(slot2, self._border_right.parent(slot2))

		self._border_right = nil
		slot3 = self._border_down
		slot4 = self._border_down

		self._border_down.parent(slot2).remove(slot2, self._border_down.parent(slot2))

		self._border_down = nil
		slot3 = self._border_up
		slot4 = self._border_up

		self._border_up.parent(slot2).remove(slot2, self._border_up.parent(slot2))

		self._border_up = nil
	end

	return 
end
RaidGUIControl.close = function (self)
	return 
end
RaidGUIControl.translate = function (self, text, upper_case_flag, additional_macros)
	local button_macros = nil

	if additional_macros then
		slot9 = managers.localization
		button_macros = clone(managers.localization.get_default_macros(slot8))
		slot7 = additional_macros

		for index, macro in pairs(slot6) do
			button_macros[index] = macro
		end
	else
		slot7 = managers.localization
		button_macros = managers.localization.get_default_macros(slot6)
	end

	slot9 = button_macros
	local result = managers.localization.text(slot6, managers.localization, text)

	if upper_case_flag then
		slot8 = result
		result = utf8.to_upper(slot7)
	end

	return result
end
RaidGUIControl._show_dialog_error_msg = function (self, error_title, error_msg)
	local dialog_data = {
		title = error_title,
		text = error_msg
	}
	local ok_button = {}
	slot8 = "dialog_ok"
	ok_button.text = managers.localization.text(slot6, managers.localization)
	dialog_data.button_list = {
		ok_button
	}
	ok_button.callback_func = function ()
		return 
	end
	slot8 = dialog_data

	managers.system_menu.show(slot6, managers.system_menu)

	return 
end
RaidGUIControl.inside = function (self, x, y)
	if self._object then
		slot7 = y

		if self._object.inside(slot4, self._object, x) then
			slot5 = self._object
			slot3 = self._object.tree_visible(slot4)
		end
	end

	return slot3
end
RaidGUIControl.mouse_moved = function (self, o, x, y)
	slot8 = y

	if self.inside(slot5, self, x) then
		if not self._mouse_inside then
			slot8 = y

			self.on_mouse_over(slot5, self, x)
		end

		slot9 = y

		self.on_mouse_moved(slot5, self, o, x)

		return true, self._pointer_type
	end

	if self._mouse_inside then
		slot8 = y

		self.on_mouse_out(slot5, self, x)
	end

	return false
end
RaidGUIControl.mouse_pressed = function (self, o, button, x, y)
	slot9 = y

	if self.inside(slot6, self, x) then
		slot10 = y

		return self.on_mouse_pressed(slot6, self, button, x)
	end

	return false
end
RaidGUIControl.mouse_clicked = function (self, o, button, x, y)
	slot9 = y

	if self.inside(slot6, self, x) then
		slot8 = button

		return self.on_mouse_clicked(slot6, self)
	end

	return false
end
RaidGUIControl.mouse_released = function (self, o, button, x, y)
	slot9 = y

	if self.inside(slot6, self, x) then
		slot8 = button

		return self.on_mouse_released(slot6, self)
	end

	return false
end
RaidGUIControl.mouse_scroll_up = function (self, o, button, x, y)
	slot9 = y

	if self.inside(slot6, self, x) then
		slot8 = button

		return self.on_mouse_scroll_up(slot6, self)
	end

	return false
end
RaidGUIControl.mouse_scroll_down = function (self, o, button, x, y)
	slot9 = y

	if self.inside(slot6, self, x) then
		slot8 = button

		return self.on_mouse_scroll_down(slot6, self)
	end

	return false
end
RaidGUIControl.mouse_double_click = function (self, o, button, x, y)
	slot9 = y

	if self.inside(slot6, self, x) and self.on_double_click then
		slot8 = button

		return self.on_double_click(slot6, self)
	end

	return false
end
RaidGUIControl.on_mouse_moved = function (self, o, x, y)
	return 
end
RaidGUIControl.on_mouse_over = function (self, x, y)
	self._mouse_inside = true
	slot5 = self

	self.highlight_on(slot4)

	if self._on_mouse_enter_callback then
		slot6 = self._data

		self._on_mouse_enter_callback(slot4, self)
	end

	return 
end
RaidGUIControl.on_mouse_out = function (self, x, y)
	self._mouse_inside = false
	slot5 = self

	self.highlight_off(slot4)

	if self._on_mouse_exit_callback then
		slot6 = self._data

		self._on_mouse_exit_callback(slot4, self)
	end

	return 
end
RaidGUIControl.on_mouse_pressed = function (self)
	return false
end
RaidGUIControl.on_mouse_clicked = function (self)
	return false
end
RaidGUIControl.on_mouse_released = function (self)
	return false
end
RaidGUIControl.on_mouse_double_click = function (self)
	return false
end
RaidGUIControl.on_mouse_scroll_up = function (self)
	return false
end
RaidGUIControl.on_mouse_scroll_down = function (self)
	return false
end
RaidGUIControl.highlight_on = function (self)
	if self._object and self._object.highlight_on then
		slot3 = self._object

		self._object.highlight_on(slot2)
	end

	return 
end
RaidGUIControl.highlight_off = function (self)
	if self._object and self._object.highlight_off then
		slot3 = self._object

		self._object.highlight_off(slot2)
	end

	return 
end
RaidGUIControl.show = function (self)
	slot3 = self._object

	self._object.show(slot2)

	return 
end
RaidGUIControl.hide = function (self)
	slot3 = self._object

	self._object.hide(slot2)

	return 
end
RaidGUIControl.center_x = function (self)
	slot3 = self._object

	return self._object.center_x(slot2)
end
RaidGUIControl.center_y = function (self)
	slot3 = self._object

	return self._object.center_y(slot2)
end
RaidGUIControl.set_center_x = function (self, x)
	slot5 = x

	self._object.set_center_x(slot3, self._object)

	return 
end
RaidGUIControl.set_center_y = function (self, y)
	slot5 = y

	self._object.set_center_y(slot3, self._object)

	return 
end
RaidGUIControl.set_center = function (self, x, y)
	slot7 = y

	self._object.set_center(slot4, self._object, x)

	return 
end
RaidGUIControl.rotate = function (self, angle)
	slot5 = angle

	self._object.rotate(slot3, self._object)

	return 
end
RaidGUIControl.set_rotation = function (self, angle)
	slot5 = angle

	self._object.set_rotation(slot3, self._object)

	return 
end
RaidGUIControl.rotation = function (self)
	slot3 = self._object

	return self._object.rotation(slot2)
end
RaidGUIControl.set_visible = function (self, visible)
	slot5 = visible

	self._object.set_visible(slot3, self._object)

	return 
end
RaidGUIControl.visible = function (self)
	if self._object.alive then
		if self._object.alive then
			slot3 = self._object

			if alive(slot2) then
				slot3 = self._object
				slot1 = self._object.visible(slot2)
			end
		end

		return slot1
	else
		slot3 = self._object

		return self._object.visible(slot2)
	end

	return 
end
RaidGUIControl.set_selectable = function (self, value)
	self._selectable = value

	return 
end
RaidGUIControl.selectable = function (self)
	return self._selectable
end
RaidGUIControl.set_alpha = function (self, alpha)
	if self._object.set_alpha then
		slot5 = alpha

		self._object.set_alpha(slot3, self._object)
	end

	return 
end
RaidGUIControl.alpha = function (self)
	if self._object.alpha then
		slot3 = self._object

		return self._object.alpha(slot2)
	end

	return nil
end
RaidGUIControl.set_x = function (self, x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	return 
end
RaidGUIControl.set_top = function (self, value)
	slot5 = value

	self._object.set_top(slot3, self._object)

	return 
end
RaidGUIControl.set_bottom = function (self, value)
	slot5 = value

	self._object.set_bottom(slot3, self._object)

	return 
end
RaidGUIControl.set_right = function (self, value)
	slot5 = value

	self._object.set_right(slot3, self._object)

	return 
end
RaidGUIControl.set_left = function (self, value)
	slot5 = value

	self._object.set_left(slot3, self._object)

	return 
end
RaidGUIControl.set_y = function (self, y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
RaidGUIControl.set_w = function (self, w)
	slot5 = w

	self._object.set_w(slot3, self._object)

	return 
end
RaidGUIControl.set_h = function (self, h)
	slot5 = h

	self._object.set_h(slot3, self._object)

	return 
end
RaidGUIControl.w = function (self)
	slot3 = self._object

	return self._object.w(slot2)
end
RaidGUIControl.h = function (self)
	slot3 = self._object

	return self._object.h(slot2)
end
RaidGUIControl.x = function (self)
	slot3 = self._object

	return self._object.x(slot2)
end
RaidGUIControl.y = function (self)
	slot3 = self._object

	return self._object.y(slot2)
end
RaidGUIControl.world_x = function (self)
	slot3 = self._object

	return self._object.world_x(slot2)
end
RaidGUIControl.world_y = function (self)
	slot3 = self._object

	return self._object.world_y(slot2)
end
RaidGUIControl.layer = function (self)
	slot3 = self._object

	return self._object.layer(slot2)
end
RaidGUIControl.set_layer = function (self, layer)
	slot5 = layer

	return self._object._engine_panel.set_layer(slot3, self._object._engine_panel)
end
RaidGUIControl.left = function (self)
	slot3 = self._object

	return self._object.left(slot2)
end
RaidGUIControl.right = function (self)
	slot3 = self._object

	return self._object.right(slot2)
end
RaidGUIControl.top = function (self)
	slot3 = self._object

	return self._object.top(slot2)
end
RaidGUIControl.bottom = function (self)
	slot3 = self._object

	return self._object.bottom(slot2)
end
RaidGUIControl.set_selected = function (self, value)
	self._selected = value

	if self._selected then
		slot4 = self

		self.highlight_on(slot3)
	else
		slot4 = self

		self.highlight_off(slot3)
	end

	return 
end
RaidGUIControl.is_selected = function (self)
	return self._selected
end
RaidGUIControl.move_up = function (self)
	if self._selected and self._on_menu_move and self._on_menu_move.up then
		slot5 = "up"

		return self._menu_move_to(slot2, self, self._on_menu_move.up)
	end

	return 
end
RaidGUIControl.move_down = function (self)
	if self._selected and self._on_menu_move and self._on_menu_move.down then
		slot5 = "down"

		return self._menu_move_to(slot2, self, self._on_menu_move.down)
	end

	return 
end
RaidGUIControl.move_left = function (self)
	if self._selected and self._on_menu_move and self._on_menu_move.left then
		slot5 = "left"

		return self._menu_move_to(slot2, self, self._on_menu_move.left)
	end

	return 
end
RaidGUIControl.move_right = function (self)
	if self._selected and self._on_menu_move and self._on_menu_move.right then
		slot5 = "right"

		return self._menu_move_to(slot2, self, self._on_menu_move.right)
	end

	return 
end
RaidGUIControl.scroll_up = function (self)
	return false
end
RaidGUIControl.scroll_down = function (self)
	return false
end
RaidGUIControl.scroll_left = function (self)
	return false
end
RaidGUIControl.scroll_right = function (self)
	return false
end
RaidGUIControl.special_btn_pressed = function (self, ...)
	return 
end
RaidGUIControl.set_menu_move_controls = function (self, controls)
	self._on_menu_move = controls

	return 
end
RaidGUIControl._menu_move_to = function (self, target_control_name, direction)
	local component_controls = managers.menu_component._active_controls
	slot6 = component_controls

	for _, controls in pairs(slot5) do
		slot11 = controls

		for _, control in pairs(slot10) do
			if control._name == target_control_name then
				slot16 = control

				if control.visible(slot15) then
					slot16 = control
				else
					slot18 = direction

					return self._find_next_visible_control(slot15, self, control)
				end
			end
		end
	end

	return nil, target_control_name
end
RaidGUIControl._find_next_visible_control = function (self, control_ref, direction)
	local next_control_name = control_ref and control_ref._on_menu_move and control_ref._on_menu_move[direction]

	if next_control_name then
		slot8 = direction

		self._menu_move_to(slot5, self, next_control_name)
	else
		return false
	end

	return 
end
RaidGUIControl.confirm_pressed = function (self)
	return 
end
RaidGUIControl.check_item_availability = function (self, item, availability_flags)
	if not availability_flags then
		return true
	end

	if not self._callback_handler then
		slot5 = RaidMenuCallbackHandler
		slot3 = RaidMenuCallbackHandler.new(slot4)
	end

	self._callback_handler = slot3
	local result = true
	slot6 = availability_flags

	for _, availability_flag in pairs(slot5) do
		slot13 = availability_flag
		local availability_callback = callback(slot10, self._callback_handler, self._callback_handler)

		if availability_callback then
			result = result and availability_callback()
		end
	end

	return result
end
RaidGUIControl.scrollable_area_post_setup = function (self, params)
	return 
end
RaidGUIControl.enabled = function (self)
	return self._enabled
end
RaidGUIControl.set_enabled = function (self, enabled)
	self._enabled = enabled

	return 
end

return 
