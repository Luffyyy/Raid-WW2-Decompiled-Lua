if not MoveObjectInteractionExt then
	slot2 = UseInteractionExt
	slot0 = class(slot1)
end

MoveObjectInteractionExt = slot0
function MoveObjectInteractionExt:interact_distance(...)
	slot3 = self

	return MoveObjectInteractionExt.super.interact_distance(slot2, ...)
end
function MoveObjectInteractionExt:can_select(player)
	slot5 = player

	return MoveObjectInteractionExt.super.can_select(slot3, self)
end
function MoveObjectInteractionExt:check_interupt()
	slot3 = self

	return MoveObjectInteractionExt.super.check_interupt(slot2)
end
function MoveObjectInteractionExt:interact(player)
	slot5 = player

	MoveObjectInteractionExt.super.super.interact(slot3, self)

	slot5 = "MoveObjectInteractionExt:interact: "
	slot8 = self._unit

	Application.trace(slot3, Application, inspect(slot7))

	slot6 = {
		moving_unit = self._unit
	}

	managers.player.set_player_state(slot3, managers.player, "move_object")

	return 
end
function MoveObjectInteractionExt:sync_interacted(peer, player, status, skip_alive_check)
	if not self._active then
		return 
	end

	return 
end
function MoveObjectInteractionExt:set_contour(color, opacity)
	return 
end

return 
