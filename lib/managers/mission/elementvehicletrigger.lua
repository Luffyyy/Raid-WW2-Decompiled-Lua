if not ElementVehicleTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementVehicleTrigger = slot0
ElementVehicleTrigger.init = function (self, ...)
	slot3 = self

	ElementVehicleTrigger.super.init(slot2, ...)

	return 
end
ElementVehicleTrigger.on_script_activated = function (self)
	slot3 = Network

	if Network.is_server(slot2) then
		slot5 = {
			self._values.event
		}
		slot10 = "on_executed"

		managers.vehicle.add_listener(slot2, managers.vehicle, self._id, callback(slot7, self, self))
	end

	return 
end
ElementVehicleTrigger.on_enter = function (self, instigator)
	slot5 = instigator

	self.on_executed(slot3, self)

	return 
end
ElementVehicleTrigger.on_exit = function (self, instigator)
	slot5 = instigator

	self.on_executed(slot3, self)

	return 
end
ElementVehicleTrigger.on_all_inside = function (self, instigator)
	slot5 = instigator

	self.on_executed(slot3, self)

	return 
end
ElementVehicleTrigger.send_to_host = function (self, instigator)
	if instigator then
		slot4 = managers.network
		slot7 = nil

		managers.network.session(slot3).send_to_host(slot3, managers.network.session(slot3), "to_server_mission_element_trigger", self._id)
	end

	return 
end
ElementVehicleTrigger.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = self._unit or instigator

	ElementVehicleTrigger.super.on_executed(slot3, self)

	return 
end
ElementVehicleTrigger.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = self._unit or instigator

	ElementVehicleTrigger.super.on_executed(slot3, self)

	return 
end
MissionScriptElement.destroy = function (self)
	slot3 = Network

	if Network.is_server(slot2) then
		slot4 = self._id

		managers.vehicle.remove_listener(slot2, managers.vehicle)
	end

	return 
end

return 
