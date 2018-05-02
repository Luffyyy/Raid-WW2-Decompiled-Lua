slot3 = "CoreInputLayoutDescription"

core.module(slot1, core)

LayoutDescription = LayoutDescription or class()
LayoutDescription.init = function (self, name)
	self._name = name
	self._device_layout_descriptions = {}

	return 
end
LayoutDescription.layout_name = function (self)
	return self._name
end
LayoutDescription.add_device_layout_description = function (self, device_layout_description)
	slot5 = device_layout_description
	self._device_layout_descriptions[device_layout_description.device_type(slot4)] = device_layout_description

	return 
end
LayoutDescription.device_layout_description = function (self, device_type)
	return self._device_layout_descriptions[device_type]
end

return 
