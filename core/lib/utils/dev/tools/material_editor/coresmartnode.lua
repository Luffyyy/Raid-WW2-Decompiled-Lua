CoreSmartNode = CoreSmartNode or class()
CoreSmartNode.init = function (self, node)
	self._parameters = {}
	self._children = {}
	slot4 = node

	if type(slot3) == "string" then
		self._name = node
	else
		slot4 = node
		self._name = node.name(slot3)
		slot6 = node

		for k, v in pairs(node.parameters(slot5)) do
			self._parameters[k] = v
		end

		slot4 = node

		for child in node.children(slot3) do
			slot8 = self._children
			slot12 = child

			table.insert(slot7, CoreSmartNode.new(slot10, CoreSmartNode))
		end
	end

	return 
end
CoreSmartNode.children = function (self)
	slot3 = self._children
	local count = table.getn(slot2)
	local i = 0

	return function ()
		i = i + 1

		if i <= count then
			return self._children[i]
		end

		return 
	end
end
CoreSmartNode.parameters = function (self)
	return self._parameters
end
CoreSmartNode.name = function (self)
	return self._name
end
CoreSmartNode.num_children = function (self)
	return #self._children
end
CoreSmartNode.parameter = function (self, k)
	return self._parameters[k]
end
CoreSmartNode.set_parameter = function (self, k, v)
	self._parameters[k] = v

	return 
end
CoreSmartNode.clear_parameter = function (self, k)
	self._parameters[k] = nil

	return 
end
CoreSmartNode.make_child = function (self, name)
	slot5 = name
	local node = CoreSmartNode.new(slot3, CoreSmartNode)
	slot6 = node

	table.insert(CoreSmartNode, self._children)

	return node
end
CoreSmartNode.add_child = function (self, n)
	slot5 = n
	local node = CoreSmartNode.new(slot3, CoreSmartNode)
	slot6 = node

	table.insert(CoreSmartNode, self._children)

	return node
end
CoreSmartNode.index_of_child = function (self, c)
	local i = 0
	slot5 = self

	for child in self.children(slot4) do
		if child == c then
			return i
		end

		i = i + 1
	end

	return -1
end
CoreSmartNode.remove_child_at = function (self, index)
	local i = index + 1
	self._children[i] = self._children[#self._children]
	self._children[#self._children] = nil

	return 
end
CoreSmartNode.to_real_node = function (self)
	slot3 = self._name
	local node = Node(slot2)
	slot6 = self

	for k, v in pairs(self.parameters(slot5)) do
		slot11 = v

		node.set_parameter(slot8, node, k)
	end

	slot4 = self

	for child in self.children(slot3) do
		slot8 = node
		slot11 = child

		node.add_child(slot7, child.to_real_node(slot10))
	end

	return node
end
CoreSmartNode.to_xml = function (self)
	slot3 = self
	slot3 = self.to_real_node(slot2)

	return self.to_real_node(slot2).to_xml(slot2)
end

return 
