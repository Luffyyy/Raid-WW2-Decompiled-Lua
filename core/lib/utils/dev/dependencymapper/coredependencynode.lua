slot3 = "CoreDependencyNode"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

GAME = 0
LEVEL = 1
UNIT = 2
OBJECT = 3
MATERIAL_CONFIG = 4
TEXTURE = 6
CUTSCENE = 7
EFFECT = 8
MATERIALS_FILE = 9
MODEL = 10
DependencyNodeBase = DependencyNodeBase or CoreClass.class()
DependencyNodeBase.init = function (self, type_, db_type, name, get_dn_cb, database)
	slot10 = type_
	slot8 = type(slot9) == "number"

	assert(slot7)

	slot10 = name
	slot8 = type(slot9) == "string"

	assert(slot7)

	slot10 = get_dn_cb
	slot8 = type(slot9) == "function"

	assert(slot7)

	slot10 = database
	slot8 = type(slot9) == "userdata"

	assert(slot7)

	self._type = type_
	self._db_type = db_type
	self._name = name
	self._get_dn = get_dn_cb
	self._database = database
	self._parsed = false
	self._depends_on = {}

	return 
end
DependencyNodeBase.isdependencynode = function (self)
	return true
end
DependencyNodeBase.type_ = function (self)
	return self._type
end
DependencyNodeBase.name = function (self)
	return self._name
end
DependencyNodeBase.match = function (self, pattern)
	if pattern == nil then
		return true
	else
		slot5 = GAME

		if type(slot3) == type(pattern) then
			slot4 = self

			return pattern == self.type_(slot3)
		else
			slot4 = pattern

			if type(slot3) == "string" then
				slot4 = self.name(slot5)
				slot8 = pattern

				return string.match(slot3, string.format(self, "^%s$")) ~= nil
			elseif pattern.isdependencynode then
				return pattern == self
			else
				slot4 = pattern

				if type(slot3) == "table" then
					slot4 = pattern

					for _, f in ipairs(slot3) do
						if f == self then
							return true
						end
					end

					return false
				else
					slot7 = pattern

					error(string.format(slot5, "Filter '%s' not supported"))
				end
			end
		end
	end

	return 
end
DependencyNodeBase.get_dependencies = function (self)
	if not self._parsed then
		slot5 = self

		for _, xmlnode in ipairs(self._parse(slot4)) do
			slot9 = xmlnode

			self._walkxml(slot7, self)
		end

		self._parsed = true
	end

	local dn_list = {}
	slot4 = self._depends_on

	for dn, _ in pairs(slot3) do
		slot10 = dn

		table.insert(slot8, dn_list)
	end

	return dn_list
end
DependencyNodeBase.reached = function (self, pattern)
	local found = {}
	slot8 = found

	self._reached(slot4, self, pattern, {})

	return found
end
DependencyNodeBase._reached = function (self, pattern, traversed, found)
	if traversed[self] then
		return 
	else
		traversed[self] = true
		slot7 = pattern

		if self.match(slot5, self) then
			slot7 = self

			table.insert(slot5, found)
		end

		slot8 = self

		for _, dn in ipairs(self.get_dependencies(slot7)) do
			slot14 = found

			dn._reached(slot10, dn, pattern, traversed)
		end
	end

	return 
end
DependencyNodeBase._parse = function (self)
	local entry = self._database.lookup(slot2, self._database, self._db_type)
	slot6 = entry

	assert(entry.valid(self._name))

	slot5 = entry
	local xmlnode = self._database.load_node(self._database, self._database)

	return {
		xmlnode
	}
end
DependencyNodeBase._walkxml = function (self, xmlnode)
	local deps = _Deps.new(slot3)
	slot7 = deps

	self._walkxml2dependencies(_Deps, self, xmlnode)

	slot5 = deps

	for _, dn in deps.get_pairs(_Deps) do
		self._depends_on[dn] = true
	end

	slot5 = xmlnode

	for child in xmlnode.children(slot4) do
		slot10 = child

		self._walkxml(slot8, self)
	end

	return 
end
DependencyNodeBase._walkxml2dependencies = function (self, xmlnode, deps)
	slot5 = "Not Implemented"

	error(slot4)

	return 
end
_Deps = _Deps or CoreClass.class()
_Deps.init = function (self)
	self._dnlist = {}

	return 
end
_Deps.add = function (self, dn)
	slot5 = dn

	table.insert(slot3, self._dnlist)

	return 
end
_Deps.get_pairs = function (self)
	slot3 = self._dnlist

	return ipairs(slot2)
end

return 
