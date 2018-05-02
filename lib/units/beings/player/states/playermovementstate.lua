-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
PlayerMovementState = PlayerMovementState or class()
PlayerMovementState.init = function (self, unit)
	self._unit = unit

	return 
end
PlayerMovementState.enter = function (self, state_data, enter_data)
	return 
end
PlayerMovementState.exit = function (self, state_data)
	return 
end
PlayerMovementState.update = function (self, t, dt)
	return 
end
PlayerMovementState.chk_action_forbidden = function (self, action_type)
	if self._current_action then
		local unblock_data = self._current_action["unblock_" .. action_type .. "_t"]

		if unblock_data then
		end
	end

	return 
end
PlayerMovementState._reset_delay_action = function (self)
	self._delay_action = nil

	return 
end
PlayerMovementState._set_delay_action = function (self, action_data)
	if self._delay_action then
		slot4 = self

		self._reset_delay_action(slot3)
	end

	self._delay_action = action_data

	return 
end
PlayerMovementState._reset_current_action = function (self)
	local previous_action = self._current_action

	if previous_action and self["_end_action_" .. previous_action.type] then
		slot5 = previous_action

		self["_end_action_" .. previous_action.type](previous_action.type, self)

		if previous_action.root_blending_disabled then
			slot5 = true

			self._machine.set_root_blending(slot3, self._machine)
		end
	end

	self._current_action = nil

	return 
end
PlayerMovementState._set_current_action = function (self, action_data)
	if self._current_action then
		slot4 = self

		self._reset_current_action(slot3)
	end

	self._current_action = action_data

	return 
end
PlayerMovementState.interaction_blocked = function (self)
	return false
end
PlayerMovementState.save = function (self, data)
	return 
end
PlayerMovementState.pre_destroy = function (self)
	return 
end
PlayerMovementState.destroy = function (self)
	return 
end

return 
