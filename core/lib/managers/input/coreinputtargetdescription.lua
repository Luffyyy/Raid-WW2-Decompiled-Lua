slot3 = "CoreInputTargetDescription"

core.module(slot1, core)

TargetDescription = TargetDescription or class()
TargetDescription.init = function (self, name, type_name)
	self._name = name
	slot5 = type_name == "bool" or type_name == "vector"

	assert(slot4)

	self._type_name = type_name

	return 
end
TargetDescription.target_name = function (self)
	return self._name
end
TargetDescription.target_type_name = function (self)
	return self._type_name
end

return 
