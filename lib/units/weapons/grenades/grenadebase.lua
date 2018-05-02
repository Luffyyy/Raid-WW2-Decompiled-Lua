-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not GrenadeBase then
	slot2 = ProjectileBase
	slot0 = class(slot1)
end

GrenadeBase = slot0
GrenadeBase.EVENT_IDS = {
	detonate = 1
}
local mvec1 = Vector3()
local mvec2 = Vector3()
GrenadeBase._setup_server_data = function (self)
	slot4 = "trip_mine_targets"
	self._slot_mask = managers.slot.get_mask(slot2, managers.slot)

	if self._init_timer then
		self._timer = self._init_timer
	end

	return 
end
GrenadeBase.setup = function (self, unit, t, dt)
	return 
end
GrenadeBase.update = function (self, unit, t, dt)
	if self._hand_held then
		return 
	end

	if self._timer then
		self._timer = self._timer - dt

		if self._timer <= 0 then
			self._timer = nil
			slot6 = self

			self._detonate(slot5)

			return 
		end
	end

	slot9 = dt

	GrenadeBase.super.update(slot5, self, unit, t)

	return 
end
GrenadeBase.clbk_impact = function (self, ...)
	slot3 = self

	self._detonate(slot2)

	return 
end
GrenadeBase._on_collision = function (self, col_ray)
	slot4 = self

	self._detonate(slot3)

	return 
end
GrenadeBase._detonate = function (self)
	slot3 = "no _detonate function for grenade base"

	print(slot2)

	return 
end
GrenadeBase._detonate_on_client = function (self)
	slot3 = "no _detonate_on_client function for grenade base"

	print(slot2)

	return 
end
GrenadeBase.sync_net_event = function (self, event_id)
	if event_id == GrenadeBase.EVENT_IDS.detonate then
		slot4 = self

		self._detonate_on_client(slot3)
	end

	return 
end
GrenadeBase.throw = function (self, ...)
	GrenadeBase.super.throw(slot2, ...)

	slot4 = self
	local weapon_id = tweak_data.projectiles[self.projectile_entry(self)].weapon_id

	if weapon_id then
		slot5 = {
			hit = false,
			name_id = weapon_id
		}

		managers.statistics.shot_fired(slot3, managers.statistics)
	end

	return 
end
GrenadeBase.add_damage_result = function (self, unit, is_dead, damage_percent)

	-- Decompilation error in this vicinity:
	slot6 = self._thrower_unit
	local unit_type = unit.base(slot5)._tweak_table
	slot7 = unit
	local is_civlian = unit.character_damage(unit).is_civilian(unit)
	slot8 = unit
	local is_gangster = unit.character_damage(unit_type).is_gangster(unit_type)
	slot9 = unit
	slot9 = unit_type
	local is_cop = unit.character_damage(unit_type).is_cop(unit_type)

	if is_civlian then
		return 
	end

	slot11 = self
	local weapon_id = tweak_data.projectiles[self.projectile_entry(slot10)].weapon_id

	if weapon_id and not self._recorded_hit then
		slot12 = {
			skip_bullet_count = true,
			hit = true,
			name_id = weapon_id
		}

		managers.statistics.shot_fired(slot10, managers.statistics)

		self._recorded_hit = true
	end

	table.insert(slot10, self._damage_results)

	local hit_count = #self._damage_results
	local kill_count = 0
	slot13 = self._damage_results

	for i, death in ipairs(is_dead) do
		kill_count = kill_count + ((death and 1) or 0)
	end

	return 
end
GrenadeBase.get_use_data = function (self, character_setup)
	local use_data = {
		equip = {
			align_place = "right_hand"
		},
		selection_index = 3,
		unequip = {
			align_place = "back"
		}
	}

	return use_data
end
GrenadeBase.tweak_data_anim_play = function (self, anim, ...)
	slot4 = self
	local animations = self.weapon_tweak_data(slot3).animations

	if animations and animations[anim] then
		slot6 = animations[anim]

		self.anim_play(slot4, self, ...)

		return true
	end

	return false
end
GrenadeBase.anim_play = function (self, anim, speed_multiplier)
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
GrenadeBase.tweak_data_anim_stop = function (self, anim, ...)
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
GrenadeBase.anim_stop = function (self, anim)
	slot4 = self._unit
	slot7 = anim

	self._unit.anim_stop(slot3, Idstring(slot6))

	return 
end
GrenadeBase.melee_damage_info = function (self)
	slot3 = self
	local my_tweak_data = self.weapon_tweak_data(slot2)

	return my_tweak_data.damage_melee, my_tweak_data.damage_melee_effect_mul
end
GrenadeBase.ammo_info = function (self)
	return 
end
GrenadeBase.add_ammo = function (self, ratio, add_amount_override, add_amount_multiplier)
	return false, 0
end
GrenadeBase.add_ammo_from_bag = function (self, available)
	return 0
end
GrenadeBase.set_hand_held = function (self, value)
	self._hand_held = value

	return 
end
GrenadeBase.on_equip = function (self)
	return 
end
GrenadeBase.on_unequip = function (self)
	return 
end
GrenadeBase.on_enabled = function (self)
	self._enabled = true

	return 
end
GrenadeBase.on_disabled = function (self)
	self._enabled = false

	return 
end
GrenadeBase.enabled = function (self)
	return self._enabled
end
GrenadeBase.get_stance_id = function (self)
	slot3 = self

	return self.weapon_tweak_data(slot2).stance
end
GrenadeBase.transition_duration = function (self)
	slot3 = self

	return self.weapon_tweak_data(slot2).transition_duration
end
GrenadeBase.enter_steelsight_speed_multiplier = function (self)
	return 1
end
GrenadeBase.exit_run_speed_multiplier = function (self)
	slot3 = self

	return self.weapon_tweak_data(slot2).exit_run_speed_multiplier
end
GrenadeBase.weapon_tweak_data = function (self)
	return tweak_data.projectiles[self.name_id]
end
GrenadeBase.weapon_hold = function (self)
	slot3 = self

	return self.weapon_tweak_data(slot2).weapon_hold
end
GrenadeBase.selection_index = function (self)
	return PlayerInventory.SLOT_3
end
GrenadeBase.has_range_distance_scope = function (self)
	return false
end
GrenadeBase.set_visibility_state = function (self, state)
	slot5 = state

	self._unit.set_visible(slot3, self._unit)

	return 
end
GrenadeBase.movement_penalty = function (self)
	slot3 = self

	return self.weapon_tweak_data(slot2).weapon_movement_penalty or 1
end
GrenadeBase.clbk_impact = function (self, tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	slot29 = damage

	self._detonate(slot15, self, tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, ...)

	return 
end
GrenadeBase.start_shooting_allowed = function (self)
	return true
end
GrenadeBase.save = function (self, data)
	local state = {
		timer = self._timer
	}
	data.GrenadeBase = state

	return 
end
GrenadeBase.load = function (self, data)
	local state = data.GrenadeBase
	self._timer = state.timer

	return 
end
GrenadeBase.uses_ammo = function (self)
	return false
end
GrenadeBase.replenish = function (self)
	slot3 = managers.blackmarket
	local name, amount = managers.blackmarket.equipped_grenade(slot2)
	slot6 = amount

	managers.player.add_grenade_amount(slot4, managers.player)

	return 
end

return 
