if not NpcGrenade then
	slot2 = GrenadeBase
	slot0 = class(slot1)
end

NpcGrenade = slot0
NpcGrenade._setup_from_tweak_data = function (self)
	self._tweak_data = tweak_data.weapon[self.name_id]

	return 
end
NpcGrenade.weapon_tweak_data = function (self)
	return self._tweak_data
end

return 
