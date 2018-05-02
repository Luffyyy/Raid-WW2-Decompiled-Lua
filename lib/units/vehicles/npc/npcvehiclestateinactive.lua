if not NpcVehicleStateInactive then
	slot2 = NpcBaseVehicleState
	slot0 = class(slot1)
end

NpcVehicleStateInactive = slot0
NpcVehicleStateInactive.init = function (self, unit)
	slot5 = unit

	NpcBaseVehicleState.init(slot3, self)

	return 
end
NpcVehicleStateInactive.update = function (self, t, dt)
	return 
end
NpcVehicleStateInactive.name = function (self)
	return NpcVehicleDrivingExt.STATE_INACTIVE
end

return 
