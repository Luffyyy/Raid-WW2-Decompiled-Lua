slot3 = "CoreInternalGameState"

core.module(slot1, core)

GameState = GameState or class()
GameState.init = function (self, name, game_state_machine)
	self._name = name
	self._gsm = game_state_machine

	return 
end
GameState.destroy = function (self)
	return 
end
GameState.name = function (self)
	return self._name
end
GameState.gsm = function (self)
	return self._gsm
end
GameState.at_enter = function (self, previous_state)
	return 
end
GameState.at_exit = function (self, next_state)
	return 
end
GameState.default_transition = function (self, next_state)
	slot5 = next_state

	self.at_exit(slot3, self)

	slot5 = self

	next_state.at_enter(slot3, next_state)

	return 
end
GameState.force_editor_state = function (self)
	slot4 = "editor"

	self._gsm.change_state_by_name(slot2, self._gsm)

	return 
end
GameState.allow_world_camera_sequence = function (self)
	return false
end
GameState.play_world_camera_sequence = function (self, name, sequence)
	slot5 = "NotImplemented"

	error(slot4)

	return 
end
GameState.allow_freeflight = function (self)
	return true
end
GameState.freeflight_drop_player = function (self, pos, rot)
	slot9 = self
	slot6 = "[FreeFlight] Drop player not implemented for state '" .. self.name(slot8) .. "'"

	Application.error(slot4, Application)

	return 
end

return 
