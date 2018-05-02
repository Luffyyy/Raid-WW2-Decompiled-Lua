slot3 = "CoreInputContextDescription"

core.module(slot1, core)

ContextDescription = ContextDescription or class()
ContextDescription.init = function (self, name)
	self._input_target_descriptions = {}
	self._layout_descriptions = {}
	self._context_descriptions = {}
	self._name = name
	slot5 = "You must specify a name for a context"

	assert(slot3, self._name)

	return 
end
ContextDescription.add_input_target_description = function (self, input_target_description)
	slot5 = input_target_description
	self._input_target_descriptions[input_target_description.target_name(slot4)] = input_target_description

	return 
end
ContextDescription.add_layout_description = function (self, input_layout_description)
	slot5 = input_layout_description
	self._layout_descriptions[input_layout_description.layout_name(slot4)] = input_layout_description

	return 
end
ContextDescription.add_context_description = function (self, context_description)
	slot5 = context_description
	self._context_descriptions[context_description.context_description_name(slot4)] = context_description

	return 
end
ContextDescription.device_layout_description = function (self, device_type, layout_name)
	layout_name = layout_name or "default"
	local layout_description = self._layout_descriptions[layout_name]

	if layout_description == nil then
		return 
	end

	slot7 = device_type

	return layout_description.device_layout_description(slot5, layout_description)
end
ContextDescription.context_description_name = function (self)
	return self._name
end
ContextDescription.context_description = function (self, context_name)
	return self._context_descriptions[context_name]
end
ContextDescription.context_descriptions = function (self)
	return self._context_descriptions
end
ContextDescription.input_targets = function (self)
	return self._input_target_descriptions
end
ContextDescription.input_target_description = function (self, target_name)
	local input_target = self._input_target_descriptions[target_name]
	slot6 = "Input Target with name '" .. target_name .. "' can not be found in context '" .. self._name .. "'"

	assert(slot4, input_target ~= nil)

	return input_target
end

return 
