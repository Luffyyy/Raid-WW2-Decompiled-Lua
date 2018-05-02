-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementWaypoint then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementWaypoint = slot0
ElementWaypoint.init = function (self, ...)
	slot3 = self

	ElementWaypoint.super.init(slot2, ...)

	self._network_execute = true

	if self._values.icon == "guis/textures/waypoint2" or self._values.icon == "guis/textures/waypoint" then
		self._values.icon = "wp_standard"
	end

	return 
end
ElementWaypoint._get_unique_id = function (self)
	local uid = self._sync_id .. self._id

	return uid
end
ElementWaypoint.on_script_activated = function (self)
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
ElementWaypoint.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
ElementWaypoint.on_executed = function (self, instigator)

	-- Decompilation error in this vicinity:
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementWaypoint.super.on_executed(slot3, self)

	return 
end
ElementWaypoint.operation_remove = function (self)
	slot3 = managers.hud
	slot6 = self

	managers.hud.remove_waypoint(slot2, self._get_unique_id(slot5))

	return 
end
ElementWaypoint.pre_destroy = function (self)
	slot3 = managers.hud
	slot6 = self

	managers.hud.remove_waypoint(slot2, self._get_unique_id(slot5))

	return 
end

return 
