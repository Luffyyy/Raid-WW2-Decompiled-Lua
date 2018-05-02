slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementStatistics then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementStatistics = slot0
ElementStatistics.init = function (self, ...)
	slot3 = self

	ElementStatistics.super.init(slot2, ...)

	return 
end
ElementStatistics.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = self._values.name

	managers.statistics.mission_stats(slot3, managers.statistics)

	slot5 = instigator

	ElementStatistics.super.on_executed(slot3, self)

	return 
end
ElementStatistics.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end

return 
