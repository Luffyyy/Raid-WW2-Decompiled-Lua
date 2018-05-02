-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreElementLogicChance"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementLogicChance then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementLogicChance = slot0
ElementLogicChance.init = function (self, ...)
	slot3 = self

	ElementLogicChance.super.init(slot2, ...)

	self._chance = self._values.chance
	self._triggers = {}

	return 
end
ElementLogicChance.client_on_executed = function (self, ...)
	return 
end
ElementLogicChance.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	if not self.monitor_element and self._values.output_monitor_id then
	end

	slot4 = 100
	local roll = math.random(slot3)

	if self._chance < roll then
		slot6 = " roll: " .. roll .. " - fail"

		self.monitor_output_change(slot4, self)

		slot6 = "fail"

		self._trigger_outcome(slot4, self)

		return 
	end

	slot6 = " roll: " .. roll .. " - success"

	self.monitor_output_change(slot4, self)

	slot6 = "success"

	self._trigger_outcome(slot4, self)

	slot6 = instigator

	ElementLogicChance.super.on_executed(slot4, self)

	return 
end
ElementLogicChance.chance_operation_add_chance = function (self, chance)
	self._chance = self._chance + chance
	slot4 = self

	self.monitor_output_change(slot3)

	return 
end
ElementLogicChance.chance_operation_subtract_chance = function (self, chance)
	self._chance = self._chance - chance
	slot4 = self

	self.monitor_output_change(slot3)

	return 
end
ElementLogicChance.chance_operation_reset = function (self)
	self._chance = self._values.chance
	slot3 = self

	self.monitor_output_change(slot2)

	return 
end
ElementLogicChance.chance_operation_set_chance = function (self, chance)
	self._chance = chance
	slot4 = self

	self.monitor_output_change(slot3)

	return 
end
ElementLogicChance.add_trigger = function (self, id, outcome, callback)
	self._triggers[id] = {
		outcome = outcome,
		callback = callback
	}

	return 
end
ElementLogicChance.remove_trigger = function (self, id)
	self._triggers[id] = nil

	return 
end
ElementLogicChance._trigger_outcome = function (self, outcome)
	slot4 = self._triggers

	for _, data in pairs(slot3) do
		if data.outcome == outcome then
			data.callback()
		end
	end

	return 
end
ElementLogicChance.monitor_output_change = function (self, result)
	if self.monitor_element then
		local output_string = "chance: " .. self._chance .. " " .. (result or "")
		slot7 = output_string

		self.monitor_element.on_monitored_element(" ", self.monitor_element, self._editor_name)
	end

	return 
end

if not ElementLogicChanceOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementLogicChanceOperator = slot0
ElementLogicChanceOperator.init = function (self, ...)
	slot3 = self

	ElementLogicChanceOperator.super.init(slot2, ...)

	return 
end
ElementLogicChanceOperator.client_on_executed = function (self, ...)
	return 
end
ElementLogicChanceOperator.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._values.elements

	for _, id in ipairs(slot3) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)

		if element then
			if self._values.operation == "add_chance" then
				slot11 = self._values.chance

				element.chance_operation_add_chance(slot9, element)
			elseif self._values.operation == "subtract_chance" then
				slot11 = self._values.chance

				element.chance_operation_subtract_chance(slot9, element)
			elseif self._values.operation == "reset" then
				slot10 = element

				element.chance_operation_reset(slot9)
			elseif self._values.operation == "set_chance" then
				slot11 = self._values.chance

				element.chance_operation_set_chance(slot9, element)
			end
		end
	end

	slot5 = instigator

	ElementLogicChanceOperator.super.on_executed(slot3, self)

	return 
end

if not ElementLogicChanceTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementLogicChanceTrigger = slot0
ElementLogicChanceTrigger.init = function (self, ...)
	slot3 = self

	ElementLogicChanceTrigger.super.init(slot2, ...)

	return 
end
ElementLogicChanceTrigger.on_script_activated = function (self)
	slot3 = self._values.elements

	for _, id in ipairs(slot2) do
		slot9 = id
		local element = self.get_mission_element(slot7, self)

		if element then
			slot11 = self._values.outcome
			slot16 = "on_executed"

			element.add_trigger(slot8, element, self._id, callback(slot13, self, self))
		end
	end

	return 
end
ElementLogicChanceTrigger.client_on_executed = function (self, ...)
	return 
end
ElementLogicChanceTrigger.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementLogicChanceTrigger.super.on_executed(slot3, self)

	return 
end

return 
