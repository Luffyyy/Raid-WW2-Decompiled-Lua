if not ElementEnvironmentAreaOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementEnvironmentAreaOperator = slot0
ElementEnvironmentAreaOperator.init = function (self, ...)
	self._has_executed = false
	slot3 = self

	ElementEnvironmentAreaOperator.super.init(slot2, ...)

	return 
end
ElementEnvironmentAreaOperator.stop_simulation = function (self, ...)
	slot3 = self

	ElementEnvironmentAreaOperator.super.destroy(slot2, ...)

	return 
end
ElementEnvironmentAreaOperator.save = function (self, data)
	data.has_executed = self._has_executed

	return 
end
ElementEnvironmentAreaOperator.load = function (self, data)
	self._has_executed = data.has_executed

	if self._has_executed == true then
		slot5 = self._values.environment_area
		local environment_area = managers.environment_area.get_area_by_name(slot3, managers.environment_area)
		slot6 = self._values.environment

		environment_area.set_environment(managers.environment_area, environment_area)
	end

	return 
end
ElementEnvironmentAreaOperator.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
ElementEnvironmentAreaOperator.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	self._has_executed = true
	slot5 = self._values.environment_area
	local environment_area = managers.environment_area.get_area_by_name(slot3, managers.environment_area)
	slot6 = self._values.environment

	environment_area.set_environment(managers.environment_area, environment_area)

	slot6 = instigator

	ElementEnvironmentAreaOperator.super.on_executed(managers.environment_area, self)

	return 
end

return 
