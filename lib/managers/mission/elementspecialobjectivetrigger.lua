slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementSpecialObjectiveTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSpecialObjectiveTrigger = slot0
ElementSpecialObjectiveTrigger.init = function (self, ...)
	slot3 = self

	ElementSpecialObjectiveTrigger.super.init(slot2, ...)

	return 
end
ElementSpecialObjectiveTrigger.on_script_activated = function (self)
	slot3 = self._values.elements

	for _, id in ipairs(slot2) do
		slot9 = id
		local element = self.get_mission_element(slot7, self)
		slot10 = self._values.event
		slot15 = "on_executed"

		element.add_event_callback(self, element, callback(slot12, self, self))
	end

	return 
end
ElementSpecialObjectiveTrigger.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementSpecialObjectiveTrigger.super.on_executed(slot3, self)

	return 
end

return 
