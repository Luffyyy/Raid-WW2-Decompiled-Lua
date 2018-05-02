slot2 = "core/lib/utils/dev/ews/tree_control/CoreBaseTreeNode"

require(slot1)

if not CoreEWSTreeCtrlTreeNode then
	slot2 = CoreBaseTreeNode
	slot0 = class(slot1)
end

CoreEWSTreeCtrlTreeNode = slot0
CoreEWSTreeCtrlTreeNode.init = function (self, ews_tree_ctrl, item_id, checkbox_style)
	self._checkbox_style = checkbox_style
	slot7 = "nil argument supplied as ews_tree_ctrl"
	self._tree_ctrl = assert(slot5, ews_tree_ctrl)
	slot7 = "nil argument supplied as item_id"
	self._item_id = assert(slot5, item_id)
	slot7 = 0

	self.set_state(slot5, self)

	return 
end
CoreEWSTreeCtrlTreeNode.id = function (self)
	return self._item_id
end
CoreEWSTreeCtrlTreeNode.expand = function (self, recurse)
	slot5 = self._item_id

	self._tree_ctrl.expand(slot3, self._tree_ctrl)

	if recurse then
		slot6 = self

		for _, child in ipairs(self.children(slot5)) do
			slot10 = true

			child.expand(slot8, child)
		end
	end

	return 
end
CoreEWSTreeCtrlTreeNode.collapse = function (self, recurse)
	slot5 = self._item_id

	self._tree_ctrl.collapse(slot3, self._tree_ctrl)

	if recurse then
		slot6 = self

		for _, child in ipairs(self.children(slot5)) do
			slot10 = true

			child.collapse(slot8, child)
		end
	end

	return 
end
CoreEWSTreeCtrlTreeNode.set_selected = function (self, state)
	if state == nil then
		state = true
	end

	slot6 = state

	self._tree_ctrl.select_item(slot3, self._tree_ctrl, self._item_id)

	return 
end
CoreEWSTreeCtrlTreeNode.state = function (self, state)
	if self._checkbox_style then
		slot6 = "NORMAL"

		return self._tree_ctrl.get_item_image(slot3, self._tree_ctrl, self._item_id)
	else
		return 0
	end

	return 
end
CoreEWSTreeCtrlTreeNode.set_state = function (self, state)
	if self._checkbox_style then
		slot5 = state

		self._change_state(slot3, self)
	end

	return 
end
CoreEWSTreeCtrlTreeNode.checkbox_style = function (self)
	return self._checkbox_style
end
CoreEWSTreeCtrlTreeNode.set_checkbox_style = function (self, style)
	self._checkbox_style = style

	return 
end
CoreEWSTreeCtrlTreeNode.set_image = function (self, image, item_state)
	slot8 = item_state or "NORMAL"

	self._tree_ctrl.set_item_image(slot4, self._tree_ctrl, self._item_id, image)

	return 
end
CoreEWSTreeCtrlTreeNode.get_image = function (self, item_state)
	slot6 = item_state or "NORMAL"

	return self._tree_ctrl.get_item_image(slot3, self._tree_ctrl, self._item_id)
end
CoreEWSTreeCtrlTreeNode._change_state = function (self, state)
	slot7 = "NORMAL"

	self._tree_ctrl.set_item_image(slot3, self._tree_ctrl, self._item_id, state)

	return 
end
CoreEWSTreeCtrlTreeNode.text = function (self)
	slot4 = self._item_id

	return self._tree_ctrl.get_item_text(slot2, self._tree_ctrl)
end
CoreEWSTreeCtrlTreeNode.parent = function (self)
	slot4 = self._item_id
	local parent_id = self._tree_ctrl.get_parent(slot2, self._tree_ctrl)

	if parent_id ~= -1 then
		slot5 = parent_id

		if self._tree_ctrl.get_parent(slot3, self._tree_ctrl) ~= -1 then
			slot7 = self._checkbox_style

			return CoreEWSTreeCtrlTreeNode.new(slot3, CoreEWSTreeCtrlTreeNode, self._tree_ctrl, parent_id)
		end
	end

	return 
end
CoreEWSTreeCtrlTreeNode.children = function (self)
	slot6 = self._item_id

	function slot4(child_id)
		slot6 = self._checkbox_style

		return CoreEWSTreeCtrlTreeNode.new(slot2, CoreEWSTreeCtrlTreeNode, self._tree_ctrl, child_id)
	end

	return table.collect(slot2, self._tree_ctrl.get_children(slot4, self._tree_ctrl))
end
CoreEWSTreeCtrlTreeNode.append = function (self, text)
	slot10 = text
	slot7 = self._checkbox_style

	return CoreEWSTreeCtrlTreeNode.new(slot3, CoreEWSTreeCtrlTreeNode, self._tree_ctrl, self._tree_ctrl.append(slot7, self._tree_ctrl, self._item_id))
end
CoreEWSTreeCtrlTreeNode.remove = function (self)
	slot4 = self._item_id

	self._tree_ctrl.remove(slot2, self._tree_ctrl)

	return 
end
CoreEWSTreeCtrlTreeNode.has_children = function (self)
	slot6 = self._item_id

	return 0 < table.getn(self._tree_ctrl.get_children(slot4, self._tree_ctrl))
end

return 
