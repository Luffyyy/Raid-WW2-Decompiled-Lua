-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
HuskPlayerDamage = HuskPlayerDamage or class()
HuskPlayerDamage.init = function (self, unit)
	self._unit = unit
	slot4 = unit
	slot7 = "Spine2"
	self._spine2_obj = unit.get_object(slot3, Idstring(slot6))
	slot4 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(slot3)
	self._mission_damage_blockers = {}
	self._health_ratio = 1

	return 
end
HuskPlayerDamage.set_health_ratio = function (self, value)
	self._health_ratio = value

	return 
end
HuskPlayerDamage.health_ratio = function (self)
	return self._health_ratio
end
HuskPlayerDamage._call_listeners = function (self, damage_info)
	slot5 = damage_info

	CopDamage._call_listeners(slot3, self)

	return 
end
HuskPlayerDamage.add_listener = function (self, ...)
	slot3 = self

	CopDamage.add_listener(slot2, ...)

	return 
end
HuskPlayerDamage.remove_listener = function (self, key)
	slot5 = key

	CopDamage.remove_listener(slot3, self)

	return 
end
HuskPlayerDamage.sync_damage_bullet = function (self, attacker_unit, damage, i_body, height_offset)

	-- Decompilation error in this vicinity:
	local attack_data = {
		attacker_unit = attacker_unit,
		attack_dir = slot6
	}
	slot10 = self._unit
	slot10 = self._unit.movement(slot9)
	attack_data.pos = mvector3.copy(self._unit.movement(slot9).m_head_pos(slot9))
	attack_data.result = {
		variant = "bullet",
		type = "hurt"
	}
	slot9 = attack_data

	self._call_listeners(slot7, self)

	return 
end
HuskPlayerDamage.shoot_pos_mid = function (self, m_pos)
	slot5 = m_pos

	self._spine2_obj.m_position(slot3, self._spine2_obj)

	return 
end
HuskPlayerDamage.can_attach_projectiles = function (self)
	return false
end
HuskPlayerDamage.set_last_down_time = function (self, down_time)
	self._last_down_time = down_time

	return 
end
HuskPlayerDamage.down_time = function (self)
	return self._last_down_time
end
HuskPlayerDamage.arrested = function (self)
	slot3 = self._unit
	slot3 = self._unit.movement(slot2)

	return self._unit.movement(slot2).current_state_name(slot2) == "arrested"
end
HuskPlayerDamage.incapacitated = function (self)
	slot3 = self._unit
	slot3 = self._unit.movement(slot2)

	return self._unit.movement(slot2).current_state_name(slot2) == "incapacitated"
end
HuskPlayerDamage.set_mission_damage_blockers = function (self, type, state)
	self._mission_damage_blockers[type] = state

	return 
end
HuskPlayerDamage.get_mission_blocker = function (self, type)
	return self._mission_damage_blockers[type]
end
HuskPlayerDamage.dead = function (self)
	return 
end

return 
