slot3 = "CoreInputLayer"

core.module(slot1, core)

slot3 = "CoreInputContextStack"

core.import(slot1, core)

slot3 = "CoreInputProvider"

core.import(slot1, core)

slot3 = "CoreInputContext"

core.import(slot1, core)

Layer = Layer or class()
Layer.init = function (self, input_provider, layer_description)
	slot5 = CoreInputContextStack.Stack
	self._input_context_stack = CoreInputContextStack.Stack.new(slot4)
	self._layer_description = layer_description
	self._input_provider = input_provider

	return 
end
Layer.destroy = function (self)
	slot3 = self._input_context_stack

	self._input_context_stack.destroy(slot2)

	slot4 = self

	self._input_provider._layer_destroyed(slot2, self._input_provider)

	return 
end
Layer.context = function (self)
	slot3 = self._input_context_stack

	return self._input_context_stack.active_context(slot2)
end
Layer.layer_description = function (self)
	return self._layer_description
end
Layer.create_context = function (self)
	local context_description = self._layer_description.context_description(slot2)
	slot6 = self._input_context_stack

	return CoreInputContext.Context.new(self._layer_description, CoreInputContext.Context, context_description)
end

return 
