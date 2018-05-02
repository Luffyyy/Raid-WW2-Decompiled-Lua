slot3 = "CoreSessionGenericState"

core.module(slot1, core)

State = State or class()
State.init = function (self)
	return 
end
State._set_stable_for_loading = function (self)
	self._is_stable_for_loading = true

	return 
end
State._not_stable_for_loading = function (self)
	self._is_stable_for_loading = nil

	return 
end
State.is_stable_for_loading = function (self)
	return self._is_stable_for_loading ~= nil
end
State.transition = function (self)
	slot4 = "you must override transition()"

	assert(slot2, false)

	return 
end

return 
