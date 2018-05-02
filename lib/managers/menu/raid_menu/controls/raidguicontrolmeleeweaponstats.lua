if not RaidGUIControlMeleeWeaponStats then
	slot2 = RaidGUIControlWeaponStats
	slot0 = class(slot1)
end

RaidGUIControlMeleeWeaponStats = slot0
RaidGUIControlMeleeWeaponStats.init = function (self, parent, params)
	slot7 = params

	RaidGUIControlMeleeWeaponStats.super.init(slot4, self, parent)

	return 
end
RaidGUIControlMeleeWeaponStats._set_default_values = function (self)
	slot7 = true
	slot7 = true
	slot7 = true
	slot7 = true
	self._values = {
		damage = {
			value = "00-000",
			text = self.translate(slot4, self, "menu_weapons_stats_damage")
		},
		knockback = {
			value = "00-000",
			text = self.translate(slot4, self, "menu_weapons_stats_knockback")
		},
		range = {
			value = "000",
			text = self.translate(slot4, self, "menu_weapons_stats_range")
		},
		charge_time = {
			value = "00",
			text = self.translate(slot4, self, "menu_weapons_stats_charge_time")
		}
	}

	return 
end
RaidGUIControlMeleeWeaponStats._get_tabs_params = function (self)
	local tabs_params = {
		{
			name = "damage",
			text = self._values.damage.text,
			value = self._values.damage.value
		},
		{
			name = "knockback",
			text = self._values.knockback.text,
			value = self._values.knockback.value
		},
		{
			name = "range",
			text = self._values.range.text,
			value = self._values.range.value
		},
		{
			name = "charge_time",
			text = self._values.charge_time.text,
			value = self._values.charge_time.value
		}
	}

	return tabs_params
end
RaidGUIControlMeleeWeaponStats.set_stats = function (self, damage, knockback, range, charge_time)
	self._values.damage.value = damage
	self._values.knockback.value = knockback
	self._values.range.value = range
	self._values.charge_time.value = charge_time
	slot7 = self._items

	for _, item in ipairs(slot6) do
		slot12 = item
		local name = item.name(slot11)
		local value = self._values[name].value
		slot15 = value

		item.set_value(slot13, item)
	end

	return 
end
RaidGUIControlMeleeWeaponStats.refresh_data = function (self)
	slot4 = "[RaidGUIControlMeleeWeaponStats:refresh_data]"

	Application.trace(slot2, Application)

	return 
end
RaidGUIControlMeleeWeaponStats._create_bottom_line = function (self)
	return 
end
RaidGUIControlMeleeWeaponStats._initial_tab_selected = function (self, tab_idx)
	return 
end
RaidGUIControlMeleeWeaponStats._tab_selected = function (self, tab_idx, callback_param)
	return 
end
RaidGUIControlMeleeWeaponStats._unselect_all = function (self)
	return 
end
RaidGUIControlMeleeWeaponStats.set_selected = function (self, value)
	slot5 = "[RaidGUIControlMeleeWeaponStats:set_selected] weapon stats control can't be selected"

	Application.error(slot3, Application)

	self._selected = false

	return 
end
RaidGUIControlMeleeWeaponStats.move_up = function (self)
	return 
end
RaidGUIControlMeleeWeaponStats.move_down = function (self)
	return 
end
RaidGUIControlMeleeWeaponStats.move_left = function (self)
	return 
end
RaidGUIControlMeleeWeaponStats.move_right = function (self)
	return 
end
RaidGUIControlMeleeWeaponStats.highlight_on = function (self)
	return 
end
RaidGUIControlMeleeWeaponStats.highlight_off = function (self)
	return 
end
RaidGUIControlMeleeWeaponStats.mouse_released = function (self, o, button, x, y)
	return false
end

return 
