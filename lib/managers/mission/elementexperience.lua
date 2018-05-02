slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementExperience then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementExperience = slot0
ElementExperience.init = function (self, ...)
	slot3 = self

	ElementExperience.super.init(slot2, ...)

	return 
end
ElementExperience.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = self._values.event

	managers.experience.mission_xp_award(slot3, managers.experience)

	slot5 = instigator

	ElementExperience.super.on_executed(slot3, self)

	return 
end
ElementExperience.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end

return 
