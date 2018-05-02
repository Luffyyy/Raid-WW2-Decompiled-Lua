slot3 = "CoreGameStateFrontEnd"

core.module(slot1, core)

slot3 = "CoreGameStatePrepareLoadingGame"

core.import(slot1, core)

FrontEnd = FrontEnd or class()
FrontEnd.init = function (self)
	self.game_state._is_in_front_end = true

	return 
end
FrontEnd.destroy = function (self)
	self.game_state._is_in_front_end = false

	return 
end
FrontEnd.transition = function (self)
	slot3 = self.game_state._game_requester

	if not self.game_state._game_requester.is_requested(slot2) then
		return 
	end

	slot3 = self.game_state._session_manager

	if self.game_state._session_manager._main_systems_are_stable_for_loading(slot2) then
		return CoreGameStatePrepareLoadingGame.PrepareLoadingGame
	end

	return 
end

return 
