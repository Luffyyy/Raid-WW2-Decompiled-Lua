slot3 = "CoreFreeFlightModifier"

core.module(slot1, core)

FreeFlightModifier = FreeFlightModifier or class()
FreeFlightModifier.init = function (self, name, values, index, callback)
	slot7 = name
	self._name = assert(slot6)
	slot7 = values
	self._values = assert(slot6)
	slot7 = index
	self._index = assert(slot6)
	self._callback = callback

	return 
end
FreeFlightModifier.step_up = function (self)
	slot5 = #self._values
	self._index = math.clamp(slot2, self._index + 1, 1)

	if self._callback then
		slot5 = self

		self._callback(self.value(slot4))
	end

	return 
end
FreeFlightModifier.step_down = function (self)
	slot5 = #self._values
	self._index = math.clamp(slot2, self._index - 1, 1)

	if self._callback then
		slot5 = self

		self._callback(self.value(slot4))
	end

	return 
end
FreeFlightModifier.name_value = function (self)
	slot5 = self._values[self._index]

	return string.format(slot2, "%10.10s %7.2f", self._name)
end
FreeFlightModifier.value = function (self)
	return self._values[self._index]
end

return 
