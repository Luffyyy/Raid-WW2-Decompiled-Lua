slot3 = "CoreLocalUserStorageStates"

core.module(slot1, core)

Init = Init or class()
Init.transition = function (self)
	slot3 = self.storage._load

	if self.storage._load.is_requested(slot2) then
		return Loading
	end

	return 
end
DetectSignOut = DetectSignOut or class()
DetectSignOut.init = function (self)
	return 
end

if not Loading then
	slot2 = DetectSignOut
	slot0 = class(slot1)
end

Loading = slot0
Loading.init = function (self)
	slot3 = self

	DetectSignOut.init(slot2)

	slot3 = self.storage

	self.storage._start_load_task(slot2)

	return 
end
Loading.destroy = function (self)
	slot3 = self.storage

	self.storage._close_load_task(slot2)

	return 
end
Loading.transition = function (self)
	slot3 = self.storage
	local status = self.storage._load_status(slot2)

	if not status then
		return 
	end

	if status == SaveData.OK then
		return Ready
	elseif status == SaveData.FILE_NOT_FOUND then
		return NoSaveGameFound
	else
		return LoadError
	end

	return 
end
Ready = Ready or class()
Ready.init = function (self)
	slot3 = self.storage

	self.storage._set_stable_for_loading(slot2)

	return 
end
Ready.destroy = function (self)
	slot3 = self.storage

	self.storage._not_stable_for_loading(slot2)

	return 
end
Ready.transition = function (self)
	return 
end
NoSaveGameFound = NoSaveGameFound or class()
NoSaveGameFound.init = function (self)
	slot3 = self.storage

	self.storage._set_stable_for_loading(slot2)

	return 
end
NoSaveGameFound.transition = function (self)
	slot3 = self.storage

	self.storage._not_stable_for_loading(slot2)

	return 
end
LoadError = LoadError or class()
LoadError.transition = function (self)
	return 
end

return 
