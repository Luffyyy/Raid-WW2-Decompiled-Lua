slot3 = "CorePlayerSlotStateLocalUserBound"

core.module(slot1, core)

slot3 = "CorePlayerSlotStateInit"

core.import(slot1, core)

LocalUserBound = LocalUserBound or class()
LocalUserBound.init = function (self, local_user)
	self._local_user = local_user

	return 
end
LocalUserBound.destroy = function (self)
	return 
end
LocalUserBound.transition = function (self)
	slot3 = self.player_slot._init

	if self.player_slot._init.is_requested(slot2) then
		return CorePlayerSlotStateInit.Init
	end

	return 
end

return 
