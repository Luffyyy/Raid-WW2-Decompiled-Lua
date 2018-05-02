slot3 = "CoreSessionResponse"

core.module(slot1, core)

Done = Done or class()
Done.DONE = 1
Done.done = function (self)
	slot4 = Done.DONE

	self._set_response(slot2, self)

	return 
end
Done._is_response_value = function (self, value)
	slot5 = "You can not check a destroyed response object!"

	assert(slot3, not self._is_destroyed)

	return self._response == value
end
Done.is_done = function (self)
	slot4 = Done.DONE

	return self._is_response_value(slot2, self)
end
Done._set_response = function (self, value)
	slot5 = "You can not respond to a destroyed response object!"

	assert(slot3, not self._is_destroyed)

	slot5 = "Response has already been set!"

	assert(slot3, self._response == nil)

	self._response = value

	return 
end
Done.destroy = function (self)
	self._is_destroyed = true

	return 
end

if not DoneOrFinished then
	slot2 = Done
	slot0 = class(slot1)
end

DoneOrFinished = slot0
DoneOrFinished.FINISHED = 2
DoneOrFinished.finished = function (self)
	slot4 = DoneOrFinished.FINISHED

	self._set_response(slot2, self)

	return 
end
DoneOrFinished.is_finished = function (self)
	slot4 = DoneOrFinished.FINISHED

	return self._is_response_value(slot2, self)
end

return 
