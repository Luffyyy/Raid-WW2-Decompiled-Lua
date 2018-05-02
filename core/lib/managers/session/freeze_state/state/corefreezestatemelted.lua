slot3 = "CoreFreezeStateMelted"

core.module(slot1, core)

Melted = Melted or class()
Melted.init = function (self)
	slot3 = self.freeze_state

	self.freeze_state._set_stable_for_loading(slot2)

	return 
end
Melted.destroy = function (self)
	slot3 = self.freeze_state

	self.freeze_state._not_stable_for_loading(slot2)

	return 
end
Melted.transition = function (self)
	return 
end

return 
