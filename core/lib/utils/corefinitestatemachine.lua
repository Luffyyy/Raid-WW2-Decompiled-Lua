slot3 = "CoreFiniteStateMachine"

core.module(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

FiniteStateMachine = FiniteStateMachine or class()
function FiniteStateMachine:init(state_class, object_name, object)
	self._object = object
	self._object_name = object_name

	if state_class then
		slot7 = state_class

		self._set_state(slot5, self)
	end

	self._debug = true

	return 
end
function FiniteStateMachine:load(data)
	local class = _G[data.class_name]
	slot5 = class

	self._set_state(slot4)

	return 
end
function FiniteStateMachine:save(data)
	slot4 = self._state_class
	data.class_name = class_name(slot3)

	return 
end
function FiniteStateMachine:set_debug(debug_enabled)
	self._debug = debug_enabled

	return 
end
function FiniteStateMachine:destroy()
	slot3 = self

	self._destroy_current_state(slot2)

	return 
end
function FiniteStateMachine:transition()
	slot3 = self._state

	assert(slot2)

	slot4 = "You must at least have a transition method"

	assert(slot2, self._state.transition)

	slot3 = self._state
	local new_state_class, arg = self._state.transition(slot2)

	if new_state_class then
		slot7 = arg

		self._set_state(slot4, self, new_state_class)
	end

	return 
end
function FiniteStateMachine:state()
	slot3 = self._state

	assert(slot2)

	return self._state
end
function FiniteStateMachine:_class_name(state_class)
	slot4 = state_class

	return CoreDebug.full_class_name(slot3)
end
function FiniteStateMachine:_destroy_current_state()
	if self._state and self._state.destroy then
		slot3 = self._state

		self._state.destroy(slot2)

		self._state = nil
	end

	return 
end
function FiniteStateMachine:_set_state(new_state_class, ...)
	if self._debug then
		slot11 = new_state_class
		slot5 = "transitions from '" .. self._class_name(slot7, self) .. "' to '" .. self._class_name(self._state_class, self) .. "'"

		cat_print(slot3, "debug")
	end

	self._destroy_current_state(slot3)

	local init_function = new_state_class.init
	new_state_class.init = function ()
		return 
	end
	slot5 = new_state_class
	self._state = new_state_class.new(self)
	slot5 = self._state ~= nil

	assert(slot4)

	new_state_class.init = init_function
	self._state[self._object_name] = self._object
	self._state_class = new_state_class

	if init_function then
		slot5 = self._state

		self._state.init(slot4, ...)
	end

	return 
end

return 
