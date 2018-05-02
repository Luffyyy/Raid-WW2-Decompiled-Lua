if not TurretInteractionExt then
	slot2 = UseInteractionExt
	slot0 = class(slot1)
end

TurretInteractionExt = slot0
TurretInteractionExt.interact_distance = function (self, ...)
	slot3 = self

	return TurretInteractionExt.super.interact_distance(slot2, ...)
end
TurretInteractionExt.can_select = function (self, player)
	slot5 = player
	local super_condition = TurretInteractionExt.super.can_select(slot3, self)
	slot5 = self._unit
	local taken = self._unit.weapon(self).player_on(self)
	slot6 = self._unit
	slot6 = self._unit.weapon(self._unit.weapon(self))
	local locked = self._unit.weapon(self._unit.weapon(self)).locked_fire(self._unit.weapon(self))

	return super_condition and not taken and not locked
end
TurretInteractionExt.check_interupt = function (self)
	slot3 = self

	return TurretInteractionExt.super.check_interupt(slot2)
end
TurretInteractionExt.interact = function (self, player)
	slot5 = player

	TurretInteractionExt.super.super.interact(slot3, self)

	slot5 = self._unit

	managers.player.use_turret(slot3, managers.player)

	slot5 = "turret"

	managers.player.set_player_state(slot3, managers.player)

	return 
end
TurretInteractionExt.sync_interacted = function (self, peer, player, status, skip_alive_check)
	if not self._active then
		return 
	end

	return 
end
TurretInteractionExt.set_contour = function (self, color, opacity)
	return 
end

return 
