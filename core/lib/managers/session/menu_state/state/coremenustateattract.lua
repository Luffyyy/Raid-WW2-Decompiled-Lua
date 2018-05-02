-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuStateAttract"

core.module(slot1, core)

slot3 = "CoreMenuStateStart"

core.import(slot1, core)

slot3 = "CoreSessionResponse"

core.import(slot1, core)

Attract = Attract or class()
Attract.init = function (self)
	local menu_handler = self.pre_front_end.menu_state._menu_handler
	slot4 = CoreSessionResponse.Done
	self._response = CoreSessionResponse.Done.new(slot3)
	slot5 = self._response

	menu_handler.attract(slot3, menu_handler)

	return 
end
Attract.destroy = function (self)
	slot3 = self._response

	self._response.destroy(slot2)

	return 
end
Attract.transition = function (self)

	-- Decompilation error in this vicinity:
	slot3 = self._response

	return 
end

return 
