slot3 = "CoreRequester"

core.module(slot1, core)

Requester = Requester or class()
Requester.request = function (self)
	self._requested = true

	return 
end
Requester.cancel_request = function (self)
	self._requested = nil

	return 
end
Requester.is_requested = function (self)
	return self._requested == true
end
Requester.task_started = function (self)
	self._task_is_running = true

	return 
end
Requester.task_completed = function (self)
	slot4 = "The task can not be completed, since it hasn't started"

	assert(slot2, self._task_is_running ~= nil)

	self._task_is_running = nil
	self._requested = nil

	return 
end
Requester.is_task_running = function (self)
	return self._task_is_running
end
Requester.force_task_completed = function (self)
	self._task_is_running = nil
	self._requested = nil

	return 
end

return 
