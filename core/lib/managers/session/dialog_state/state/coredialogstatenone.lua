slot3 = "CoreDialogStateNone"

core.module(slot1, core)

None = None or class()
None.init = function (self)
	slot3 = self.dialog_state

	self.dialog_state._set_stable_for_loading(slot2)

	return 
end
None.destroy = function (self)
	self.dialog_state._not_stable_for_loading()

	return 
end
None.transition = function (self)
	return 
end

return 
