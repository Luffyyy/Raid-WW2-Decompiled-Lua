slot2 = CopLogicBase
CopLogicTurret = class(slot1)
CopLogicTurret.enter = function (data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	data.internal_data = my_data
	slot6 = data.unit
	slot7 = false

	data.unit.inventory(slot5).set_weapon_enabled(slot5, data.unit.inventory(slot5))

	return 
end
CopLogicTurret.exit = function (data, new_logic_name, enter_params)
	slot6 = "*** CopLogicTurret.exit"

	Application.debug(slot4, Application)

	local my_data = data.internal_data
	slot6 = my_data

	CopLogicBase.cancel_delayed_clbks(Application)

	slot8 = enter_params

	CopLogicBase.exit(Application, data, new_logic_name)

	return 
end
CopLogicTurret.is_available_for_assignment = function (data)
	return false
end
CopLogicTurret.on_enemy_weapons_hot = function (data)
	slot4 = "*** CopLogicTurret.on_enemy_weapons_hot"

	Application.debug(slot2, Application)

	return 
end
CopLogicTurret._register_attention = function (data, my_data)
	slot5 = "*** CopLogicTurret._register_attention"

	Application.debug(slot3, Application)

	return 
end
CopLogicTurret._set_interaction = function (data, my_data)
	slot5 = "*** CopLogicTurret._set_interaction"

	Application.debug(slot3, Application)

	return 
end
CopLogicTurret.queued_update = function (data)
	slot4 = "*** CopLogicTurret.queued_update"

	Application.debug(slot2, Application)

	return 
end
CopLogicTurret.on_intimidated = function (data, amount, aggressor_unit)
	slot6 = "*** CopLogicTurret.on_intimidated"

	Application.debug(slot4, Application)

	return 
end
CopLogicTurret.death_clbk = function (data, damage_info)
	slot4 = data.unit

	if data.unit.unit_data(slot3).turret_weapon then
		slot4 = data.unit
		slot6 = damage_info

		data.unit.unit_data(slot3).turret_weapon.on_puppet_death(slot3, data.unit.unit_data(slot3).turret_weapon, data)
	end

	return 
end
CopLogicTurret.on_intimidated = function (data, amount, aggressor_unit)
	slot6 = "*** CopLogicTurret.on_intimidated"

	Application.debug(slot4, Application)

	return 
end
CopLogicTurret.damage_clbk = function (data, damage_info)
	slot4 = data.unit

	if data.unit.unit_data(slot3).turret_weapon then
		slot4 = data.unit
		slot6 = damage_info

		data.unit.unit_data(slot3).turret_weapon.on_puppet_damaged(slot3, data.unit.unit_data(slot3).turret_weapon, data)
	end

	return 
end
CopLogicTurret.on_suppressed_state = function (data)
	slot4 = "*** CopLogicTurret.on_suppressed_state"

	Application.debug(slot2, Application)

	return 
end

return 
