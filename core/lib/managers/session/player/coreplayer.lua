slot3 = "CorePlayer"

core.module(slot1, core)

slot3 = "CoreAvatar"

core.import(slot1, core)

Player = Player or class()
Player.init = function (self, player_slot, player_handler)
	self._player_slot = player_slot
	self._player_handler = player_handler
	slot5 = self._player_handler

	assert(slot4)

	self._player_handler._core_player = self

	return 
end
Player.destroy = function (self)
	if self._level_handler then
		slot4 = self._level_handler

		self.leave_level(slot2, self)
	end

	if self._avatar then
		slot3 = self

		self._destroy_avatar(slot2)
	end

	slot3 = self._player_handler

	self._player_handler.destroy(slot2)

	self._player_handler = nil

	return 
end
Player.avatar = function (self)
	return self._avatar
end
Player.has_avatar = function (self)
	return self._avatar ~= nil
end
Player.is_alive = function (self)
	return self._player_handler ~= nil
end
Player._destroy_avatar = function (self)
	slot3 = self._player_handler

	self._player_handler.release_avatar(slot2)

	slot3 = self._avatar

	self._avatar.destroy(slot2)

	self._avatar = nil

	return 
end
Player.avatar_handler = function (self)
	return self._avatar_handler
end
Player.enter_level = function (self, level_handler)
	slot5 = level_handler

	self._player_handler.enter_level(slot3, self._player_handler)

	local avatar_handler = self._player_handler.spawn_avatar(slot3)
	slot6 = avatar_handler
	self._avatar = CoreAvatar.Avatar.new(self._player_handler, CoreAvatar.Avatar)
	avatar_handler._core_avatar = self._avatar
	slot6 = avatar_handler

	self._player_handler.set_avatar(self._player_handler, self._player_handler)

	self._level_handler = level_handler

	return 
end
Player.leave_level = function (self, level_handler)
	if self._avatar then
		slot4 = self

		self._destroy_avatar(slot3)
	end

	slot5 = level_handler

	self._player_handler.leave_level(slot3, self._player_handler)

	self._level_handler = nil

	return 
end
Player.player_slot = function (self)
	return self._player_slot
end
Player.set_leaderboard_position = function (self, position)
	self._leaderboard_position = position

	return 
end
Player.set_team = function (self, team)
	self._team = team

	return 
end

return 
