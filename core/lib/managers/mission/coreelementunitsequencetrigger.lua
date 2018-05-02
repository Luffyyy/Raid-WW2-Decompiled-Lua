slot3 = "CoreElementUnitSequenceTrigger"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

if not ElementUnitSequenceTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementUnitSequenceTrigger = slot0
ElementUnitSequenceTrigger.init = function (self, ...)
	slot3 = self

	ElementUnitSequenceTrigger.super.init(slot2, ...)

	if not self._values.sequence_list and self._values.sequence then
		self._values.sequence_list = {
			{
				unit_id = self._values.unit_id,
				sequence = self._values.sequence
			}
		}
	end

	return 
end
ElementUnitSequenceTrigger.on_script_activated = function (self)
	slot3 = Network

	if Network.is_client(slot2) then
	else
		slot4 = self._id

		self._mission_script.add_save_state_cb(slot2, self._mission_script)

		slot3 = self._values.sequence_list

		for _, data in pairs(slot2) do
			slot8 = self._mission_script
			slot9 = data.unit_id
			local unit_id = self._mission_script.worlddefinition(slot7).id_convert_old_to_new(slot7, self._mission_script.worlddefinition(slot7))

			if unit_id then
				slot11 = data.sequence
				slot16 = "on_executed"

				managers.mission.add_runned_unit_sequence_trigger(slot8, managers.mission, unit_id, callback(slot13, self, self))
			else
				slot12 = self._values.instance_name

				_G.debug_pause(slot8, "[ElementUnitSequenceTrigger:on_executed] Trying to run sequnce on a non existing unit. Editor name of the mission element:", data.unit_id, self._editor_name)
			end
		end
	end

	self._has_active_callback = true

	return 
end
ElementUnitSequenceTrigger.send_to_host = function (self, instigator)
	slot4 = instigator

	if alive(slot3) then
		slot4 = managers.network
		slot7 = instigator

		managers.network.session(slot3).send_to_host(slot3, managers.network.session(slot3), "to_server_mission_element_trigger", self._id)
	end

	return 
end
ElementUnitSequenceTrigger.client_on_executed = function (self, ...)
	return 
end
ElementUnitSequenceTrigger.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementUnitSequenceTrigger.super.on_executed(slot3, self)

	return 
end
ElementUnitSequenceTrigger.save = function (self, data)
	data.enabled = self._values.enabled
	data.save_me = true

	return 
end
ElementUnitSequenceTrigger.load = function (self, data)
	self._values.enabled = data.enabled

	if not self._has_active_callback then
		slot4 = self

		self.on_script_activated(slot3)
	end

	return 
end

return 
