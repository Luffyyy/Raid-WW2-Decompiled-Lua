-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuStateLoadingFrontEnd"

core.module(slot1, core)

slot3 = "CoreMenuStateFrontEnd"

core.import(slot1, core)

slot3 = "CoreMenuStateStopLoadingFrontEnd"

core.import(slot1, core)

LoadingFrontEnd = LoadingFrontEnd or class()
LoadingFrontEnd.init = function (self)
	self.menu_state._set_stable_for_loading(slot2)

	local menu_handler = self.menu_state._menu_handler
	slot4 = menu_handler

	menu_handler.start_loading_front_end_environment(self.menu_state)

	return 
end
LoadingFrontEnd.destroy = function (self)
	slot3 = self.menu_state

	self.menu_state._not_stable_for_loading(slot2)

	return 
end
LoadingFrontEnd.transition = function (self)

	-- Decompilation error in this vicinity:
	local game_state = self.menu_state._game_state
	slot4 = game_state

	return 
end

return 
