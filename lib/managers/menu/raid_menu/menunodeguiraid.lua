if not MenuNodeGuiRaid then
	slot2 = MenuNodeGui
	slot0 = class(slot1)
end

MenuNodeGuiRaid = slot0
MenuNodeGuiRaid.init = function (self, node, layer, parameters)
	slot9 = parameters

	MenuNodeGuiRaid.super.init(slot5, self, node, layer)

	self.node.node_gui_object = self

	return 
end
MenuNodeGuiRaid._setup_item_panel = function (self, safe_rect, res)
	MenuNodeGuiRaid.super._setup_item_panel(slot4, self, safe_rect)

	slot5 = self.item_panel
	slot8 = self.item_panel
	slot8 = self.item_panel.parent(res)

	self.item_panel.set_shape(slot4, self.item_panel.parent(res).shape(res))

	return 
end
MenuNodeGuiRaid.close = function (self, ...)
	slot3 = self

	MenuNodeGuiRaid.super.close(slot2)

	self.node.node_gui_object = nil

	return 
end

return 
