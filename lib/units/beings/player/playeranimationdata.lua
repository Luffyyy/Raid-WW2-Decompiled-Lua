PlayerAnimationData = PlayerAnimationData or class()
PlayerAnimationData.init = function (self, unit)
	self._unit = unit

	return 
end
PlayerAnimationData.anim_clbk_footstep_l = function (self, unit)
	self._footstep = "l"
	slot4 = unit
	slot5 = "left"

	unit.base(slot3).anim_data_clbk_footstep(slot3, unit.base(slot3))

	return 
end
PlayerAnimationData.anim_clbk_footstep_r = function (self, unit)
	self._footstep = "r"
	slot4 = unit
	slot5 = "right"

	unit.base(slot3).anim_data_clbk_footstep(slot3, unit.base(slot3))

	return 
end
PlayerAnimationData.anim_clbk_startfoot_l = function (self, unit)
	self._footstep = "l"

	return 
end
PlayerAnimationData.anim_clbk_startfoot_r = function (self, unit)
	self._footstep = "r"

	return 
end
PlayerAnimationData.foot = function (self)
	return self._footstep
end
PlayerAnimationData.anim_clbk_upper_body_empty = function (self, unit)
	slot4 = unit
	slot4 = unit.anim_state_machine(slot3)
	slot7 = "upper_body"

	unit.anim_state_machine(slot3).stop_segment(slot3, Idstring(slot6))

	return 
end
PlayerAnimationData.anim_clbk_base_empty = function (self, unit)
	slot4 = unit
	slot4 = unit.anim_state_machine(slot3)
	slot7 = "base"

	unit.anim_state_machine(slot3).stop_segment(slot3, Idstring(slot6))

	return 
end
PlayerAnimationData.anim_clbk_death_exit = function (self, unit)
	slot4 = unit
	slot4 = unit.movement(slot3)

	unit.movement(slot3).on_death_exit(slot3)

	slot4 = unit
	slot4 = unit.base(slot3)

	unit.base(slot3).on_death_exit(slot3)

	slot4 = unit

	if unit.inventory(slot3) then
		slot4 = unit
		slot4 = unit.inventory(slot3)

		unit.inventory(slot3).on_death_exit(slot3)
	end

	return 
end

return 
