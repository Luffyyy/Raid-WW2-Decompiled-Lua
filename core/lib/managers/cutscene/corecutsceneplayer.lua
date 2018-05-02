-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/CoreCutsceneCast"

require(slot1)

slot2 = "core/lib/managers/cutscene/CoreCutsceneKeyCollection"

require(slot1)

slot3 = "CoreManagerBase"

core.import(slot1, core)

CoreCutscenePlayer = CoreCutscenePlayer or class()
slot2 = CoreCutscenePlayer
slot5 = "CutsceneKeyCollection"

mixin(slot1, get_core_or_local(slot4))

CoreCutscenePlayer.BLACK_BAR_GUI_LAYER = 29
CoreCutscenePlayer.BLACK_BAR_TOP_GUI_NAME = "__CutscenePlayer__black_bar_top"
CoreCutscenePlayer.BLACK_BAR_BOTTOM_GUI_NAME = "__CutscenePlayer__black_bar_bottom"
CoreCutscenePlayer._all_keys_sorted_by_time = function (self)
	return self._owned_cutscene_keys
end
CoreCutscenePlayer.init = function (self, cutscene, optional_shared_viewport, optional_shared_cast)
	slot7 = "No cutscene supplied."
	self._cutscene = assert(slot5, cutscene)

	if not optional_shared_viewport then
		slot6 = self
		slot4 = self._create_viewport(slot5)
	end

	self._viewport = slot4

	if not optional_shared_cast then
		slot6 = self
		slot4 = self._create_cast(slot5)
	end

	self._cast = slot4
	self._owned_cutscene_keys = {}
	self._time = 0
	slot6 = "cutscene"
	slot9 = "[CoreCutscenePlayer] Created CutscenePlayer for \"%s\"."
	slot12 = self

	cat_print(slot5, string.format(slot8, self.cutscene_name(slot11)))

	slot8 = self._viewport

	if not alive(self._viewport.camera(string.format)) then
		slot6 = self

		self._create_camera(slot5)
	end

	slot6 = self

	self._create_future_camera(slot5)

	slot6 = self

	self._clear_workspace(slot5)

	slot6 = managers.viewport
	slot11 = "_configure_viewport"
	self._resolution_changed_callback_id = managers.viewport.add_resolution_changed_func(slot5, callback(slot8, self, self))

	return 
end
CoreCutscenePlayer._create_future_camera = function (self)
	slot9 = 0
	slot5 = Vector3("core/units/locator/locator", 0, 0)
	self._future_camera_locator = World.spawn_unit(slot2, World, Idstring(slot5), Rotation())
	slot3 = World
	self._future_camera = World.create_camera(slot2)
	slot4 = self._future_camera

	self._initialize_camera(slot2, self)

	slot3 = self._future_camera
	slot7 = "locator"

	self._future_camera.link(slot2, self._future_camera_locator.get_object(slot5, self._future_camera_locator))

	slot3 = self._future_camera
	slot8 = 0

	self._future_camera.set_local_rotation(slot2, Rotation(slot5, -90, 0))

	slot6 = self._cast

	self._cast._reparent_to_locator_unit(slot2, self._cast, self._cast._root_unit(self._future_camera_locator))

	return 
end
CoreCutscenePlayer.add_keys = function (self, key_collection)
	key_collection = key_collection or self._cutscene
	slot6 = key_collection

	for _, template_key in ipairs(key_collection._all_keys_sorted_by_time(slot5)) do
		slot10 = template_key

		if self._is_driving_sound_key(slot8, self) then
			slot10 = template_key

			self._set_driving_sound_from_key(slot8, self)
		else
			local cutscene_key = template_key.clone(slot8)
			slot11 = self

			cutscene_key.set_key_collection(template_key, cutscene_key)

			slot11 = self._cast

			cutscene_key.set_cast(template_key, cutscene_key)

			slot11 = cutscene_key

			table.insert(template_key, self._owned_cutscene_keys)
		end
	end

	return 
end
CoreCutscenePlayer._is_driving_sound_key = function (self, cutscene_key)
	if cutscene_key.ELEMENT_NAME == CoreSoundCutsceneKey.ELEMENT_NAME then
		slot4 = cutscene_key
	else
		slot2 = false

		if false then
			slot2 = true
		end
	end

	return slot2
end
CoreCutscenePlayer._set_driving_sound_from_key = function (self, cutscene_key)
	slot4 = "cutscene"
	slot11 = cutscene_key

	cat_print(slot3, string.format(slot6, "[CoreCutscenePlayer] Using sound cue \"%s/%s\" to drive the playhead.", cutscene_key.cue(cutscene_key)))

	slot7 = cutscene_key.bank(cutscene_key.bank(slot9))
	slot10 = cutscene_key
	slot4 = Sound.make_bank(string.format, Sound, cutscene_key.cue(cutscene_key))
	slot8 = cutscene_key.bank(cutscene_key)
	slot11 = cutscene_key
	self._driving_sound = assert(slot3, string.format(Sound, "Driving sound cue \"%s/%s\" not found.", cutscene_key.cue(cutscene_key)))

	return 
end
CoreCutscenePlayer.set_timer = function (self, timer)
	slot5 = timer

	self._cast.set_timer(slot3, self._cast)

	slot4 = self._workspace

	if alive(slot3) then
		slot5 = timer

		self._workspace.set_timer(slot3, self._workspace)
	end

	local camera_controller = self._camera_controller(slot3)
	slot5 = camera_controller

	if alive(self) then
		slot6 = timer

		camera_controller.set_timer(slot4, camera_controller)
	end

	return 
end
CoreCutscenePlayer.viewport = function (self)
	return self._viewport
end
CoreCutscenePlayer.cutscene_name = function (self)
	slot3 = self._cutscene

	return self._cutscene.name(slot2)
end
CoreCutscenePlayer.cutscene_duration = function (self)
	slot3 = self._cutscene

	return self._cutscene.duration(slot2)
end
CoreCutscenePlayer.camera_attributes = function (self)
	slot3 = self
	local camera = self._camera(slot2)
	local attributes = {}
	slot5 = camera
	attributes.aspect_ratio = camera.aspect_ratio(slot4)
	slot5 = camera
	attributes.fov = camera.fov(slot4)
	slot5 = camera
	attributes.near_range = camera.near_range(slot4)
	slot5 = camera
	attributes.far_range = camera.far_range(slot4)

	if self._dof_attributes then
		slot5 = self._dof_attributes

		for key, value in pairs(slot4) do
			attributes[key] = value
		end
	end

	return attributes
end
CoreCutscenePlayer.depth_of_field_attributes = function (self)
	return self._dof_attributes
end
CoreCutscenePlayer.prime = function (self)
	if not self._primed then
		slot4 = self._cutscene

		self._cast.prime(slot2, self._cast)

		slot3 = self._owned_cutscene_keys

		for _, cutscene_key in dpairs(slot2) do
			slot8 = cutscene_key

			if cutscene_key.is_valid(slot7) then
				slot9 = cutscene_key

				self.prime_cutscene_key(slot7, self)
			else

				-- Decompilation error in this vicinity:
				slot8 = Application
				slot6 = Application.error
				slot9 = string.format
				slot11 = "[CoreCutscenePlayer] Invalid cutscene key in \"%s\": %s"
				slot14 = self
				slot12 = self.cutscene_name(slot13)

				slot6(slot7, slot9(slot10, slot11, slot12))

				slot9 = cutscene_key

				table.delete(slot7, self._owned_cutscene_keys)
			end
		end

		slot5 = 0

		self._process_camera_cutscene_keys_between(slot2, self, -1)

		slot3 = self

		if self._camera_object(slot2) ~= nil then
			slot3 = self

			self._reparent_camera(slot2)
		end

		if self._driving_sound then
			slot3 = self._driving_sound

			self._driving_sound.prime(slot2)
		end

		self._primed = true
	end

	return 
end
CoreCutscenePlayer.is_primed = function (self)
	return self._primed == true
end
CoreCutscenePlayer._driving_sound_offset = function (self)
	slot3 = self._driving_sound_instance

	if alive(slot2) then
		slot4 = self._driving_sound_instance
		local master_sound_instance = self._master_driving_sound_instance(slot2, self)

		if master_sound_instance == nil then
			return 0
		else
			slot4 = master_sound_instance
		end

		slot4 = master_sound_instance
		local name, offset = master_sound_instance.offset(slot3)

		if offset < self._time then
			slot6 = "cutscene"
			slot11 = self._time

			cat_print(slot5, string.format(slot8, "[CoreCutscenePlayer] Bad SoundInstance offset: Got %g, previous was %g.", offset))

			offset = self._time
		end

		return offset
	end

	return nil
end
CoreCutscenePlayer._master_driving_sound_instance = function (self, sound_instance)
	self._driving_sound_instance_map = self._driving_sound_instance_map or {}
	local master_instance = self._driving_sound_instance_map[sound_instance]

	if master_instance == nil then
		if sound_instance.playing_instances then
			slot5 = sound_instance
			master_instance = sound_instance.playing_instances(slot4)[1]
		else
			master_instance = sound_instance
		end

		self._driving_sound_instance_map[sound_instance] = master_instance
	end

	return master_instance
end
CoreCutscenePlayer.is_presentable = function (self)
	slot4 = self._cutscene

	return self._cast.is_ready(slot2, self._cast) and 0 < slot1
end
CoreCutscenePlayer.is_viewport_enabled = function (self)
	if managers.viewport and self._viewport then
		slot3 = self._viewport
		slot1 = self._viewport.active(slot2)
	end

	return slot1
end
CoreCutscenePlayer.unload = function (self)
	slot3 = self

	self.stop(slot2)

	slot5 = -math.huge

	for key in self.keys_between(slot2, self, math.huge) do
		slot8 = self

		key.unload(slot6, key)
	end

	if self._owned_cast then
		slot3 = self._owned_cast

		self._owned_cast.unload(slot2)
	end

	return 
end
CoreCutscenePlayer.destroy = function (self)
	slot3 = "cutscene"
	slot6 = "[CoreCutscenePlayer] Destroying CutscenePlayer for \"%s\"."
	slot9 = self

	cat_print(slot2, string.format(slot5, self.cutscene_name(slot8)))

	slot4 = false

	self.set_viewport_enabled(slot2, self)

	slot1 = pairs
	slot3 = self._owned_gui_objects or {}

	for gui_name, _ in slot1(slot2) do
		slot11 = self

		self.invoke_callback_in_gui(slot7, self, gui_name, "on_cutscene_player_destroyed")
	end

	self._owned_gui_objects = nil
	slot3 = self

	self.unload(slot2)

	if self._listener_id and managers.listener then
		slot4 = self._listener_id

		managers.listener.remove_listener(slot2, managers.listener)
	end

	self._listener_id = nil

	if self._resolution_changed_callback_id and managers.viewport then
		slot4 = self._resolution_changed_callback_id

		managers.viewport.remove_resolution_changed_func(slot2, managers.viewport)
	end

	self._resolution_changed_callback_id = nil

	if self._owned_camera_controller then
		slot3 = self._viewport
		slot3 = self._viewport.director(slot2)

		self._viewport.director(slot2).release_camera(slot2)

		slot5 = self._viewport
		slot5 = self._viewport.director(slot4)
		slot3 = self._viewport.director(slot4).camera(slot4) == nil

		assert(slot2)
	end

	slot3 = self._workspace

	if alive(slot2) then
		slot3 = Overlay
		slot4 = self._workspace

		Overlay.newgui(slot2).destroy_workspace(slot2, Overlay.newgui(slot2))
	end

	self._workspace = nil

	if self._owned_viewport then
		slot3 = self._owned_viewport

		if self._owned_viewport.alive(slot2) then
			slot3 = self._owned_viewport

			self._owned_viewport.destroy(slot2)
		end
	end

	self._owned_viewport = nil
	slot3 = self._owned_camera

	if alive(slot2) then
		slot4 = self._owned_camera

		World.delete_camera(slot2, World)
	end

	self._owned_camera = nil
	slot3 = self._future_camera

	if alive(slot2) then
		slot4 = self._future_camera

		World.delete_camera(slot2, World)
	end

	self._future_camera = nil
	slot3 = self._future_camera_locator

	if alive(slot2) then
		slot4 = self._future_camera_locator

		World.delete_unit(slot2, World)
	end

	self._future_camera_locator = nil

	return 
end
CoreCutscenePlayer.update = function (self, time, delta_time)
	local done = false
	slot6 = self

	if self.is_playing(slot5) then
		slot6 = self._driving_sound_instance

		if alive(slot5) then
			slot6 = self._driving_sound_instance

			self._driving_sound_instance.unpause(slot5)
		elseif self._driving_sound then
			slot8 = self._time
			self._driving_sound_instance = self._driving_sound.play(slot5, self._driving_sound, "offset")
		end

		slot6 = self

		if self.is_presentable(slot5) then
			slot6 = self
			local offset = self._driving_sound_offset(slot5) or self._time + delta_time
			slot9 = self._time == offset
			done = self.seek(slot6, self, offset) == false
		end
	else
		slot6 = self._driving_sound_instance

		if alive(slot5) then
			slot6 = self._driving_sound_instance

			self._driving_sound_instance.pause(slot5)
		end
	end

	if done then
		slot6 = self

		self.stop(slot5)
	else
		slot6 = self

		if self.is_viewport_enabled(slot5) then
			slot6 = self

			self.refresh(slot5)
		end
	end

	return not done
end
CoreCutscenePlayer.refresh = function (self)
	slot3 = self

	if self._camera_has_cut(slot2) and managers.environment then
		slot3 = managers.environment

		managers.environment.clear_luminance(slot2)
	end

	slot3 = self

	self._update_future_camera(slot2)

	return 
end
CoreCutscenePlayer.evaluate_current_frame = function (self)
	self._last_evaluated_time = self._last_evaluated_time or -1
	slot4 = true

	self._set_visible(slot2, self)

	slot5 = self._time

	self._process_discontinuity_cutscene_keys_between(slot2, self, self._last_evaluated_time)

	slot3 = self

	self._evaluate_animations(slot2)

	slot3 = self

	self._resume_discontinuity(slot2)

	slot5 = self._time

	self._process_camera_cutscene_keys_between(slot2, self, self._last_evaluated_time)

	slot3 = self

	self._reparent_camera(slot2)

	slot5 = self._time

	self._process_non_camera_cutscene_keys_between(slot2, self, self._last_evaluated_time)

	self._last_evaluated_time = self._time

	return 
end
CoreCutscenePlayer.preroll_cutscene_keys = function (self)
	if 0 < self._time then
		return 
	end

	slot5 = self

	for _, cutscene_key in ipairs(self._all_keys_sorted_by_time(slot4)) do
		slot8 = cutscene_key

		if 0 < cutscene_key.frame(slot7) then
			break
		end

		if cutscene_key.preroll then
			slot9 = self

			cutscene_key.preroll(slot7, cutscene_key)
		end
	end

	return 
end
CoreCutscenePlayer.is_playing = function (self)
	return self._playing or false
end
CoreCutscenePlayer.play = function (self)
	self._playing = true
	slot5 = self

	for _, cutscene_key in ipairs(self._all_keys_sorted_by_time(slot4)) do
		if cutscene_key.resume then
			slot9 = self

			cutscene_key.resume(slot7, cutscene_key)
		end
	end

	return 
end
CoreCutscenePlayer.pause = function (self)
	self._playing = nil
	slot5 = self

	for _, cutscene_key in ipairs(self._all_keys_sorted_by_time(slot4)) do
		if cutscene_key.pause then
			slot9 = self

			cutscene_key.pause(slot7, cutscene_key)
		end
	end

	return 
end
CoreCutscenePlayer.stop = function (self)
	self._playing = nil
	self._driving_sound_instance = nil
	slot4 = false

	self._set_visible(slot2, self)

	return 
end
CoreCutscenePlayer.skip_to_end = function (self)
	slot5 = math.huge

	for key in self.keys_between(slot2, self, self._time) do
		if key.skip then
			slot8 = key

			self.skip_cutscene_key(slot6, self)
		end
	end

	slot3 = self._driving_sound_instance

	if alive(slot2) then
		slot3 = self._driving_sound_instance

		self._driving_sound_instance.stop(slot2)
	end

	self._driving_sound_instance = nil
	slot3 = self
	self._time = self.cutscene_duration(slot2)

	return 
end
CoreCutscenePlayer.seek = function (self, time, skip_evaluation)
	slot8 = time
	slot5 = math.max(slot6, 0)
	slot8 = self
	self._time = math.min(slot4, self.cutscene_duration(0))

	if not skip_evaluation then
		slot5 = self

		self.evaluate_current_frame(slot4)
	end

	return self._time == time
end
CoreCutscenePlayer.distance_from_camera = function (self, unit_name, object_name)
	slot7 = object_name
	local object = self._actor_object(slot4, self, unit_name)

	if object then
		slot6 = self
		slot6 = self._camera(slot5)
		slot9 = object
		local distance = self._camera(slot5).world_to_screen(slot5, object.position(slot8)).z
	end

	return distance
end
CoreCutscenePlayer.set_camera = function (self, camera)
	slot2 = assert

	if camera ~= nil then
		slot7 = "camera"
		slot4 = string.begins(slot5, camera)

		if string.begins(slot5, camera) then
			slot4 = false
		end
	else
		slot4 = true
	end

	slot2(slot3)

	self._camera_name = camera

	return 
end
CoreCutscenePlayer.set_camera_attribute = function (self, attribute_name, value)
	local camera = self._camera(slot4)
	slot7 = "Invalid camera attribute."
	local func = assert(self, camera["set_" .. attribute_name])
	slot8 = value

	func(camera["set_" .. attribute_name], camera)

	slot8 = value

	func(camera["set_" .. attribute_name], self._future_camera)

	return 
end
CoreCutscenePlayer.set_camera_depth_of_field = function (self, near, far)
	local range = far - near
	self._dof_attributes = self._dof_attributes or {}
	slot8 = near - range * 0.33
	self._dof_attributes.near_focus_distance_min = math.max(slot6, 1e-06)
	slot8 = near
	self._dof_attributes.near_focus_distance_max = math.max(slot6, 1e-06)
	self._dof_attributes.far_focus_distance_min = far
	self._dof_attributes.far_focus_distance_max = far + range * 0.67

	return 
end
CoreCutscenePlayer.play_camera_shake = function (self, shake_name, amplitude, frequency, offset)
	slot7 = self._viewport
	slot7 = self._viewport.director(slot6)
	slot11 = offset
	local shake_id = self._viewport.director(slot6).shaker(slot6).play(slot6, self._viewport.director(slot6).shaker(slot6), shake_name, amplitude, frequency)

	return function ()
		slot2 = self._viewport
		slot2 = self._viewport.director(slot1)
		slot3 = shake_id

		self._viewport.director(slot1).shaker(slot1).stop_immediately(slot1, self._viewport.director(slot1).shaker(slot1))

		return 
	end
end
CoreCutscenePlayer.has_gui = function (self, gui_name)
	return self._owned_gui_objects ~= nil and self._owned_gui_objects[gui_name] ~= nil
end
CoreCutscenePlayer.load_gui = function (self, gui_name)
	local preload = true
	slot5 = Overlay
	slot6 = gui_name

	Overlay.newgui(slot4).preload(slot4, Overlay.newgui(slot4))

	slot7 = preload

	self._gui_panel(slot4, self, gui_name)

	slot7 = false

	self.set_gui_visible(slot4, self, gui_name)

	return 
end
CoreCutscenePlayer.set_gui_visible = function (self, gui_name, visible)
	local panel = self._gui_panel(slot4, self)
	slot7 = panel

	if not visible == panel.visible(gui_name) then
		slot10 = self

		self.invoke_callback_in_gui(slot5, self, gui_name, "on_cutscene_player_set_visible", visible)

		slot7 = visible

		panel.set_visible(slot5, panel)
	end

	return 
end
CoreCutscenePlayer.invoke_callback_in_gui = function (self, gui_name, function_name, ...)
	local gui_object = self._owned_gui_objects and self._owned_gui_objects[gui_name]
	slot6 = gui_object

	if alive(slot5) then
		slot6 = gui_object

		if gui_object.has_script(slot5) then
			local script = gui_object.script(slot5)
			slot8 = function_name
			local callback_func = rawget(gui_object, script)
			slot8 = callback_func

			if type(script) == "function" then
				callback_func(...)
			end
		end
	end

	return 
end
CoreCutscenePlayer._gui_panel = function (self, gui_name, preloading)
	slot5 = self._workspace
	slot6 = gui_name
	local panel = self._workspace.panel(slot4).child(slot4, self._workspace.panel(slot4))

	if panel == nil then
		if not preloading then
			slot7 = "[CoreCutscenePlayer] The gui \"" .. gui_name .. "\" was not preloaded, causing a performance spike."

			Application.error(slot5, Application)
		end

		self._owned_gui_objects = self._owned_gui_objects or {}
		local viewport_rect = self._viewport_rect(slot5)
		slot7 = self._workspace
		slot8 = {
			halign = "grow",
			visible = false,
			valign = "grow",
			name = gui_name,
			x = viewport_rect.px,
			y = viewport_rect.py,
			width = viewport_rect.pw,
			height = viewport_rect.ph
		}
		panel = self._workspace.panel(self).panel(self, self._workspace.panel(self))
		slot8 = gui_name
		local gui_object = panel.gui(self, panel)
		self._owned_gui_objects[gui_name] = gui_object
	end

	return panel
end
CoreCutscenePlayer.set_viewport_enabled = function (self, enabled)
	slot4 = self._viewport
	local is_enabled = self._viewport.active(slot3)

	if enabled ~= is_enabled then
		if enabled then
			slot6 = true

			self._viewport.set_active(slot4, self._viewport)
		else
			slot6 = false

			self._viewport.set_active(slot4, self._viewport)
		end

		slot6 = enabled

		self._set_listener_enabled(slot4, self)

		slot6 = enabled

		self._set_depth_of_field_enabled(slot4, self)

		slot6 = not enabled

		self._viewport.set_width_mul_enabled(slot4, self._viewport)

		local black_bars_enabled = self._widescreen and enabled
		slot6 = self._workspace
		slot7 = self.BLACK_BAR_TOP_GUI_NAME
		slot7 = black_bars_enabled

		self._workspace.panel(slot5).child(slot5, self._workspace.panel(slot5)).set_visible(slot5, self._workspace.panel(slot5).child(slot5, self._workspace.panel(slot5)))

		slot6 = self._workspace
		slot7 = self.BLACK_BAR_BOTTOM_GUI_NAME
		slot7 = black_bars_enabled

		self._workspace.panel(slot5).child(slot5, self._workspace.panel(slot5)).set_visible(slot5, self._workspace.panel(slot5).child(slot5, self._workspace.panel(slot5)))
	end

	return 
end
CoreCutscenePlayer.set_widescreen = function (self, enabled)
	self._widescreen = enabled or nil
	slot4 = self

	self._configure_viewport(slot3)

	return 
end
CoreCutscenePlayer.set_key_handler = function (self, delegate)
	self._key_handler = delegate

	return 
end
CoreCutscenePlayer.prime_cutscene_key = function (self, key, cast)
	local delegate = self._key_handler

	if delegate and delegate.prime_cutscene_key then
		slot9 = cast

		return delegate.prime_cutscene_key(slot5, delegate, self, key)
	else
		slot7 = self

		return key.prime(slot5, key)
	end

	return 
end
CoreCutscenePlayer.evaluate_cutscene_key = function (self, key, time, last_evaluated_time)
	local delegate = self._key_handler

	if delegate and delegate.evaluate_cutscene_key then
		slot11 = last_evaluated_time

		return delegate.evaluate_cutscene_key(slot6, delegate, self, key, time)
	else
		slot10 = false

		return key.play(slot6, key, self, false)
	end

	return 
end
CoreCutscenePlayer.revert_cutscene_key = function (self, key, time, last_evaluated_time)
	local delegate = self._key_handler

	if delegate and delegate.revert_cutscene_key then
		slot11 = last_evaluated_time

		return delegate.revert_cutscene_key(slot6, delegate, self, key, time)
	else
		slot10 = false

		return key.play(slot6, key, self, true)
	end

	return 
end
CoreCutscenePlayer.update_cutscene_key = function (self, key, time, last_evaluated_time)
	local delegate = self._key_handler

	if delegate and delegate.update_cutscene_key then
		slot11 = last_evaluated_time

		return delegate.update_cutscene_key(slot6, delegate, self, key, time)
	else
		slot9 = time

		return key.update(slot6, key, self)
	end

	return 
end
CoreCutscenePlayer.skip_cutscene_key = function (self, key)
	local delegate = self._key_handler

	if delegate and delegate.skip_cutscene_key then
		slot7 = key

		return delegate.skip_cutscene_key(slot4, delegate, self)
	else
		slot6 = self

		return key.skip(slot4, key)
	end

	return 
end
CoreCutscenePlayer.time_in_relation_to_cutscene_key = function (self, key)
	local delegate = self._key_handler

	if delegate and delegate.time_in_relation_to_cutscene_key then
		slot6 = key

		return delegate.time_in_relation_to_cutscene_key(slot4, delegate)
	else
		slot6 = key

		return self._time - key.time(slot5)
	end

	return 
end
CoreCutscenePlayer._set_visible = function (self, visible)
	slot6 = visible

	self._cast.set_cutscene_visible(slot3, self._cast, self._cutscene)

	return 
end
CoreCutscenePlayer._set_listener_enabled = function (self, enabled)
	if enabled then
		if not self._listener_activation_id then
			slot6 = "cutscene"
			self._listener_activation_id = managers.listener.activate_set(slot3, managers.listener, "main")
		end
	else
		if self._listener_activation_id then
			slot5 = self._listener_activation_id

			managers.listener.deactivate_set(slot3, managers.listener)
		end

		self._listener_activation_id = nil
	end

	return 
end
CoreCutscenePlayer._set_depth_of_field_enabled = function (self, enabled)
	if enabled then
		slot4 = managers.environment

		managers.environment.disable_dof(slot3)
	else
		slot4 = managers.environment

		managers.environment.enable_dof(slot3)

		slot4 = managers.environment

		managers.environment.needs_update(slot3)
	end

	return 
end
CoreCutscenePlayer._viewport_rect = function (self)
	return slot1
end
CoreCutscenePlayer._full_viewport_rect = function (self)
	local resolution = RenderSettings.resolution

	return {
		px = 0,
		py = 0,
		h = 1,
		y = 0,
		w = 1,
		x = 0,
		pw = resolution.x,
		ph = resolution.y
	}
end
CoreCutscenePlayer._wide_viewport_rect = function (self)
	local resolution = RenderSettings.resolution
	slot4 = managers.viewport
	local resolution_aspect = 1 / managers.viewport.aspect_ratio(slot3)
	local cutscene_aspect = 0.5625
	slot7 = 1
	local viewport_width = math.min(slot5, resolution_aspect / cutscene_aspect)
	local viewport_height = 1 / resolution_aspect * cutscene_aspect * viewport_width
	local viewport_x = (1 - viewport_width) / 2
	local viewport_y = (1 - viewport_height) / 2
	local rect = {
		x = viewport_x,
		y = viewport_y,
		w = viewport_width,
		h = viewport_height,
		px = rect.x * resolution.x,
		py = rect.y * resolution.y,
		pw = rect.w * resolution.x,
		ph = rect.h * resolution.y
	}

	return rect
end
CoreCutscenePlayer._camera = function (self)

	-- Decompilation error in this vicinity:
	slot3 = self._viewport

	if not self._viewport.camera(slot2) then
		slot3 = self
		slot1 = self._create_camera(slot2)
	end

	return slot1
end
CoreCutscenePlayer._camera_controller = function (self)
	slot3 = self._viewport
	slot3 = self._viewport.director(slot2)
	local controller = self._viewport.director(slot2).camera(slot2)

	if not controller then
		slot4 = self
		slot2 = self._create_camera_controller(slot3)
	end

	return slot2
end
CoreCutscenePlayer._camera_object = function (self)
	if self._camera_name then
		slot5 = "locator"
		slot1 = self._actor_object(slot2, self, self._camera_name)
	end

	return slot1
end
CoreCutscenePlayer._actor_object = function (self, unit_name, object_name)
	slot7 = self._cutscene
	local unit = self._cast.actor_unit(slot4, self._cast, unit_name)

	if unit == nil and managers.cutscene then
		slot6 = managers.cutscene
		unit = managers.cutscene.cutscene_actors_in_world(slot5)[unit_name]
	end

	if unit then
		slot7 = object_name
		slot4 = unit.get_object(slot5, unit)
	end

	return slot4
end
CoreCutscenePlayer._clear_workspace = function (self)
	slot3 = self._workspace

	if alive(slot2) then
		slot3 = Overlay
		slot4 = self._workspace

		Overlay.newgui(slot2).destroy_workspace(slot2, Overlay.newgui(slot2))
	end

	local resolution = RenderSettings.resolution
	slot4 = Overlay
	slot9 = resolution.x
	self._workspace = Overlay.newgui(slot3).create_scaled_screen_workspace(slot3, Overlay.newgui(slot3), resolution.x, resolution.y, 0, 0)
	slot4 = self._workspace
	slot7 = managers.cutscene

	self._workspace.set_timer(slot3, managers.cutscene.timer(resolution.y))

	slot4 = self._workspace
	slot5 = {
		visible = self._widescreen,
		layer = self.BLACK_BAR_GUI_LAYER,
		name = self.BLACK_BAR_TOP_GUI_NAME,
		color = Color.black
	}

	self._workspace.panel(slot3).rect(slot3, self._workspace.panel(slot3))

	slot4 = self._workspace
	slot5 = {
		visible = self._widescreen,
		layer = self.BLACK_BAR_GUI_LAYER,
		name = self.BLACK_BAR_BOTTOM_GUI_NAME,
		color = Color.black
	}

	self._workspace.panel(slot3).rect(slot3, self._workspace.panel(slot3))

	slot4 = self._workspace

	self._workspace.show(slot3)

	slot4 = self

	self._configure_viewport(slot3)

	return 
end
CoreCutscenePlayer._create_viewport = function (self)
	slot3 = self._owned_viewport == nil

	assert(slot2)

	slot9 = CoreManagerBase.PRIO_CUTSCENE
	self._owned_viewport = managers.viewport.new_vp(slot2, managers.viewport, 0, 0, 1, 1, "cutscene")

	return self._owned_viewport
end
CoreCutscenePlayer._configure_viewport = function (self)
	slot4 = "aspect_ratio"
	slot7 = managers.viewport

	self.set_camera_attribute(slot2, self, managers.viewport.aspect_ratio(slot6))

	slot3 = self._workspace

	if alive(slot2) then
		local resolution = RenderSettings.resolution
		slot9 = resolution.x

		self._workspace.set_screen(slot3, self._workspace, resolution.x, resolution.y, 0, 0)

		slot4 = self
		local viewport_rect = self._viewport_rect(slot3)

		if self._widescreen then
			slot5 = self
			local black_bars_enabled = self.is_viewport_enabled(slot4)
		end

		slot6 = self._workspace
		slot7 = self.BLACK_BAR_TOP_GUI_NAME
		slot7 = {
			y = 0,
			x = 0,
			visible = black_bars_enabled,
			width = viewport_rect.pw,
			height = viewport_rect.py
		}

		self._workspace.panel(slot5).child(slot5, self._workspace.panel(slot5)).configure(slot5, self._workspace.panel(slot5).child(slot5, self._workspace.panel(slot5)))

		slot6 = self._workspace
		slot7 = self.BLACK_BAR_BOTTOM_GUI_NAME
		slot7 = {
			x = 0,
			visible = black_bars_enabled,
			y = resolution.y - viewport_rect.py,
			width = viewport_rect.pw,
			height = viewport_rect.py
		}

		self._workspace.panel(slot5).child(slot5, self._workspace.panel(slot5)).configure(slot5, self._workspace.panel(slot5).child(slot5, self._workspace.panel(slot5)))

		if self._owned_gui_objects then
			slot8 = self._owned_gui_objects

			for gui_name, _ in pairs(table.map_copy(slot7)) do
				slot15 = self

				self.invoke_callback_in_gui(slot10, self, gui_name, "on_cutscene_player_set_visible", false)

				slot14 = self

				self.invoke_callback_in_gui(slot10, self, gui_name, "on_cutscene_player_destroyed")

				slot11 = self._workspace
				slot12 = gui_name
				local panel = self._workspace.panel(slot10).child(slot10, self._workspace.panel(slot10))
				slot12 = panel

				panel.clear(self._workspace.panel(slot10))

				slot13 = {
					x = viewport_rect.px,
					y = viewport_rect.py,
					width = viewport_rect.pw,
					height = viewport_rect.ph
				}

				panel.configure(self._workspace.panel(slot10), panel)

				slot14 = gui_name
				self._owned_gui_objects[gui_name] = panel.gui(panel, panel)
			end
		end
	end

	return 
end
CoreCutscenePlayer._create_camera = function (self)
	slot3 = self._owned_camera == nil

	assert(slot2)

	slot3 = World
	self._owned_camera = World.create_camera(slot2)
	slot4 = self._owned_camera

	self._initialize_camera(slot2, self)

	slot4 = self._owned_camera

	self._viewport.set_camera(slot2, self._viewport)

	return self._owned_camera
end
CoreCutscenePlayer._initialize_camera = function (self, camera)
	slot5 = CoreZoomCameraCutsceneKey.DEFAULT_CAMERA_FOV

	camera.set_fov(slot3, camera)

	slot5 = 7.5

	camera.set_near_range(slot3, camera)

	slot5 = 50000

	camera.set_far_range(slot3, camera)

	slot5 = 1

	camera.set_width_multiplier(slot3, camera)

	return 
end
CoreCutscenePlayer._create_camera_controller = function (self)
	slot3 = self._owned_camera_controller == nil

	assert(slot2)

	slot3 = self._viewport
	slot6 = self
	self._owned_camera_controller = self._viewport.director(slot2).make_camera(slot2, self._viewport.director(slot2), self._camera(slot5))
	slot3 = self._owned_camera_controller
	slot6 = managers.cutscene

	self._owned_camera_controller.set_timer(slot2, managers.cutscene.timer("cutscene_camera"))

	slot3 = self._viewport
	slot4 = self._owned_camera_controller

	self._viewport.director(slot2).set_camera(slot2, self._viewport.director(slot2))

	return self._owned_camera_controller
end
CoreCutscenePlayer._create_cast = function (self)
	slot3 = self._owned_cast == nil

	assert(slot2)

	slot3 = "CutsceneCast"
	self._owned_cast = core_or_local(slot2)

	return self._owned_cast
end
CoreCutscenePlayer._evaluate_animations = function (self)
	slot5 = self._time

	self._cast.evaluate_cutscene_at_time(slot2, self._cast, self._cutscene)

	return 
end
CoreCutscenePlayer._notify_discontinuity = function (self)
	slot5 = self._cutscene

	for unit_name, _ in pairs(self._cutscene.controlled_unit_types(slot4)) do
		slot10 = self._cutscene
		local unit = self._cast.actor_unit(slot7, self._cast, unit_name)
		slot10 = unit

		for index = 0, unit.num_bodies(unit_name) - 1, 1 do
			slot14 = index
			local body = unit.body(slot12, unit)
			slot14 = body

			if body.dynamic(unit) then
				slot14 = body

				if body.enabled(slot13) then
					slot15 = false

					body.set_enabled(slot13, body)

					self._disabled_bodies = self._disabled_bodies or {}
					slot15 = body

					table.insert(slot13, self._disabled_bodies)
				end
			end
		end
	end

	return 
end
CoreCutscenePlayer._resume_discontinuity = function (self)
	if self._disabled_bodies then
		slot3 = self._disabled_bodies

		for _, body in ipairs(slot2) do
			slot8 = body

			body.enable_with_no_velocity(slot7)
		end

		self._disabled_bodies = nil
	end

	return 
end
CoreCutscenePlayer._process_discontinuity_cutscene_keys_between = function (self, start_time, end_time)
	slot8 = CoreDiscontinuityCutsceneKey.ELEMENT_NAME

	for key in self.keys_between(slot4, self, start_time, end_time) do
		slot12 = start_time

		self.evaluate_cutscene_key(slot8, self, key, end_time)
	end

	return 
end
CoreCutscenePlayer._process_camera_cutscene_keys_between = function (self, start_time, end_time)
	slot8 = CoreChangeCameraCutsceneKey.ELEMENT_NAME

	for key in self.keys_between(slot4, self, start_time, end_time) do
		if start_time < end_time then
			slot12 = start_time

			self.evaluate_cutscene_key(slot8, self, key, end_time)
		else
			slot12 = start_time

			self.revert_cutscene_key(slot8, self, key, end_time)
		end
	end

	slot7 = CoreChangeCameraCutsceneKey.ELEMENT_NAME

	for key in self.keys_to_update(slot4, self, end_time) do
		slot11 = end_time - key.time(slot12)
		slot17 = key
		slot15 = start_time - key.time(slot16)

		self.update_cutscene_key(slot8, self, key, math.max(key, 0))
	end

	return 
end
CoreCutscenePlayer._process_non_camera_cutscene_keys_between = function (self, start_time, end_time)
	slot7 = end_time

	for key in self.keys_between(slot4, self, start_time) do
		if key.ELEMENT_NAME ~= CoreChangeCameraCutsceneKey.ELEMENT_NAME and key.ELEMENT_NAME ~= CoreDiscontinuityCutsceneKey.ELEMENT_NAME then
			if start_time < end_time then
				slot12 = start_time

				self.evaluate_cutscene_key(slot8, self, key, end_time)
			else
				slot12 = start_time

				self.revert_cutscene_key(slot8, self, key, end_time)
			end
		end
	end

	slot6 = end_time

	for key in self.keys_to_update(slot4, self) do
		if key.ELEMENT_NAME ~= CoreChangeCameraCutsceneKey.ELEMENT_NAME and key.ELEMENT_NAME ~= CoreDiscontinuityCutsceneKey.ELEMENT_NAME then
			slot11 = end_time - key.time(slot12)
			slot17 = key
			slot15 = start_time - key.time(slot16)

			self.update_cutscene_key(slot8, self, key, math.max(key, 0))
		end
	end

	return 
end
CoreCutscenePlayer._reparent_camera = function (self)
	if self._camera_name then
		slot3 = self._camera_object(slot4)
		slot7 = self._camera_name
		slot10 = self
		local camera_object = assert(slot2, string.format(self, "Camera \"%s\" not found in cutscene \"%s\".", self.cutscene_name(slot9)))
	end

	if camera_object ~= nil then
		slot4 = self
		slot4 = self._camera_controller(slot3)

		if camera_object ~= self._camera_controller(slot3).get_camera(slot3) then
			slot4 = self
			slot5 = camera_object

			self._camera_controller(slot3).set_both(slot3, self._camera_controller(slot3))

			if self._listener_id then
				slot6 = camera_object

				managers.listener.set_listener(slot3, managers.listener, self._listener_id)
			else
				slot6 = camera_object
				self._listener_id = managers.listener.add_listener(slot3, managers.listener, "cutscene")
			end
		end
	end

	return 
end
CoreCutscenePlayer._update_future_camera = function (self)
	slot3 = self._cutscene

	if self._cutscene.is_optimized(slot2) then
		slot7 = self._time + 0.16666666666666666
		local position, rotation = self._cast.evaluate_object_at_time(slot2, self._cast, self._cutscene, "camera", "locator")
		slot7 = position

		self._future_camera_locator.warp_to(self._cutscene, self._future_camera_locator, rotation)

		slot5 = World
		slot6 = self._future_camera

		World.effect_manager(self._cutscene).add_camera(self._cutscene, World.effect_manager(self._cutscene))

		slot5 = World
		slot6 = self._future_camera

		World.lod_viewers(self._cutscene).add_viewer(self._cutscene, World.lod_viewers(self._cutscene))
	end

	return 
end
CoreCutscenePlayer._camera_has_cut = function (self)

	-- Decompilation error in this vicinity:
	if not self._last_frame_camera_position then
		slot5 = 0
		slot1 = Vector3(slot2, 0, 0)
	end

	self._last_frame_camera_position = slot1
	self._last_frame_camera_rotation = self._last_frame_camera_rotation or Rotation()
	local camera = self._camera(slot2)
	local camera_position = camera.position(self)
	slot5 = camera
	local camera_rotation = camera.rotation(camera)
	local position_difference = self._last_frame_camera_position - camera_position
	slot9 = camera_rotation
	local rotation_difference = Rotation.rotation_difference(slot6, Rotation, self._last_frame_camera_rotation)
	slot8 = position_difference
	local position_threshold_reached = 50 < position_difference.length(Rotation)
	slot9 = rotation_difference
end

return 
