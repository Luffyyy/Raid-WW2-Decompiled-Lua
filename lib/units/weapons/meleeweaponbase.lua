if not MeleeWeaponBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

MeleeWeaponBase = slot0
MeleeWeaponBase.EVENT_IDS = {
	detonate = 1
}
local mvec1 = Vector3()
local mvec2 = Vector3()
MeleeWeaponBase.setup = function (self, unit, t, dt)
	return 
end
MeleeWeaponBase.update = function (self, unit, t, dt)
	slot9 = dt

	MeleeWeaponBase.super.update(slot5, self, unit, t)

	return 
end
MeleeWeaponBase.get_name_id = function (self)
	return self.name_id
end
MeleeWeaponBase.is_melee_weapon = function (self)
	return true
end
MeleeWeaponBase.get_use_data = function (self, character_setup)
	local use_data = {
		equip = {
			align_place = "right_hand"
		}
	}
	slot5 = self
	use_data.selection_index = self.selection_index(slot4)
	use_data.unequip = {
		align_place = "back"
	}

	return use_data
end
MeleeWeaponBase.tweak_data_anim_play = function (self, anim, ...)
	slot4 = self
	local animations = self.weapon_tweak_data(slot3).animations

	if animations and animations[anim] then
		slot6 = animations[anim]

		self.anim_play(slot4, self, ...)

		return true
	end

	return false
end
MeleeWeaponBase.anim_play = function (self, anim, speed_multiplier)
	if anim then
		slot5 = self._unit
		slot8 = anim
		local length = self._unit.anim_length(slot4, Idstring(slot7))
		speed_multiplier = speed_multiplier or 1
		slot6 = self._unit
		slot9 = anim

		self._unit.anim_stop(slot5, Idstring(slot8))

		slot9 = anim
		slot9 = speed_multiplier

		self._unit.anim_play_to(slot5, self._unit, Idstring(slot8), length)
	end

	return 
end
MeleeWeaponBase.tweak_data_anim_stop = function (self, anim, ...)
	slot4 = self
	local animations = self.weapon_tweak_data(slot3).animations

	if animations and animations[anim] then
		slot8 = self
		slot6 = self.weapon_tweak_data(slot7).animations[anim]

		self.anim_stop(slot4, self, ...)

		return true
	end

	return false
end
MeleeWeaponBase.anim_stop = function (self, anim)
	slot4 = self._unit
	slot7 = anim

	self._unit.anim_stop(slot3, Idstring(slot6))

	return 
end
MeleeWeaponBase.ammo_info = function (self)
	return 
end
MeleeWeaponBase.add_ammo = function (self, ratio, add_amount_override, add_amount_multiplier)
	return false, 0
end
MeleeWeaponBase.add_ammo_from_bag = function (self, available)
	return 0
end
MeleeWeaponBase.on_equip = function (self)
	return 
end
MeleeWeaponBase.on_unequip = function (self)
	return 
end
MeleeWeaponBase.on_enabled = function (self)
	self._enabled = true

	return 
end
MeleeWeaponBase.on_disabled = function (self)
	self._enabled = false

	return 
end
MeleeWeaponBase.enabled = function (self)
	return self._enabled
end
MeleeWeaponBase.get_stance_id = function (self)
	slot3 = self

	return self.weapon_tweak_data(slot2).stance
end
MeleeWeaponBase.transition_duration = function (self)
	slot3 = self

	return self.weapon_tweak_data(slot2).transition_duration
end
MeleeWeaponBase.enter_steelsight_speed_multiplier = function (self)
	return 1
end
MeleeWeaponBase.exit_run_speed_multiplier = function (self)
	slot3 = self

	return self.weapon_tweak_data(slot2).exit_run_speed_multiplier
end
MeleeWeaponBase.weapon_tweak_data = function (self)
	return tweak_data.blackmarket.melee_weapons[self.name_id]
end
MeleeWeaponBase.weapon_hold = function (self)
	slot3 = self

	return self.weapon_tweak_data(slot2).weapon_hold
end
MeleeWeaponBase.selection_index = function (self)
	return PlayerInventory.SLOT_4
end
MeleeWeaponBase.has_range_distance_scope = function (self)
	return false
end
MeleeWeaponBase.movement_penalty = function (self)
	slot3 = self

	return self.weapon_tweak_data(slot2).weapon_movement_penalty or 1
end
MeleeWeaponBase.set_visibility_state = function (self, state)
	slot5 = state

	self._unit.set_visible(slot3, self._unit)

	return 
end
MeleeWeaponBase.start_shooting_allowed = function (self)
	return true
end
MeleeWeaponBase.save = function (self, data)
	return 
end
MeleeWeaponBase.load = function (self, data)
	return 
end
MeleeWeaponBase.uses_ammo = function (self)
	return false
end
MeleeWeaponBase.replenish = function (self)
	return 
end
MeleeWeaponBase.get_aim_assist = function (self)
	return 
end

return 
