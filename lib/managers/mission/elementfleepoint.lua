slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementFleePoint then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementFleePoint = slot0
ElementFleePoint.init = function (self, ...)
	slot3 = self

	ElementFleePoint.super.init(slot2, ...)

	return 
end
ElementFleePoint.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self

	self.operation_add(slot3)

	slot5 = instigator

	ElementFleePoint.super.on_executed(slot3, self)

	return 
end
ElementFleePoint.operation_add = function (self)
	if self._values.functionality == "loot_drop" then
		slot3 = managers.groupai
		slot6 = self
		slot5 = self._values.position

		managers.groupai.state(slot2).add_enemy_loot_drop_point(slot2, managers.groupai.state(slot2), self._unique_string_id(slot5))
	else
		slot3 = managers.groupai
		slot6 = self
		slot6 = self._values.so_action

		managers.groupai.state(slot2).add_flee_point(slot2, managers.groupai.state(slot2), self._unique_string_id(slot5), self._values.position)
	end

	return 
end
ElementFleePoint.operation_remove = function (self)
	if self._values.functionality == "loot_drop" then
		slot3 = managers.groupai
		slot3 = managers.groupai.state(slot2)
		slot6 = self

		managers.groupai.state(slot2).remove_enemy_loot_drop_point(slot2, self._unique_string_id(slot5))
	else
		slot3 = managers.groupai
		slot3 = managers.groupai.state(slot2)
		slot6 = self

		managers.groupai.state(slot2).remove_flee_point(slot2, self._unique_string_id(slot5))
	end

	return 
end

return 
