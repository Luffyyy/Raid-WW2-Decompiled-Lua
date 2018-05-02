slot3 = "CoreAiDataManager"

core.module(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

AiDataManager = AiDataManager or class()
function AiDataManager:init()
	slot3 = self

	self._setup(slot2)

	return 
end
function AiDataManager:_setup()
	self._data = {
		patrol_paths = {}
	}

	return 
end
function AiDataManager:add_patrol_path(name)
	if self._data.patrol_paths[name] then
		slot5 = "Patrol path with name " .. name .. " already exists!"

		Application.error(slot3, Application)

		return false
	end

	self._data.patrol_paths[name] = {
		points = {}
	}

	return true
end
function AiDataManager:remove_patrol_path(name)
	if not self._data.patrol_paths[name] then
		slot5 = "Patrol path with name " .. name .. " doesn't exist!"

		Application.error(slot3, Application)

		return false
	end

	self._data.patrol_paths[name] = nil

	return true
end
function AiDataManager:add_patrol_point(name, unit)
	if not self._data.patrol_paths[name] then
		slot6 = "Patrol path with name " .. name .. " doesn't exist!"

		Application.error(slot4, Application)

		return 
	end

	local t = {}
	slot6 = unit
	t.position = unit.position(slot5)
	slot6 = unit
	t.rotation = unit.rotation(slot5)
	t.unit = unit
	slot6 = unit
	t.unit_id = unit.unit_data(slot5).unit_id
	slot7 = t

	table.insert(slot5, self._data.patrol_paths[name].points)

	return 
end
function AiDataManager:delete_point_by_unit(unit)
	slot4 = self._data.patrol_paths

	for name, path in pairs(slot3) do
		slot9 = path.points

		for i, point in ipairs(slot8) do
			if point.unit == unit then
				slot15 = i

				table.remove(slot13, path.points)

				return 
			end
		end
	end

	return 
end
function AiDataManager:patrol_path_by_unit(unit)
	slot4 = self._data.patrol_paths

	for name, path in pairs(slot3) do
		slot9 = path.points

		for i, point in ipairs(slot8) do
			if point.unit == unit then
				return name, path
			end
		end
	end

	return 
end
function AiDataManager:patrol_point_index_by_unit(unit)
	slot4 = self._data.patrol_paths

	for name, path in pairs(slot3) do
		slot9 = path.points

		for i, point in ipairs(slot8) do
			if point.unit == unit then
				return i, point
			end
		end
	end

	return 
end
function AiDataManager:patrol_path(name)
	return self._data.patrol_paths[name]
end
function AiDataManager:all_patrol_paths()
	return self._data.patrol_paths
end
function AiDataManager:patrol_path_names()
	local t = {}
	slot4 = self._data.patrol_paths

	for name, path in pairs(slot3) do
		slot10 = name

		table.insert(slot8, t)
	end

	slot4 = t

	table.sort(slot3)

	return t
end
function AiDataManager:destination_path(position, rotation)
	return {
		points = {
			{
				position = position,
				rotation = rotation
			}
		}
	}
end
function AiDataManager:clear()
	slot3 = self

	self._setup(slot2)

	return 
end
function AiDataManager:save_data()
	local t = CoreTable.deep_clone(slot2)
	slot4 = t.patrol_paths

	for name, path in pairs(self._data) do
		slot9 = path.points

		for i, point in ipairs(slot8) do
			slot14 = point.unit
			point.position = point.unit.position(slot13)
			slot14 = point.unit
			point.rotation = point.unit.rotation(slot13)
			point.unit = nil
		end
	end

	return t
end
function AiDataManager:load_data(data)
	if not data then
		return 
	end

	self._data = data

	return 
end
function AiDataManager:load_units(units)
	slot4 = units

	for _, unit in ipairs(slot3) do
		slot9 = self._data.patrol_paths

		for name, path in pairs(slot8) do
			slot14 = path.points

			for i, point in ipairs(slot13) do
				slot20 = unit

				if point.unit_id == unit.unit_data(slot19).unit_id then
					point.unit = unit
				end
			end
		end
	end

	return 
end

return 
