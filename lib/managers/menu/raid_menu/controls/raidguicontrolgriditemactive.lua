if not RaidGUIControlGridItemActive then
	slot2 = RaidGUIControlGridItem
	slot0 = class(slot1)
end

RaidGUIControlGridItemActive = slot0
RaidGUIControlGridItemActive.init = function (self, parent, params, item_data, grid_params)
	slot11 = grid_params

	RaidGUIControlGridItemActive.super.init(slot6, self, parent, params, item_data)

	return 
end
RaidGUIControlGridItemActive.active = function (self)
	return self._active
end
RaidGUIControlGridItemActive.activate = function (self)
	self._active = true
	slot3 = self._triangle_markers_panel

	self._triangle_markers_panel.show(slot2)

	return 
end
RaidGUIControlGridItemActive.deactivate = function (self)
	self._active = false
	slot3 = self._triangle_markers_panel

	self._triangle_markers_panel.hide(slot2)

	return 
end
RaidGUIControlGridItemActive.select_on = function (self)
	slot3 = self._select_background_panel

	self._select_background_panel.show(slot2)

	return 
end
RaidGUIControlGridItemActive.select_off = function (self)
	slot3 = self._select_background_panel

	self._select_background_panel.hide(slot2)

	return 
end

return 
