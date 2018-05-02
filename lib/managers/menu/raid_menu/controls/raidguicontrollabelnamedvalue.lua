if not RaidGUIControlLabelNamedValue then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlLabelNamedValue = slot0
RaidGUIControlLabelNamedValue.init = function (self, parent, params)
	slot6 = params
	self._object = parent.panel(slot4, parent)
	slot5 = params
	self._params = clone(slot4)
	params.align = params.value_align or "center"
	local label_value_params = clone(slot4)
	label_value_params.font = tweak_data.gui.fonts.din_compressed
	label_value_params.font_size = params.value_font_size or tweak_data.gui.font_sizes.size_56
	label_value_params.h = label_value_params.font_size
	label_value_params.text = label_value_params.value or label_value_params.text
	label_value_params.x = 0
	label_value_params.y = 0
	label_value_params.w = nil
	label_value_params.text = params.value_text or ""
	label_value_params.color = params.value_color or tweak_data.gui.colors.raid_white
	slot7 = label_value_params
	self._label_value = self._object.text(params, self._object)
	params.align = params.align or "center"
	slot6 = params
	local label_text_params = clone(params)
	label_text_params.font_size = params.font_size or tweak_data.gui.font_sizes.medium
	label_text_params.x = 0
	label_text_params.y = label_value_params.font_size + (label_text_params.value_padding or 0)
	label_text_params.h = label_text_params.font_size + 3
	label_text_params.w = nil
	label_text_params.text = params.text or ""
	label_text_params.color = params.color or tweak_data.gui.colors.raid_white
	slot8 = label_text_params
	self._label_text = self._object.label(label_text_params.value_padding or 0, self._object)

	return 
end
RaidGUIControlLabelNamedValue.set_text = function (self, text)
	self._text = text
	slot5 = text

	self._label_text.set_text(slot3, self._label_text)

	return 
end
RaidGUIControlLabelNamedValue.text = function (self)
	slot3 = self._label_text

	return self._label_text.text(slot2)
end
RaidGUIControlLabelNamedValue.set_value = function (self, text)
	slot5 = text

	self._label_value.set_text(slot3, self._label_value)

	slot4 = self._label_value
	local _, _, w, _ = self._label_value.text_rect(slot3)
	slot9 = w

	self._label_value.set_w(slot7, self._label_value)

	slot11 = self._object
	slot9 = self._object.w(slot10) / 2

	self._label_value.set_center_x(slot7, self._label_value)

	return 
end
RaidGUIControlLabelNamedValue.value = function (self)
	slot3 = self._label_value

	return self._label_value.text(slot2)
end
RaidGUIControlLabelNamedValue.highlight_on = function (self)
	return 
end
RaidGUIControlLabelNamedValue.highlight_off = function (self)
	return 
end
RaidGUIControlLabelNamedValue.mouse_released = function (self, o, button, x, y)
	return false
end
RaidGUIControlLabelNamedValue.set_label_color = function (self, color)
	slot5 = color

	self._label_value.set_color(slot3, self._label_value)

	slot5 = color

	self._label_text.set_color(slot3, self._label_text)

	return 
end
RaidGUIControlLabelNamedValue.set_label_default_color = function (self)
	slot4 = self._params.value_color or tweak_data.gui.colors.raid_white

	self._label_value.set_color(slot2, self._label_value)

	slot4 = self._params.color or tweak_data.gui.colors.raid_white

	self._label_text.set_color(slot2, self._label_text)

	return 
end

return 
