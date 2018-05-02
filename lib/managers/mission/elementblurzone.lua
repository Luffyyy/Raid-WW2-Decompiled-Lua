slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementBlurZone then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementBlurZone = slot0
ElementBlurZone.init = function (self, ...)
	slot3 = self

	ElementBlurZone.super.init(slot2, ...)

	return 
end
ElementBlurZone.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
ElementBlurZone.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.mode == 0 then
		slot6 = self._values.mode

		managers.environment_controller.set_blurzone(slot3, managers.environment_controller, self._id)
	else
		slot9 = self._values.height

		managers.environment_controller.set_blurzone(slot3, managers.environment_controller, self._id, self._values.mode, self._values.position, self._values.radius)
	end

	slot5 = instigator

	ElementBlurZone.super.on_executed(slot3, self)

	return 
end

return 
