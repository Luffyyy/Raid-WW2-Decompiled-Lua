if not HuskTeamAIMovement then
	slot2 = TeamAIMovement
	slot0 = class(slot1)
end

HuskTeamAIMovement = slot0
HuskTeamAIMovement.init = function (self, unit)
	slot5 = unit

	HuskTeamAIMovement.super.init(slot3, self)

	self._queued_actions = {}
	slot4 = self._m_pos
	self._m_host_stop_pos = mvector3.copy(slot3)

	return 
end
HuskTeamAIMovement._post_init = function (self)
	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)

	if managers.groupai.state(slot2).whisper_mode(slot2) then
		slot3 = self._unit
		slot5 = 24

		self._unit.base(slot2).set_slot(slot2, self._unit.base(slot2), self._unit)
	end

	slot4 = "idle"

	self.play_redirect(slot2, self)

	return 
end
HuskTeamAIMovement.sync_arrested = function (self)
	slot3 = self._unit
	slot4 = "free"

	self._unit.interaction(slot2).set_tweak_data(slot2, self._unit.interaction(slot2))

	slot3 = self._unit
	slot5 = false

	self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2), true)

	slot3 = self._unit
	slot5 = 24

	self._unit.base(slot2).set_slot(slot2, self._unit.base(slot2), self._unit)

	return 
end
HuskTeamAIMovement._upd_actions = function (self, t)
	slot5 = t

	TeamAIMovement._upd_actions(slot3, self)

	slot4 = self

	HuskCopMovement._chk_start_queued_action(slot3)

	return 
end
HuskTeamAIMovement.action_request = function (self, action_desc)
	slot5 = action_desc

	return HuskCopMovement.action_request(slot3, self)
end
HuskTeamAIMovement.chk_action_forbidden = function (self, action_desc)
	slot5 = action_desc

	return HuskCopMovement.chk_action_forbidden(slot3, self)
end

return 
