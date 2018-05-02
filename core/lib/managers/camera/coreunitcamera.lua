slot3 = "CoreUnitCamera"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

UnitCamera = UnitCamera or CoreClass.class()
UnitCamera.init = function (self, unit)
	self._unit = unit
	self._active_count = 0

	return 
end
UnitCamera.destroy = function (self)
	return 
end
UnitCamera.create_layers = function (self)
	return 
end
UnitCamera.activate = function (self)
	local is_deactivated = self._active_count == 0
	self._active_count = self._active_count + 1

	if is_deactivated then
		slot5 = true

		self.on_activate(slot3, self)
	end

	return 
end
UnitCamera.deactivate = function (self)
	slot3 = 0 < self._active_count

	assert(slot2)

	self._active_count = self._active_count - 1
	local should_deactivate = self._active_count == 0

	if should_deactivate then
		slot5 = false

		self.on_activate(slot3, self)
	end

	return should_deactivate
end
UnitCamera.on_activate = function (self, active)
	return 
end
UnitCamera.is_active = function (self)
	return 0 < self._active_count
end
UnitCamera.apply_camera = function (self, camera_manager)
	return 
end

return 
