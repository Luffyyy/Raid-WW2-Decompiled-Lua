FoxholeExt = FoxholeExt or class()
FoxholeExt.init = function (self, unit)
	self._player = nil
	self._locked = false

	return 
end
FoxholeExt.register_player = function (self, player)
	self._player = player

	return 
end
FoxholeExt.unregister_player = function (self)
	self._player = nil

	return 
end
FoxholeExt.set_locked = function (self, locked)
	self._locked = locked

	return 
end
FoxholeExt.locked = function (self)
	return self._locked
end
FoxholeExt.release_player = function (self)
	slot4 = false

	self.set_locked(slot2, self)

	slot4 = "standard"

	managers.player.set_player_state(slot2, managers.player)

	return 
end
FoxholeExt.taken = function (self)
	return not not self._player
end
FoxholeExt.save = function (self, data)
	data.foxhole = {
		player = self._player,
		locked = self._locked
	}

	return 
end
FoxholeExt.load = function (self, data)
	if data.foxhole then
		self._player = data.foxhole.player
		self._locked = data.foxhole.locked
	end

	return 
end

return 
