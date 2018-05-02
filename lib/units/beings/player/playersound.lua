PlayerSound = PlayerSound or class()
PlayerSound.init = function (self, unit)
	self._unit = unit
	slot4 = unit
	slot4 = unit.base(slot3)

	unit.base(slot3).post_init(slot3)

	local ss = unit.sound_source(slot3)
	slot7 = "rb3"

	ss.set_switch(unit, ss, "robber")

	slot5 = unit

	if unit.base(unit).is_local_player then
		slot7 = "first"

		ss.set_switch(slot4, ss, "actor_switch")
	else
		slot7 = "third"

		ss.set_switch(slot4, ss, "actor_switch")
	end

	self._queue = {}

	return 
end
PlayerSound.destroy = function (self, unit)
	return 
end
PlayerSound._play = function (self, sound_name, source_name)
	local source = nil

	if source_name then
		slot6 = source_name
		source = Idstring(slot5)
	end

	slot7 = source
	slot11 = "end_of_event"
	local event = self._unit.sound_source(slot5, self._unit).post_event(slot5, self._unit.sound_source(slot5, self._unit), sound_name, self.sound_callback, self._unit, "marker")

	return event
end
PlayerSound.sound_callback = function (self, instance, event_type, unit, sound_source, label, identifier, position)
	slot10 = unit

	if not alive(slot9) then
		return 
	end

	if event_type == "end_of_event" then
		slot10 = unit
		unit.sound(slot9)._speaking = nil
		slot10 = unit

		if unit.sound(nil)._queue ~= nil then
			slot10 = unit

			if 0 < #unit.sound(slot9)._queue then
				slot10 = unit
				slot15 = unit
				slot13 = unit.sound(unit)._queue[1]._sync

				unit.sound(slot9).say(slot9, unit.sound(slot9), unit.sound(unit)._queue[1]._sound, unit.sound(unit)._queue[1]._source)

				slot11 = 1

				table.remove(slot9, unit.sound(unit.sound(unit)._queue[1]._sound)._queue)
			end
		end
	end

	return 
end
PlayerSound.queue_sound = function (self, id, sound_name, source_name, sync)
	slot8 = {
		_id = id,
		_sound = sound_name,
		_source = source_name,
		_sync = sync
	}

	table.insert(slot6, self._queue)

	return 
end
PlayerSound.clear_queue = function (self)
	self._queue = {}

	return 
end
PlayerSound.play = function (self, sound_name, source_name, sync)
	local event_id = nil
	slot7 = sound_name

	if type(slot6) == "number" then
		event_id = sound_name
		sound_name = nil
	end

	if sync then
		if not event_id then
			slot8 = sound_name
			event_id = SoundDevice.string_to_id(slot6, SoundDevice)
		end

		source_name = source_name or ""
		slot7 = self._unit
		slot10 = source_name

		self._unit.network(slot6).send(slot6, self._unit.network(slot6), "unit_sound_play", event_id)
	end

	slot9 = source_name
	local event = self._play(slot6, self, sound_name or event_id)

	return event
end
PlayerSound.stop = function (self, source_name)
	local source = nil

	if source_name then
		slot5 = source_name
		source = Idstring(slot4)
	end

	slot6 = source
	slot5 = self._unit.sound_source(slot4, self._unit)

	self._unit.sound_source(slot4, self._unit).stop(slot4)

	return 
end
PlayerSound.play_footstep = function (self, foot, material_name)
	if self._last_material ~= material_name then
		self._last_material = material_name
		slot6 = material_name
		local material_name = tweak_data.materials[material_name.key(slot5)]
		slot6 = self._unit
		slot9 = "root"
		slot8 = material_name or "no_material"

		self._unit.sound_source(slot5, Idstring(slot8)).set_switch(slot5, self._unit.sound_source(slot5, Idstring(slot8)), "materials")
	end

	slot5 = self._unit
	slot5 = self._unit.movement(slot4)
	local sound_name = (self._unit.movement(slot4).running(slot4) and "footsteps_1p_run") or "footsteps_1p"
	slot7 = sound_name

	self._play(slot5, self)

	return 
end
PlayerSound.play_land = function (self, material_name)
	if self._last_material ~= material_name then
		self._last_material = material_name
		slot5 = material_name
		local material_name = tweak_data.materials[material_name.key(slot4)]
		slot5 = self._unit
		slot8 = "root"
		slot7 = material_name or "concrete"

		self._unit.sound_source(slot4, Idstring(slot7)).set_switch(slot4, self._unit.sound_source(slot4, Idstring(slot7)), "materials")
	end

	slot5 = "footstep_land_1p"

	self._play(slot3, self)

	return 
end
PlayerSound.play_whizby = function (self, params)
	slot5 = "whizby"

	self._play(slot3, self)

	return 
end
PlayerSound.say = function (self, sound_name, important_say, sync)
	if self._last_speech and self._speaking and important_say == true then
		slot6 = self._last_speech

		self._last_speech.stop(slot5)

		self._speaking = nil
	end

	local event_id = nil
	slot7 = sound_name

	if type(slot6) == "number" then
		event_id = sound_name
		sound_name = nil
	end

	if sync then
		if not event_id then
			slot8 = sound_name
			event_id = SoundDevice.string_to_id(slot6, SoundDevice)
		end

		slot7 = self._unit
		slot9 = event_id

		self._unit.network(slot6).send(slot6, self._unit.network(slot6), "say")
	end

	if important_say == true or self._speaking == nil or self._speaking == false then
		slot10 = true
		self._last_speech = self._play(slot6, self, sound_name or event_id, nil)
		self._speaking = true
	end

	return self._last_speech
end
PlayerSound.speaking = function (self)
	return self._speaking
end
PlayerSound.set_voice = function (self, voice)
	slot4 = self._unit
	slot6 = voice

	self._unit.sound_source(slot3).set_switch(slot3, self._unit.sound_source(slot3), "robber")

	return 
end
PlayerSound.stop_speaking = function (self)
	if self._last_speech and self._speaking then
		slot3 = self._last_speech

		self._last_speech.stop(slot2)

		self._speaking = nil
	end

	slot3 = self

	self.clear_queue(slot2)

	return 
end

return 
