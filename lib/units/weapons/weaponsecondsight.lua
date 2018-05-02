if not WeaponSecondSight then
	slot2 = WeaponGadgetBase
	slot0 = class(slot1)
end

WeaponSecondSight = slot0
WeaponSecondSight.GADGET_TYPE = "second_sight"
WeaponSecondSight.init = function (self, unit)
	slot5 = unit

	WeaponSecondSight.super.init(slot3, self)

	return 
end
WeaponSecondSight._check_state = function (self, ...)
	slot3 = self

	WeaponSecondSight.super._check_state(slot2, ...)

	return 
end
WeaponSecondSight.toggle_requires_stance_update = function (self)
	return true
end
WeaponSecondSight.destroy = function (self, unit)
	slot5 = unit

	WeaponSecondSight.super.destroy(slot3, self)

	return 
end

return 
