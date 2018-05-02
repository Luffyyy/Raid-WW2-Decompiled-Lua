if not VehicleStateInactive then
	slot2 = BaseVehicleState
	slot0 = class(slot1)
end

VehicleStateInactive = slot0
VehicleStateInactive.init = function (self, unit)
	slot5 = unit

	BaseVehicleState.init(slot3, self)

	return 
end
VehicleStateInactive.update = function (self, t, dt)
	return 
end
VehicleStateInactive.enter = function (self, state_data, enter_data)
	slot5 = self._unit
	slot5 = self._unit.vehicle_driving(slot4)

	self._unit.vehicle_driving(slot4)._stop_engine_sound(slot4)

	if self._unit.interaction then
		slot5 = self._unit

		if self._unit.interaction(slot4) then
			slot5 = self._unit

			if self._unit.interaction(slot4).set_override_timer_value then
				slot5 = self._unit
				slot6 = VehicleDrivingExt.TIME_ENTER

				self._unit.interaction(slot4).set_override_timer_value(slot4, self._unit.interaction(slot4))
			end
		end
	end

	slot5 = self

	self.adjust_interactions(slot4)

	return 
end
VehicleStateInactive.adjust_interactions = function (self)
	slot3 = self

	VehicleStateInactive.super.adjust_interactions(slot2)

	slot3 = self._unit
	slot3 = self._unit.vehicle_driving(slot2)

	if self._unit.vehicle_driving(slot2).is_interaction_allowed(slot2) then
		slot3 = self._unit

		if self._unit.damage(slot2) then
			slot3 = self._unit
			slot4 = VehicleDrivingExt.INTERACT_ENTRY_ENABLED

			if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
				slot3 = self._unit
				slot4 = VehicleDrivingExt.INTERACT_INTERACTION_ENABLED

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

				slot3 = self._unit
				slot4 = VehicleDrivingExt.INTERACT_ENTRY_ENABLED

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

				slot3 = self._unit
				slot4 = VehicleDrivingExt.INTERACT_LOOT_ENABLED

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))

				slot3 = self._unit
				slot4 = VehicleDrivingExt.INTERACT_REPAIR_DISABLED

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
			end
		end

		slot3 = self._unit
		self._unit.vehicle_driving(slot2)._interaction_enter_vehicle = true
		slot3 = self._unit

		if self._unit.vehicle_driving(true)._has_trunk then
			slot3 = self._unit
			self._unit.vehicle_driving(slot2)._interaction_trunk = true
		else
			slot3 = self._unit
			self._unit.vehicle_driving(slot2)._interaction_loot = true
		end

		slot3 = self._unit
		self._unit.vehicle_driving(slot2)._interaction_repair = false
	end

	return 
end
VehicleStateInactive.is_vulnerable = function (self)
	return true
end
VehicleStateInactive.exit = function (self)
	slot3 = self._unit

	if self._unit.unit_data(slot2).name_label_id == nil then
		slot4 = {
			name = self._unit.vehicle_driving(slot6)._tweak_data.name,
			unit = self._unit
		}
		slot7 = self._unit
		local id = managers.hud.add_vehicle_name_label(slot2, managers.hud)
		slot4 = self._unit
		self._unit.unit_data(managers.hud).name_label_id = id
	end

	return 
end

return 
