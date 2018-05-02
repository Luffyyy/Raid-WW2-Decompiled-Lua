-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreElementExecuteInOtherMission"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementExecuteInOtherMission then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementExecuteInOtherMission = slot0
ElementExecuteInOtherMission.init = function (self, ...)
	slot3 = self

	ElementExecuteInOtherMission.super.init(slot2, ...)

	return 
end
ElementExecuteInOtherMission.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
ElementExecuteInOtherMission.get_mission_element = function (self, id)
	return 
end

return 
