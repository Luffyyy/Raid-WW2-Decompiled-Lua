ChallengeTask = ChallengeTask or class()
ChallengeTask.STATE_INACTIVE = "inactive"
ChallengeTask.STATE_ACTIVE = "active"
ChallengeTask.STATE_COMPLETED = "completed"
ChallengeTask.STATE_FAILED = "failed"
ChallengeTask.create = function (task_type, challenge_category, challenge_id, task_data)
	if task_type == ChallengeTweakData.TASK_KILL_ENEMIES then
		slot9 = task_data

		return ChallengeTaskKillEnemies.new(slot5, ChallengeTaskKillEnemies, challenge_category, challenge_id)
	elseif task_type == ChallengeTweakData.TASK_COLLECT_AMMO then
		slot9 = task_data

		return ChallengeTaskCollectAmmo.new(slot5, ChallengeTaskCollectAmmo, challenge_category, challenge_id)
	end

	return 
end
ChallengeTask.get_metatable = function (task_type)
	if task_type == ChallengeTweakData.TASK_KILL_ENEMIES then
		return ChallengeTaskKillEnemies
	elseif task_type == ChallengeTweakData.TASK_COLLECT_AMMO then
		return ChallengeTaskCollectAmmo
	end

	return 
end
function ChallengeTask:init()
	self._state = ChallengeTask.STATE_INACTIVE

	return 
end
function ChallengeTask:setup()
	if self._state == ChallengeTask.STATE_ACTIVE then
		self._state = ChallengeTask.STATE_INACTIVE
		slot3 = self

		self.activate(slot2)
	end

	return 
end
function ChallengeTask:activate()
	self._state = ChallengeTask.STATE_ACTIVE

	return 
end
function ChallengeTask:deactivate()
	self._state = ChallengeTask.STATE_INACTIVE

	return 
end
function ChallengeTask:reset()
	if self._state == Challenge.STATE_COMPLETED or self._state == Challenge.STATE_FAILED then
		self._state = Challenge.STATE_INACTIVE
	end

	return 
end
function ChallengeTask:active()
	return (self._state == ChallengeTask.STATE_ACTIVE and true) or false
end
function ChallengeTask:completed()
	return (self._state == ChallengeTask.STATE_COMPLETED and true) or false
end
function ChallengeTask:id()
	return self._id
end
function ChallengeTask:type()
	return self._type
end
function ChallengeTask:force_complete()
	slot3 = self

	if self.completed(slot2) then
		return 
	end

	self._state = ChallengeTask.STATE_COMPLETED

	return 
end

if not ChallengeTaskKillEnemies then
	slot2 = ChallengeTask
	slot0 = class(slot1)
end

ChallengeTaskKillEnemies = slot0
function ChallengeTaskKillEnemies:init(challenge_category, challenge_id, task_data)
	slot6 = self

	ChallengeTaskKillEnemies.super.init(slot5)

	self._count = 0
	self._target = task_data.target
	self._min_range = task_data.min_range
	self._parent_challenge_category = challenge_category
	self._parent_challenge_id = challenge_id
	self._id = self._parent_challenge_id .. "_kill_enemies"
	self._type = ChallengeTweakData.TASK_KILL_ENEMIES
	self._modifiers = task_data.modifiers or {}
	self._reminders = task_data.reminders or {}

	return 
end
function ChallengeTaskKillEnemies:activate()
	slot3 = self

	ChallengeTaskKillEnemies.super.activate(slot2)

	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_KILLED_ENEMY
	}
	slot10 = "on_enemy_killed"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, self._id, callback(slot7, self, self))

	return 
end
function ChallengeTaskKillEnemies:deactivate()
	slot3 = self

	ChallengeTaskKillEnemies.super.deactivate(slot2)

	slot4 = self._id

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
end
function ChallengeTaskKillEnemies:reset()
	slot3 = self

	ChallengeTaskKillEnemies.super.reset(slot2)

	self._count = 0

	return 
end
function ChallengeTaskKillEnemies:current_count()
	return self._count
end
function ChallengeTaskKillEnemies:target()
	return self._target
end
function ChallengeTaskKillEnemies:min_range()
	return self._modifiers.min_range or 0
end
function ChallengeTaskKillEnemies:set_reminders(reminders)
	self._reminders = reminders

	return 
end
function ChallengeTaskKillEnemies:set_modifiers(modifiers)
	self._modifiers = modifiers

	return 
end
function ChallengeTaskKillEnemies:on_enemy_killed(kill_data)
	if kill_data.using_turret then
		return 
	end

	if self._modifiers.damage_type and self._modifiers.damage_type ~= kill_data.damage_type then
		return 
	end

	if self._modifiers.headshot and not kill_data.headshot then
		return 
	end

	if self._modifiers.hip_fire and kill_data.player_used_steelsight then
		return 
	end

	if self._modifiers.min_range and kill_data.enemy_distance < self._modifiers.min_range then
		return true
	end

	if self._modifiers.enemy_type then
		local is_correct_enemy_type = false
		slot5 = self._modifiers.enemy_type

		for i, enemy_type in pairs(slot4) do
			if kill_data.enemy_type == enemy_type or kill_data.special_enemy_type == enemy_type then
				is_correct_enemy_type = true
			end
		end

		if not is_correct_enemy_type then
			return 
		end
	end

	if self._modifiers.last_round_in_magazine and kill_data.damage_type == "bullet" then
		slot4 = kill_data.weapon_used
		slot4 = kill_data.weapon_used.base(slot3)

		if 0 < kill_data.weapon_used.base(slot3).get_ammo_remaining_in_clip(slot3) then
			return 
		end
	end

	self._count = self._count + 1

	for i = 1, #self._reminders, 1 do
		if self._count == self._reminders[i] then
			slot10 = self._parent_challenge_id
			local challenge_data = managers.challenge.get_challenge(slot7, managers.challenge, self._parent_challenge_category).data(slot7)
			slot12 = challenge_data.skill_index

			managers.weapon_skills.remind_weapon_challenge(managers.challenge.get_challenge(slot7, managers.challenge, self._parent_challenge_category), managers.weapon_skills, challenge_data.weapon, challenge_data.tier)
		end
	end

	slot4 = self

	self._check_status(slot3)

	return 
end
function ChallengeTaskKillEnemies:_check_status()
	if self._target <= self._count then
		slot3 = self

		self._on_completed(slot2)
	end

	return 
end
function ChallengeTaskKillEnemies:_on_completed()
	self._state = ChallengeTask.STATE_COMPLETED
	slot5 = self._parent_challenge_id
	slot3 = managers.challenge.get_challenge(slot2, managers.challenge, self._parent_challenge_category)

	managers.challenge.get_challenge(slot2, managers.challenge, self._parent_challenge_category).on_task_completed(slot2)

	slot4 = self._id

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
end
function ChallengeTaskKillEnemies:force_complete()
	slot3 = self

	if self.completed(slot2) then
		return 
	end

	self._state = ChallengeTask.STATE_COMPLETED
	self._count = self._target
	slot4 = self._id

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
end

if not ChallengeTaskCollectAmmo then
	slot2 = ChallengeTask
	slot0 = class(slot1)
end

ChallengeTaskCollectAmmo = slot0
function ChallengeTaskCollectAmmo:init(challenge_category, challenge_id, task_data)
	slot6 = self

	ChallengeTaskCollectAmmo.super.init(slot5)

	self._count = 0
	self._target = task_data.target
	self._parent_challenge_category = challenge_category
	self._parent_challenge_id = challenge_id
	self._id = self._parent_challenge_id .. "_collect_ammo"
	self._type = ChallengeTweakData.TASK_COLLECT_AMMO
	self._reminders = task_data.reminders or {}

	return 
end
function ChallengeTaskCollectAmmo:activate()
	slot3 = self

	ChallengeTaskCollectAmmo.super.activate(slot2)

	slot5 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.PLAYER_PICKED_UP_AMMO
	}
	slot10 = "on_ammo_collected"

	managers.system_event_listener.add_listener(slot2, managers.system_event_listener, self._id, callback(slot7, self, self))

	return 
end
function ChallengeTaskCollectAmmo:deactivate()
	slot3 = self

	ChallengeTaskCollectAmmo.super.deactivate(slot2)

	slot4 = self._id

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
end
function ChallengeTaskCollectAmmo:reset()
	slot3 = self

	ChallengeTaskKillEnemies.super.reset(slot2)

	self._count = 0

	return 
end
function ChallengeTaskCollectAmmo:current_count()
	return self._count
end
function ChallengeTaskCollectAmmo:target()
	return self._target
end
function ChallengeTaskCollectAmmo:min_range()
	return 0
end
function ChallengeTaskCollectAmmo:set_reminders(reminders)
	self._reminders = reminders

	return 
end
function ChallengeTaskCollectAmmo:set_modifiers(modifiers)
	self._modifiers = modifiers

	return 
end
function ChallengeTaskCollectAmmo:on_ammo_collected(ammo_info)
	slot4 = managers.raid_job

	if managers.raid_job.is_camp_loaded(slot3) then
		return 
	end

	self._count = self._count + ammo_info.amount

	if self._target < self._count then
		self._count = self._target
	end

	for i = 1, #self._reminders, 1 do
		if self._count == self._reminders[i] then
			slot10 = self._parent_challenge_id
			local challenge_data = managers.challenge.get_challenge(slot7, managers.challenge, self._parent_challenge_category).data(slot7)
			slot12 = challenge_data.skill_index

			managers.weapon_skills.remind_weapon_challenge(managers.challenge.get_challenge(slot7, managers.challenge, self._parent_challenge_category), managers.weapon_skills, challenge_data.weapon, challenge_data.tier)
		end
	end

	slot4 = self

	self._check_status(slot3)

	return 
end
function ChallengeTaskCollectAmmo:_check_status()
	if self._target <= self._count then
		slot3 = self

		self._on_completed(slot2)
	end

	return 
end
function ChallengeTaskCollectAmmo:_on_completed()
	self._state = ChallengeTask.STATE_COMPLETED
	slot5 = self._parent_challenge_id
	slot3 = managers.challenge.get_challenge(slot2, managers.challenge, self._parent_challenge_category)

	managers.challenge.get_challenge(slot2, managers.challenge, self._parent_challenge_category).on_task_completed(slot2)

	slot4 = self._id

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
end
function ChallengeTaskCollectAmmo:force_complete()
	slot3 = self

	if self.completed(slot2) then
		return 
	end

	self._state = ChallengeTask.STATE_COMPLETED
	self._count = self._target
	slot4 = self._id

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	return 
end

return 
