slot3 = "CoreInputLayerDescription"

core.module(slot1, core)

LayerDescription = LayerDescription or class()
LayerDescription.init = function (self, name, priority)
	self._name = name
	self._priority = priority

	return 
end
LayerDescription.layer_description_name = function (self)
	return self._name
end
LayerDescription.set_context_description = function (self, context_description)
	slot4 = self._context_description == nil

	assert(slot3)

	self._context_description = context_description

	return 
end
LayerDescription.context_description = function (self)
	slot4 = "Must specify context for this layer_description"

	assert(slot2, self._context_description)

	return self._context_description
end
LayerDescription.priority = function (self)
	return self._priority
end

return 
