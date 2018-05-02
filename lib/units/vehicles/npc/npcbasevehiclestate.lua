NpcBaseVehicleState = NpcBaseVehicleState or class()
NpcBaseVehicleState.init = function (self, unit)
	self._unit = unit

	return 
end
NpcBaseVehicleState.on_enter = function (self, npc_driving_ext)
	return 
end
NpcBaseVehicleState.on_exit = function (self, npc_driving_ext)
	return 
end
NpcBaseVehicleState.update = function (self, t, dt)
	return 
end
NpcBaseVehicleState.name = function (self)
	return NpcVehicleDrivingExt.STATE_BASE
end
NpcBaseVehicleState.calc_steering = function (self, angle)
	return 0
end
NpcBaseVehicleState.calc_distance_threshold = function (self, angle)
	return 501
end
NpcBaseVehicleState.calc_speed_limit = function (self, path, unit_and_pos)
	return 0
end
NpcBaseVehicleState.handle_hard_turn = function (self, npc_driving_ext, angle_to_target)
	return 
end
NpcBaseVehicleState.handle_end_of_the_road = function (self, is_last_checkpoint, unit_and_pos)
	return 
end
NpcBaseVehicleState.evasion_maneuvers = function (self, npc_driving_ext, target_steering)
	return 
end
NpcBaseVehicleState.change_state = function (self, npc_driving_ext)
	return 
end
NpcBaseVehicleState.handle_stuck_vehicle = function (self, npc_driving_ext)
	return 
end
NpcBaseVehicleState.is_maneuvering = function (self)
	return false
end

return 
