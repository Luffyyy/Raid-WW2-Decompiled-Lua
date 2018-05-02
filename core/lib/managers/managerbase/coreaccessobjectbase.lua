slot3 = "CoreAccessObjectBase"

core.module(slot1, core)

AccessObjectBase = AccessObjectBase or class()
AccessObjectBase.init = function (self, manager, name)
	self.__manager = manager
	self.__name = name
	self.__active_requested = false
	self.__really_activated = false

	return 
end
AccessObjectBase.name = function (self)
	return self.__name
end
AccessObjectBase.active = function (self)
	return self.__active_requested
end
AccessObjectBase.active_requested = function (self)
	return self.__active_requested
end
AccessObjectBase.really_active = function (self)
	return self.__really_activated
end
AccessObjectBase.set_active = function (self, active)
	if self.__active_requested ~= active then
		self.__active_requested = active
		slot4 = self.__manager

		self.__manager._prioritize_and_activate(slot3)
	end

	return 
end
AccessObjectBase._really_activate = function (self)
	self.__really_activated = true

	return 
end
AccessObjectBase._really_deactivate = function (self)
	self.__really_activated = false

	return 
end

return 
