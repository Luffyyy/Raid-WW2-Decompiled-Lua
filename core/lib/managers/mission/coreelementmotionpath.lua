-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreElementMotionPath"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementMotionPathOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementMotionPathOperator = slot0
ElementMotionPathOperator.init = function (self, ...)
	slot3 = self

	ElementMotionPathOperator.super.init(slot2, ...)

	return 
end
ElementMotionPathOperator.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
ElementMotionPathOperator.on_executed = function (self, instigator)

	-- Decompilation error in this vicinity:
	if not self._values.enabled then
		return 
	end

	slot6 = instigator

	ElementMotionPathOperator.super.on_executed(slot4, self)

	return 
end

if not ElementMotionPathTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementMotionPathTrigger = slot0
ElementMotionPathTrigger.init = function (self, ...)
	slot3 = self

	ElementMotionPathTrigger.super.init(slot2, ...)

	return 
end
ElementMotionPathTrigger.on_script_activated = function (self)
	slot3 = self._values.elements

	for _, id in ipairs(slot2) do
		slot9 = id
		local element = self.get_mission_element(slot7, self)
		slot11 = self._values.outcome
		slot16 = "on_executed"

		element.add_trigger(self, element, self._id, callback(slot13, self, self))
	end

	return 
end
ElementMotionPathTrigger.client_on_executed = function (self, ...)
	return 
end
ElementMotionPathTrigger.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementMotionPathTrigger.super.on_executed(slot3, self)

	return 
end

return 
