slot3 = "CoreMenuItemOption"

core.module(slot1, core)

ItemOption = ItemOption or class()
ItemOption.init = function (self, data_node, parameters)
	local params = parameters or {}

	if data_node then
		slot6 = data_node

		for key, value in pairs(slot5) do
			if key ~= "_meta" then
				slot11 = value

				if type(slot10) ~= "table" then
					params[key] = value
				end
			end
		end
	end

	slot7 = params

	self.set_parameters(slot5, self)

	return 
end
ItemOption.value = function (self)
	return self._parameters.value
end
ItemOption.parameters = function (self)
	return self._parameters
end
ItemOption.set_parameters = function (self, parameters)
	self._parameters = parameters

	return 
end

return 
