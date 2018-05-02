slot3 = "CoreFreeFlightAction"

core.module(slot1, core)

FreeFlightAction = FreeFlightAction or class()
FreeFlightAction.init = function (self, name, callback)
	slot5 = name
	self._name = assert(slot4)
	slot5 = callback
	self._callback = assert(slot4)

	return 
end
FreeFlightAction.do_action = function (self)
	self._callback()

	return 
end
FreeFlightAction.reset = function (self)
	return 
end
FreeFlightAction.name = function (self)
	return self._name
end
FreeFlightActionToggle = FreeFlightActionToggle or class()
FreeFlightActionToggle.init = function (self, name1, name2, callback1, callback2)
	slot7 = name1
	self._name1 = assert(slot6)
	slot7 = name2
	self._name2 = assert(slot6)
	slot7 = callback1
	self._callback1 = assert(slot6)
	slot7 = callback2
	self._callback2 = assert(slot6)
	self._toggle = 1

	return 
end
FreeFlightActionToggle.do_action = function (self)
	if self._toggle == 1 then
		self._toggle = 2

		self._callback1()
	else
		self._toggle = 1

		self._callback2()
	end

	return 
end
FreeFlightActionToggle.reset = function (self)
	if self._toggle == 2 then
		slot3 = self

		self.do_action(slot2)
	end

	return 
end
FreeFlightActionToggle.name = function (self)
	if self._toggle == 1 then
		return self._name1
	else
		return self._name2
	end

	return 
end

return 
