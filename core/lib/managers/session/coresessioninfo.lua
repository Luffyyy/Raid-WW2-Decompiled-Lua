slot3 = "CoreSessionInfo"

core.module(slot1, core)

Info = Info or class()
Info.init = function (self)
	return 
end
Info.is_ranked = function (self)
	return self._is_ranked
end
Info.can_join_in_progress = function (self)
	return self._can_join_in_progress
end
Info.set_can_join_in_progress = function (self, possible)
	self._can_join_in_progress = possible

	return 
end
Info.set_level_name = function (self, name)
	self._level_name = name

	return 
end
Info.level_name = function (self)
	return self._level_name
end
Info.set_stage_name = function (self, stage_name)
	self._stage_name = stage_name

	return 
end
Info.stage_name = function (self)
	return self._stage_name
end
Info.set_run_mission_script = function (self, with_mission)
	self._run_mission_script = with_mission

	return 
end
Info.should_run_mission_script = function (self)
	return self._run_mission_script
end
Info.set_should_load_level = function (self, load_level)
	self._should_load_level = load_level

	return 
end
Info.should_load_level = function (self)
	return self._should_load_level
end

return 
