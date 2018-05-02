slot3 = "CoreInputContextStack"

core.module(slot1, core)

slot3 = "CoreStack"

core.import(slot1, core)

Stack = Stack or class()
Stack.init = function (self, device_type)
	self._device_type = device_type
	slot4 = CoreStack.Stack
	self._active_input_context = CoreStack.Stack.new(slot3)

	return 
end
Stack.destroy = function (self)
	slot3 = self._active_input_context

	self._active_input_context.destroy(slot2)

	return 
end
Stack.active_device_layout = function (self)
	local target_context = self._active_input_context.top(slot2)
	slot5 = self._device_type

	return target_context.device_layout(self._active_input_context, target_context)
end
Stack.active_context = function (self)
	slot3 = self._active_input_context

	if self._active_input_context.is_empty(slot2) then
		return 
	end

	slot3 = self._active_input_context

	return self._active_input_context.top(slot2)
end
Stack.pop_input_context = function (self, input_context)
	slot6 = self._active_input_context
	slot4 = self._active_input_context.top(slot5) == input_context

	assert(slot3)

	slot4 = self._active_input_context

	self._active_input_context.pop(slot3)

	return 
end
Stack.push_input_context = function (self, input_context)
	slot5 = input_context

	self._active_input_context.push(slot3, self._active_input_context)

	return 
end

return 
