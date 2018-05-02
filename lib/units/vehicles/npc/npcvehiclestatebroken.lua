if not NpcVehicleStateBroken then
	slot2 = NpcBaseVehicleState
	slot0 = class(slot1)
end

NpcVehicleStateBroken = slot0
NpcVehicleStateBroken.init = function (self, unit)
	slot5 = unit

	NpcBaseVehicleState.init(slot3, self)

	return 
end
NpcVehicleStateBroken.update = function (self, t, dt)
	return 
end
NpcVehicleStateBroken.name = function (self)
	return NpcVehicleDrivingExt.STATE_BROKEN
end
NpcVehicleStateBroken.on_enter = function (self)
	slot3 = "NpcVehicleStateBroken:on_enter()"

	print(slot2)

	slot3 = self._unit
	slot4 = VehicleDrivingExt.SEQUENCE_FULL_DAMAGED

	if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
		slot3 = self._unit
		slot4 = VehicleDrivingExt.SEQUENCE_FULL_DAMAGED

		self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
	end

	return 
end

return 
