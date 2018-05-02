slot3 = "CoreMenuNode"

core.import(slot1, core)

slot3 = "CoreSerialize"

core.import(slot1, core)

slot3 = "CoreMenuItem"

core.import(slot1, core)

slot3 = "CoreMenuItemToggle"

core.import(slot1, core)

if not MenuNodeServerList then
	slot2 = MenuNodeTable
	slot0 = class(slot1)
end

MenuNodeServerList = slot0
MenuNodeServerList.init = function (self, data_node)
	slot5 = data_node

	MenuNodeServerList.super.init(slot3, self)

	return 
end
MenuNodeServerList.update = function (self, t, dt)
	slot7 = dt

	MenuNodeServerList.super.update(slot4, self, t)

	return 
end
MenuNodeServerList._setup_columns = function (self)
	slot4 = {
		proportions = 1.9,
		align = "left",
		text = string.upper(slot6)
	}
	slot7 = ""

	self._add_column(slot2, self)

	slot4 = {
		proportions = 1.7,
		align = "right",
		text = string.upper(slot6)
	}
	slot7 = ""

	self._add_column(slot2, self)

	slot4 = {
		proportions = 1,
		align = "right",
		text = string.upper(slot6)
	}
	slot7 = ""

	self._add_column(slot2, self)

	slot4 = {
		proportions = 0.225,
		align = "right",
		text = string.upper(slot6)
	}
	slot7 = ""

	self._add_column(slot2, self)

	return 
end

return 
