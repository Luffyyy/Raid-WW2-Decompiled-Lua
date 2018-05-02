if not RaidGUIControlBranchingBarPath then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlBranchingBarPath = slot0
RaidGUIControlBranchingBarPath.STATE_LOCKED = "STATE_LOCKED"
RaidGUIControlBranchingBarPath.STATE_FULL = "STATE_FULL"
RaidGUIControlBranchingBarPath.STATE_ACTIVE = "STATE_ACTIVE"
RaidGUIControlBranchingBarPath.STATE_DISABLED = "STATE_DISABLED"
RaidGUIControlBranchingBarPath.init = function (self, parent, params)
	slot7 = params

	RaidGUIControlBranchingBarPath.super.init(slot4, self, parent)

	self._starting_point_index = params.starting_point_index
	self._starting_point = params.starting_point
	self._ending_point_index = params.ending_point_index
	self._ending_point = params.ending_point
	self._progress = params.progress or 0
	self._state = params.state or self.STATE_ACTIVE

	return 
end
RaidGUIControlBranchingBarPath.set_locked = function (self)
	return 
end
RaidGUIControlBranchingBarPath.set_active = function (self)
	return 
end
RaidGUIControlBranchingBarPath.set_full = function (self)
	return 
end
RaidGUIControlBranchingBarPath.set_disabled = function (self)
	return 
end
RaidGUIControlBranchingBarPath.set_progress = function (self, progress)
	self._progress = progress

	return 
end
RaidGUIControlBranchingBarPath.state = function (self)
	return self._state
end
RaidGUIControlBranchingBarPath.endpoints = function (self)
	return {
		self._starting_point_index,
		self._ending_point_index
	}
end
RaidGUIControlBranchingBarPath.init_to_state = function (self, state)
	return 
end

return 
