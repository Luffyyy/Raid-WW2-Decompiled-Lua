if not HuskTeamAIBase then
	slot2 = HuskCopBase
	slot0 = class(slot1)
end

HuskTeamAIBase = slot0
HuskTeamAIBase.default_weapon_name = function (self)
	slot3 = self

	return TeamAIBase.default_weapon_name(slot2)
end
HuskTeamAIBase.post_init = function (self)
	slot3 = self._unit
	self._ext_anim = self._unit.anim_data(slot2)
	slot3 = self._unit
	slot3 = self._unit.movement(slot2)

	self._unit.movement(slot2).post_init(slot2)

	slot4 = 1

	self.set_anim_lod(slot2, self)

	self._lod_stage = 1
	self._allow_invisible = true
	slot3 = self

	TeamAIBase._register(slot2)

	slot4 = self._unit

	managers.occlusion.remove_occlusion(slot2, managers.occlusion)

	return 
end
HuskTeamAIBase.nick_name = function (self)
	slot3 = self

	return TeamAIBase.nick_name(slot2)
end
HuskTeamAIBase.on_death_exit = function (self)
	slot3 = self

	HuskTeamAIBase.super.on_death_exit(slot2)

	slot3 = self

	TeamAIBase.unregister(slot2)

	slot5 = 0

	self.set_slot(slot2, self, self._unit)

	return 
end
HuskTeamAIBase.pre_destroy = function (self, unit)
	slot4 = self

	TeamAIBase.unregister(slot3)

	slot5 = unit

	UnitBase.pre_destroy(slot3, self)

	return 
end
HuskTeamAIBase.load = function (self, data)
	self._tweak_table = data.base.tweak_table or self._tweak_table
	local character_name = self._tweak_table

	if character_name then
		slot6 = character_name
		local old_unit = managers.criminals.character_unit_by_name(slot4, managers.criminals)

		if old_unit then
			slot6 = managers.network
			slot7 = old_unit
			local peer = managers.network.session(slot5).peer_by_unit(slot5, managers.network.session(slot5))

			if peer then
				slot7 = managers.network
				slot8 = peer
				slot11 = peer

				managers.network.session(slot6).on_peer_lost(slot6, managers.network.session(slot6), peer.id(slot10))
			end
		end
	end

	return 
end
HuskTeamAIBase.chk_freeze_anims = function (self)
	return 
end
HuskTeamAIBase.unregister = function (self)
	slot3 = self

	TeamAIBase.unregister(slot2)

	return 
end

return 
