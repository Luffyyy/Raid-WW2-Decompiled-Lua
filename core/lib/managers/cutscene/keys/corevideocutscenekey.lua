-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreVideoCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreVideoCutsceneKey = slot0
CoreVideoCutsceneKey.ELEMENT_NAME = "video"
CoreVideoCutsceneKey.NAME = "Video Playback"
slot4 = ""

CoreVideoCutsceneKey.register_serialized_attribute("Video Playback", CoreVideoCutsceneKey, "video")

slot5 = tonumber

CoreVideoCutsceneKey.register_serialized_attribute("Video Playback", CoreVideoCutsceneKey, "gui_layer", 2)

slot5 = tonumber

CoreVideoCutsceneKey.register_serialized_attribute("Video Playback", CoreVideoCutsceneKey, "loop", 0)

slot5 = tonumber

CoreVideoCutsceneKey.register_serialized_attribute("Video Playback", CoreVideoCutsceneKey, "speed", 1)

CoreVideoCutsceneKey.__tostring = function (self)
	slot3 = "Play video \"%s\"."
	slot6 = self

	return string.format(slot2, self.video(slot5))
end
CoreVideoCutsceneKey.can_evaluate_with_player = function (self, player)
	return true
end
CoreVideoCutsceneKey.play = function (self, player, undo, fast_forward)
	slot6 = managers.cutscene
	local video_ws = managers.cutscene.video_workspace(slot5)
	local was_paused = self._paused
	self._paused = false

	if undo then
		slot8 = self

		self._stop(slot7)
	else
		slot8 = self._video_object

		if alive(slot7) then
			if was_paused then
				slot9 = video_ws

				self._play_video(slot7, self)
			end

			slot9 = self

			if self.loop(self._video_object) < self._video_object.loop_count(slot7) then
				slot8 = self

				self._stop(slot7)

				slot9 = true

				managers.cutscene._cleanup(slot7, managers.cutscene)

				slot9 = tweak_data.player.overlay.cutscene_fade_out

				managers.overlay_effect.play_effect(slot7, managers.overlay_effect)
			end
		else
			slot8 = self

			if self.video(slot7) ~= "" then
				slot9 = video_ws

				self._play_video(slot7, self)
			end
		end

		return true
	end

	return 
end
CoreVideoCutsceneKey.unload = function (self, player)
	slot4 = self

	self._stop(slot3)

	return 
end
CoreVideoCutsceneKey.update = function (self, player, time)
	if self.is_in_cutscene_editor then
		slot6 = time

		self._handle_cutscene_editor_scrubbing(slot4, self)
	end

	return 
end
CoreVideoCutsceneKey.is_valid_video = function (self, value)
	if self.is_in_cutscene_editor then
		if value ~= nil and value ~= "" then
			slot5 = value

			if SystemFS.exists(slot3, SystemFS) then
				slot5 = value
				slot2 = not SystemFS.is_dir(slot3, SystemFS)
			end
		else
			slot2 = false

			if false then
				slot2 = true
			end
		end

		return slot2
	else
		return value ~= nil and value ~= ""
	end

	return 
end
CoreVideoCutsceneKey.on_attribute_changed = function (self, attribute_name, value, previous_value)
	slot6 = self

	self._stop(slot5)

	return 
end
CoreVideoCutsceneKey._handle_cutscene_editor_scrubbing = function (self, time)
	if self._last_evaluated_time then
		if time == self._last_evaluated_time then
			self._stopped_frame_count = (self._stopped_frame_count or 0) + 1

			if 5 < self._stopped_frame_count then
				self._stopped_frame_count = nil
				slot4 = self

				self.pause(slot3)
			end
		else
			self._stopped_frame_count = nil
			slot4 = self._video_object

			if alive(slot3) and (time < self._last_evaluated_time or 1 < time - self._last_evaluated_time) then
				slot5 = time

				self._video_object.goto_time(slot3, self._video_object)
			end

			slot4 = self

			self.resume(slot3)
		end
	end

	self._last_evaluated_time = time

	return 
end
CoreVideoCutsceneKey._play_video = function (self, video_ws)

	-- Decompilation error in this vicinity:
	slot4 = self._video_object
	slot4 = self._video_object

	self._video_object.play(slot3)

	return 
end
CoreVideoCutsceneKey._stop = function (self)
	slot3 = self._video_object

	if alive(slot2) then
		local video_ws = managers.cutscene.video_workspace(slot2)
		slot4 = video_ws
		slot4 = video_ws.panel(managers.cutscene)

		video_ws.panel(managers.cutscene).clear(managers.cutscene)

		slot4 = video_ws

		video_ws.hide(managers.cutscene)

		self._video_object = nil
	end

	self._last_evaluated_time = nil

	return 
end
CoreVideoCutsceneKey.pause = function (self)
	if not self._paused then
		slot3 = self._video_object

		if alive(slot2) then
			slot3 = self._video_object

			self._video_object.pause(slot2)

			self._paused = true
		end
	end

	return 
end
CoreVideoCutsceneKey.resume = function (self)
	if self._paused then
		slot3 = self._video_object

		if alive(slot2) then
			slot3 = self._video_object

			self._video_object.play(slot2)

			self._paused = false
		end
	end

	return 
end

return 
