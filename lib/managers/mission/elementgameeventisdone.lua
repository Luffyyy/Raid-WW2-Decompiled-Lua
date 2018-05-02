slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementGameEventIsDone then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementGameEventIsDone = slot0
ElementGameEventIsDone.init = function (self, ...)
	slot3 = self

	ElementGameEventIsDone.super.init(slot2, ...)

	return 
end
ElementGameEventIsDone.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	local ok = false

	if not ok then
		return 
	end

	slot6 = instigator

	ElementGameEventIsDone.super.on_executed(slot4, self)

	return 
end
ElementGameEventIsDone.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end

return 
