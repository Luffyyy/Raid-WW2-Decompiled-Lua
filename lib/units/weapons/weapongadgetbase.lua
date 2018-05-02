if not WeaponGadgetBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

WeaponGadgetBase = slot0
WeaponGadgetBase.GADGET_TYPE = ""
WeaponGadgetBase.init = function (self, unit)
	slot5 = unit

	WeaponGadgetBase.super.init(slot3, self)

	self._on = false

	return 
end
WeaponGadgetBase.set_npc = function (self)
	return 
end
WeaponGadgetBase.set_state = function (self, on, sound_source)
	slot5 = self

	if not self.is_bipod(slot4) then
		if self._on ~= on and sound_source and (self._on_event or self._off_event) then
			slot6 = (on and self._on_event) or self._off_event

			sound_source.post_event(slot4, sound_source)
		end

		self._on = on
	end

	slot5 = self

	self._check_state(slot4)

	return 
end
WeaponGadgetBase.is_usable = function (self)
	return true
end
WeaponGadgetBase.set_on = function (self)
	self._on = true
	slot3 = self

	self._check_state(slot2)

	return 
end
WeaponGadgetBase.set_off = function (self)
	self._on = false
	slot3 = self

	self._check_state(slot2)

	return 
end
WeaponGadgetBase.toggle = function (self)
	self._on = not self._on
	slot3 = self

	self._check_state(slot2)

	return 
end
WeaponGadgetBase.is_on = function (self)
	return self._on
end
WeaponGadgetBase.toggle_requires_stance_update = function (self)
	return false
end
WeaponGadgetBase._check_state = function (self)
	return 
end
WeaponGadgetBase.is_bipod = function (self)
	return false
end
WeaponGadgetBase.destroy = function (self, unit)
	slot5 = unit

	WeaponGadgetBase.super.pre_destroy(slot3, self)

	return 
end

return 
