slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementAIGraph then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementAIGraph = slot0
ElementAIGraph.init = function (self, ...)
	slot3 = self

	ElementAIGraph.super.init(slot2, ...)

	return 
end
ElementAIGraph.on_script_activated = function (self)
	return 
end
ElementAIGraph.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
ElementAIGraph.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._values.graph_ids

	for _, id in ipairs(slot3) do
		slot11 = id
		local unique_id = managers.navigation.get_segment_unique_id(slot8, managers.navigation, self._sync_id)
		slot12 = self._values.operation

		managers.navigation.set_nav_segment_state(managers.navigation, managers.navigation, unique_id)
	end

	slot5 = instigator

	ElementAIGraph.super.on_executed(slot3, self)

	return 
end

return 
