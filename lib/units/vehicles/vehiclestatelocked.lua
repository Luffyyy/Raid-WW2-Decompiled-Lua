if not VehicleStateLocked then
	slot2 = BaseVehicleState
	slot0 = class(slot1)
end

VehicleStateLocked = slot0
VehicleStateLocked.init = function (self, unit)
	slot5 = unit

	BaseVehicleState.init(slot3, self)

	return 
end
VehicleStateLocked.enter = function (self, state_data, enter_data)
	slot5 = self._unit
	slot5 = self._unit.vehicle_driving(slot4)

	self._unit.vehicle_driving(slot4)._stop_engine_sound(slot4)

	slot5 = self._unit
	slot6 = VehicleDrivingExt.TIME_ENTER

	self._unit.interaction(slot4).set_override_timer_value(slot4, self._unit.interaction(slot4))

	slot5 = self

	self.disable_interactions(slot4)

	slot5 = self._unit
	slot12 = 2

	self._unit.vehicle_driving(slot4).set_input(slot4, self._unit.vehicle_driving(slot4), 0, 0, 1, 1, false, false)

	return 
end
VehicleStateLocked.allow_exit = function (self)
	return true
end
VehicleStateLocked.stop_vehicle = function (self)
	return true
end
VehicleStateLocked.is_vulnerable = function (self)
	return false
end

return 
