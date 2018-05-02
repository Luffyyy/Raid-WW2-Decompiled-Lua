if not RaidGUIControlBranchingBarNode then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlBranchingBarNode = slot0
RaidGUIControlBranchingBarNode.STATE_INACTIVE = "STATE_INACTIVE"
RaidGUIControlBranchingBarNode.STATE_HOVER = "STATE_HOVER"
RaidGUIControlBranchingBarNode.STATE_ACTIVE = "STATE_ACTIVE"
RaidGUIControlBranchingBarNode.STATE_SELECTED = "STATE_SELECTED"
RaidGUIControlBranchingBarNode.STATE_PENDING = "STATE_PENDING"
RaidGUIControlBranchingBarNode.STATE_PENDING_BLOCKED = "STATE_PENDING_BLOCKED"
RaidGUIControlBranchingBarNode.STATE_DISABLED = "STATE_DISABLED"
RaidGUIControlBranchingBarNode.init = function (self, parent, params)
	slot7 = params

	RaidGUIControlBranchingBarNode.super.init(slot4, self, parent)

	slot5 = self

	self._create_panel(slot4)

	self._parents = params.parents or {
		1
	}
	self._level = params.level or 1
	self._state = params.state or self.STATE_INACTIVE

	return 
end
RaidGUIControlBranchingBarNode._create_panel = function (self)
	local panel_params = clone(slot2)
	panel_params.name = panel_params.name .. "_node"
	slot4 = self._panel
	panel_params.layer = self._panel.layer("_node") + 1
	panel_params.x = self._params.x or 0
	panel_params.y = self._params.y or 0
	panel_params.w = self._params.w
	panel_params.h = self._params.h
	slot5 = panel_params
	self._object = self._panel.panel(self._params, self._panel)

	return 
end
RaidGUIControlBranchingBarNode.set_inactive = function (self)
	return 
end
RaidGUIControlBranchingBarNode.set_selected = function (self)
	return 
end
RaidGUIControlBranchingBarNode.set_active = function (self)
	return 
end
RaidGUIControlBranchingBarNode.set_pending = function (self)
	return 
end
RaidGUIControlBranchingBarNode.set_pending_blocked = function (self)
	return 
end
RaidGUIControlBranchingBarNode.set_disabled = function (self)
	return 
end
RaidGUIControlBranchingBarNode.state = function (self)
	return self._state
end
RaidGUIControlBranchingBarNode.parents = function (self)
	return self._parents
end
RaidGUIControlBranchingBarNode.level = function (self)
	return self._level
end
RaidGUIControlBranchingBarNode.init_to_state = function (self, state)
	return 
end

return 
