slot3 = "CoreMenuStateStopLoadingFrontEnd"

core.module(slot1, core)

slot3 = "CoreSessionResponse"

core.import(slot1, core)

slot3 = "CoreMenuStatePreFrontEnd"

core.import(slot1, core)

slot3 = "CoreMenuStateFrontEnd"

core.import(slot1, core)

StopLoadingFrontEnd = StopLoadingFrontEnd or class()
StopLoadingFrontEnd.init = function (self)
	local menu_handler = self.menu_state._menu_handler
	slot4 = CoreSessionResponse.Done
	self._response = CoreSessionResponse.Done.new(slot3)
	slot5 = self._response

	menu_handler.stop_loading_front_end_environment(slot3, menu_handler)

	return 
end
StopLoadingFrontEnd.destroy = function (self)
	slot3 = self._response

	self._response.destroy(slot2)

	return 
end
StopLoadingFrontEnd.transition = function (self)
	slot3 = self._response

	if not self._response.is_done(slot2) then
		return 
	end

	return CoreMenuStatePreFrontEnd.PreFrontEnd
end

return 
