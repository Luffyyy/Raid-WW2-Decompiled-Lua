if not RaidGUIControlTabWeaponStats then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlTabWeaponStats = slot0
RaidGUIControlTabWeaponStats.init = function (self, parent, params)
	slot7 = params

	RaidGUIControlTabWeaponStats.super.init(slot4, self, parent)

	slot6 = params
	self._object = parent.panel(slot4, parent)
	params.x = 0
	params.y = 0
	slot7 = params
	self._label = self._object.create_custom_control(slot4, self._object, params.label_class or RaidGUIControlLabelNamedValue)
	self._callback_param = nil
	self._tab_select_callback = nil
	self._selected = false

	return 
end
RaidGUIControlTabWeaponStats.set_text = function (self, text)
	self._text = text
	slot5 = text

	self._label.set_text(slot3, self._label)

	return 
end
RaidGUIControlTabWeaponStats.text = function (self)
	slot3 = self._label

	return self._label.text(slot2)
end
RaidGUIControlTabWeaponStats.set_value = function (self, text)
	slot5 = text

	self._label.set_value(slot3, self._label)

	return 
end
RaidGUIControlTabWeaponStats.value = function (self)
	slot3 = self._label

	return self._label.value(slot2)
end
RaidGUIControlTabWeaponStats.set_value_delta = function (self, text)
	slot5 = text

	self._label.set_value_delta(slot3, self._label)

	return 
end
RaidGUIControlTabWeaponStats.value_delta = function (self)
	slot3 = self._label

	return self._label.value_delta(slot2)
end
RaidGUIControlTabWeaponStats.needs_divider = function (self)
	return false
end
RaidGUIControlTabWeaponStats.needs_bottom_line = function (self)
	return false
end
RaidGUIControlTabWeaponStats.get_callback_param = function (self)
	return nil
end
RaidGUIControlTabWeaponStats.highlight_on = function (self)
	return 
end
RaidGUIControlTabWeaponStats.highlight_off = function (self)
	return 
end
RaidGUIControlTabWeaponStats.select = function (self)
	self._selected = false

	return 
end
RaidGUIControlTabWeaponStats.unselect = function (self)
	self._selected = false

	return 
end
RaidGUIControlTabWeaponStats.mouse_released = function (self, o, button, x, y)
	return false
end
RaidGUIControlTabWeaponStats.on_mouse_released = function (self, button, x, y)
	return false
end
RaidGUIControlTabWeaponStats.set_color = function (self, color)
	slot5 = color

	self._label.set_label_color(slot3, self._label)

	return 
end
RaidGUIControlTabWeaponStats.set_label_default_color = function (self)
	slot3 = self._label

	self._label.set_label_default_color(slot2)

	return 
end

return 
