-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreSlaveManager"

core.module(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreSlaveUpdators"

core.import(slot1, core)

SlaveManager = SlaveManager or class()
SlaveManager.init = function (self)
	self._updator = nil
	self._status = false

	return 
end
SlaveManager.update = function (self, t, dt)
	if self._status then
		slot7 = dt

		self._updator.update(slot4, self._updator, t)
	end

	return 
end
SlaveManager.paused_update = function (self, t, dt)
	slot7 = dt

	self.update(slot4, self, t)

	return 
end
SlaveManager.start = function (self, vp, port)
	slot6 = "[SlaveManager] Already started!"

	assert(slot4, not self._status)

	slot7 = port
	self._updator, self._status = CoreSlaveUpdators.SlaveUpdator.new(slot4, CoreSlaveUpdators.SlaveUpdator, vp)

	return self._status
end
SlaveManager.act_master = function (self, host, port, lsport, manual_pumping)
	slot12 = managers.viewport
	slot12 = manual_pumping
	self._updator, self._status = CoreSlaveUpdators.MasterUpdator.new(slot6, CoreSlaveUpdators.MasterUpdator, assert(managers.viewport.first_active_viewport(slot11)), host, port, lsport)

	return self._status
end
SlaveManager.set_batch_count = function (self, count)
	slot5 = "[SlaveManager] Batch count must be more then 0!"

	assert(slot3, not count or 0 < count)

	slot5 = count

	self._updator.set_batch_count(slot3, self._updator)

	return 
end
SlaveManager.connected = function (self)
	return self._status
end
SlaveManager.type = function (self)
end
SlaveManager.peer = function (self)
end

return 
