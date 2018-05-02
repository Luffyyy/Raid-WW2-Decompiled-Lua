slot3 = "CoreSessionStateInSession"

core.module(slot1, core)

slot3 = "CoreSessionStateInSessionStarted"

core.import(slot1, core)

InSessionStart = InSessionStart or class()
InSessionStart.init = function (self, session)
	slot4 = session

	assert(slot3)

	self._session = session

	return 
end
InSessionStart.destroy = function (self)
	return 
end
InSessionStart.transition = function (self)
	return CoreSessionStateInSessionStarted.Started, self._session
end

return 
