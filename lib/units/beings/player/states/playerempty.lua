if not PlayerEmpty then
	slot2 = PlayerMovementState
	slot0 = class(slot1)
end

PlayerEmpty = slot0
PlayerEmpty.init = function (self, unit)
	slot5 = unit

	PlayerMovementState.init(slot3, self)

	return 
end
PlayerEmpty.enter = function (self, state_data, enter_data)
	slot6 = state_data

	PlayerMovementState.enter(slot4, self)

	return 
end
PlayerEmpty.exit = function (self, state_data)
	slot5 = state_data

	PlayerMovementState.exit(slot3, self)

	return 
end
PlayerEmpty.update = function (self, t, dt)
	slot7 = dt

	PlayerMovementState.update(slot4, self, t)

	return 
end
PlayerEmpty.destroy = function (self)
	return 
end

return 
