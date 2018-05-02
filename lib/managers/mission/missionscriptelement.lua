-- Decompilation Error: _glue_flows(node)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

if not MissionScriptElement then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

MissionScriptElement = slot0
MissionScriptElement.init = function (self, ...)
	slot3 = self

	MissionScriptElement.super.init(slot2, ...)

	return 
end
MissionScriptElement.client_on_executed = function (self)
	return 
end
MissionScriptElement.on_executed = function (self, ...)
	slot3 = Network

	if Network.is_client(slot2) then
		return 
	end

	slot3 = self

	MissionScriptElement.super.on_executed(slot2, ...)

	return 
end
slot3 = MissionScriptElement

CoreClass.override_class(function (self, ...)
	slot3 = Network

	if Network.is_client(slot2) then
		return 
	end

	slot3 = self

	MissionScriptElement.super.on_executed(slot2, ...)

	return 
end, CoreMissionScriptElement.MissionScriptElement)

return 
