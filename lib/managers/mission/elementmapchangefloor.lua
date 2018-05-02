slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementMapChangeFloor then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementMapChangeFloor = slot0
ElementMapChangeFloor.init = function (self, ...)
	slot3 = self

	ElementMapChangeFloor.super.init(slot2, ...)

	self._network_execute = false

	return 
end
ElementMapChangeFloor.on_script_activated = function (self)
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
ElementMapChangeFloor.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
ElementMapChangeFloor.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = self._values.floor

	managers.hud.change_map_floor(slot3, managers.hud)

	slot5 = instigator

	ElementMapChangeFloor.super.on_executed(slot3, self)

	return 
end
ElementMapChangeFloor.operation_remove = function (self)
	return 
end

return 
