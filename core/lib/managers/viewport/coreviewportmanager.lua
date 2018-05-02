slot3 = "CoreViewportManager"

core.module(slot1, core)

slot3 = "CoreApp"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreManagerBase"

core.import(slot1, core)

slot3 = "CoreScriptViewport"

core.import(slot1, core)

slot3 = "CoreEnvironmentManager"

core.import(slot1, core)

if not ViewportManager then
	slot2 = CoreManagerBase.ManagerBase
	slot0 = class(slot1)
end

ViewportManager = slot0
ViewportManager.CAMERA_NEAR_RANGE = 3
ViewportManager.WORLD_CAMERA_NEAR_RANGE = 20
ViewportManager.CAMERA_FAR_RANGE = 100000
ViewportManager.init = function (self, aspect_ratio)
	ViewportManager.super.init(slot3, self)

	slot6 = aspect_ratio
	slot4 = type("viewport") == "number"

	assert(slot3)

	self._aspect_ratio = aspect_ratio
	slot4 = CoreEvent.CallbackEventHandler
	self._resolution_changed_event_handler = CoreEvent.CallbackEventHandler.new(slot3)
	slot4 = CoreEnvironmentManager.EnvironmentManager
	self._env_manager = CoreEnvironmentManager.EnvironmentManager.new(slot3)
	self._allow_fvp_env_update = true
	Global.render_debug.render_sky = true
	self._current_camera_position = Vector3()
	slot4 = Application

	if Application.editor(true) then
		slot5 = "core/environments/default"

		self.preload_environment(slot3, self)
	end

	return 
end
ViewportManager.skip_update_env_on_first_viewport = function (self, skip)
	self._allow_fvp_env_update = not skip

	return 
end
ViewportManager.update = function (self, t, dt)
	slot7 = self

	for i, svp in ipairs(self._all_really_active(slot6)) do
		slot13 = dt

		svp._update(slot9, svp, i == 1 and self._allow_fvp_env_update, t)
	end

	return 
end
ViewportManager.paused_update = function (self, t, dt)
	slot7 = dt

	self.update(slot4, self, t)

	return 
end
ViewportManager.render = function (self)
	slot5 = self

	for i, svp in ipairs(self._all_really_active(slot4)) do
		slot9 = i

		svp._render(slot7, svp)
	end

	return 
end
ViewportManager.end_frame = function (self, t, dt)
	if self._render_settings_change_map then
		local is_resolution_changed = self._render_settings_change_map.resolution ~= nil
		slot6 = self._render_settings_change_map

		for setting_name, setting_value in pairs(slot5) do
			RenderSettings[setting_name] = setting_value
		end

		self._render_settings_change_map = nil
		slot6 = Application

		Application.apply_render_settings(slot5)

		slot6 = Application

		Application.save_render_settings(slot5)

		if is_resolution_changed then
			slot6 = self

			self.resolution_changed(slot5)
		end
	end

	self._current_camera = nil
	self._current_camera_position_updated = nil
	self._current_camera_rotation = nil

	return 
end
ViewportManager.destroy = function (self)
	slot5 = self

	for _, svp in pairs(self._all_ao(slot4)) do
		slot8 = svp

		svp.destroy(slot7)
	end

	slot3 = self._env_manager

	self._env_manager.destroy(slot2)

	return 
end
ViewportManager.new_vp = function (self, x, y, width, height, name, priority)
	local name = name or ""
	local prio = priority or CoreManagerBase.PRIO_DEFAULT
	slot17 = name
	local svp = CoreScriptViewport._ScriptViewport.new(slot10, CoreScriptViewport._ScriptViewport, x, y, width, height, self)
	slot14 = prio

	self._add_accessobj(CoreScriptViewport._ScriptViewport, self, svp)

	return svp
end
ViewportManager.vp_by_name = function (self, name)
	slot5 = name

	return self._ao_by_name(slot3, self)
end
ViewportManager.active_viewports = function (self)
	slot4 = CoreManagerBase.PRIO_DEFAULT

	return self._all_active_requested_by_prio(slot2, self)
end
ViewportManager.all_really_active_viewports = function (self)
	slot3 = self

	return self._all_really_active(slot2)
end
ViewportManager.num_active_viewports = function (self)
	slot3 = self

	return #self.active_viewports(slot2)
end
ViewportManager.first_active_viewport = function (self)
	slot3 = self
	local all_active = self._all_really_active(slot2)

	return (0 < #all_active and all_active[1]) or nil
end
ViewportManager.viewports = function (self)
	slot3 = self

	return self._all_ao(slot2)
end
ViewportManager.add_resolution_changed_func = function (self, func)
	slot5 = func

	self._resolution_changed_event_handler.add(slot3, self._resolution_changed_event_handler)

	return func
end
ViewportManager.remove_resolution_changed_func = function (self, func)
	slot5 = func

	self._resolution_changed_event_handler.remove(slot3, self._resolution_changed_event_handler)

	return 
end
ViewportManager.resolution_changed = function (self)
	slot3 = managers.gui_data

	managers.gui_data.resolution_changed(slot2)

	slot4 = "tweak_data"

	if rawget(slot2, _G).resolution_changed then
		slot4 = "tweak_data"
		slot3 = rawget(slot2, _G)

		rawget(slot2, _G).resolution_changed(slot2)
	end

	slot5 = self

	for i, svp in ipairs(self.viewports(slot4)) do
		slot9 = i

		svp._resolution_changed(slot7, svp)
	end

	slot3 = self._resolution_changed_event_handler

	self._resolution_changed_event_handler.dispatch(slot2)

	return 
end
ViewportManager.editor_reload_environment = function (self, name)
	slot5 = name

	self._env_manager.editor_reload(slot3, self._env_manager)

	return 
end
ViewportManager.editor_add_environment_created_callback = function (self, func)
	slot5 = func

	self._env_manager.editor_add_created_callback(slot3, self._env_manager)

	return 
end
ViewportManager.preload_environment = function (self, name)
	slot5 = name

	self._env_manager.preload_environment(slot3, self._env_manager)

	return 
end
ViewportManager.get_predefined_environment_filter_map = function (self)
	slot3 = self._env_manager

	return self._env_manager.get_predefined_environment_filter_map(slot2)
end
ViewportManager.get_environment_value = function (self, path, data_path_key)
	slot7 = data_path_key

	return self._env_manager.get_value(slot4, self._env_manager, path)
end
ViewportManager.has_data_path_key = function (self, data_path_key)
	slot5 = data_path_key

	return self._env_manager.has_data_path_key(slot3, self._env_manager)
end
ViewportManager.create_global_environment_modifier = function (self, data_path_key, is_override, modifier_func)
	slot8 = self

	for _, vp in ipairs(self.viewports(slot7)) do
		slot14 = modifier_func

		vp.create_environment_modifier(slot10, vp, data_path_key, is_override)
	end

	slot9 = modifier_func

	self._env_manager.set_global_environment_modifier(slot5, self._env_manager, data_path_key, is_override)

	return data_path_key
end
ViewportManager.destroy_global_environment_modifier = function (self, data_path_key)
	slot6 = self

	for _, vp in ipairs(self.viewports(slot5)) do
		slot10 = data_path_key

		vp.destroy_environment_modifier(slot8, vp)
	end

	self._env_manager.set_global_environment_modifier(slot3, self._env_manager, data_path_key, nil)

	return 
end
ViewportManager.update_global_environment_value = function (self, data_path_key)
	slot6 = self

	for _, vp in ipairs(self.viewports(slot5)) do
		slot10 = data_path_key

		vp.update_environment_value(slot8, vp)
	end

	return 
end
ViewportManager.set_default_environment = function (self, default_environment_path, blend_duration, blend_bezier_curve)
	self._env_manager.set_default_environment(slot5, self._env_manager)

	slot8 = self

	for _, viewport in ipairs(self.viewports(default_environment_path)) do
		slot14 = blend_bezier_curve

		viewport.on_default_environment_changed(slot10, viewport, default_environment_path, blend_duration)
	end

	return 
end
ViewportManager.default_environment = function (self)
	slot3 = self._env_manager

	return self._env_manager.default_environment(slot2)
end
ViewportManager.game_default_environment = function (self)
	slot3 = self._env_manager

	return self._env_manager.game_default_environment(slot2)
end
ViewportManager.editor_reset_environment = function (self)
	slot5 = self

	for _, vp in ipairs(self.active_viewports(slot4)) do
		slot11 = self

		vp.set_environment(slot7, vp, self.game_default_environment(slot10), nil, nil, nil)
	end

	return 
end
ViewportManager._viewport_destroyed = function (self, vp)
	slot5 = vp

	self._del_accessobj(slot3, self)

	self._current_camera = nil

	return 
end
ViewportManager._get_environment_manager = function (self)
	return self._env_manager
end
ViewportManager._prioritize_and_activate = function (self)
	local old_first_vp = self.first_active_viewport(slot2)
	slot4 = self

	ViewportManager.super._prioritize_and_activate(self)

	slot4 = self
	local first_vp = self.first_active_viewport(self)

	if old_first_vp ~= first_vp then
		if old_first_vp then
			slot6 = false

			old_first_vp.set_first_viewport(slot4, old_first_vp)
		end

		if first_vp then
			slot6 = true

			first_vp.set_first_viewport(slot4, first_vp)
		end
	end

	return 
end
ViewportManager.first_active_world_viewport = function (self)
	slot5 = self

	for _, vp in ipairs(self.active_viewports(slot4)) do
		slot9 = "World"

		if vp.is_rendering_scene(slot7, vp) then
			return vp
		end
	end

	return 
end
ViewportManager.get_current_camera = function (self)
	if self._current_camera then
		return self._current_camera
	end

	slot3 = self
	local vps = self._all_really_active(slot2)

	if 0 < #vps then
		slot4 = vps[1]
		slot2 = vps[1].camera(slot3)
	else
		slot2 = false

		if false then
			slot2 = true
		end
	end

	self._current_camera = slot2

	return self._current_camera
end
ViewportManager.get_current_camera_position = function (self)
	if self._current_camera_position_updated then
		return self._current_camera_position
	end

	slot3 = self

	if self.get_current_camera(slot2) then
		slot3 = self
		slot4 = self._current_camera_position

		self.get_current_camera(slot2).m_position(slot2, self.get_current_camera(slot2))

		self._current_camera_position_updated = true
	end

	return self._current_camera_position
end
ViewportManager.get_current_camera_rotation = function (self)
	if self._current_camera_rotation then
		return self._current_camera_rotation
	end

	slot3 = self

	if self.get_current_camera(slot2) then
		slot3 = self
		slot3 = self.get_current_camera(slot2)
		slot1 = self.get_current_camera(slot2).rotation(slot2)
	end

	self._current_camera_rotation = slot1

	return self._current_camera_rotation
end
ViewportManager.get_active_vp = function (self)
	slot3 = self
	slot3 = self.active_vp(slot2)

	return self.active_vp(slot2).vp(slot2)
end
ViewportManager.active_vp = function (self)
	slot3 = self
	local vps = self.active_viewports(slot2)

	return 0 < #vps and vps[1]
end
slot3 = "WIN32"
local is_win32 = SystemInfo.platform(function (self)
	slot3 = self
	local vps = self.active_viewports(slot2)

	if 0 < #vps then
		slot2 = vps[1]
	else
		slot2 = false

		if false then
			slot2 = true
		end
	end

	return slot2
end) == Idstring(SystemInfo)
slot4 = "PS4"
local is_ps4 = SystemInfo.platform(slot2) == Idstring(SystemInfo)
slot5 = "XB1"
local is_xb1 = SystemInfo.platform(slot3) == Idstring(SystemInfo)
ViewportManager.get_safe_rect = function (self)
	local a = 0.05
	local b = 1 - a * 2

	return {
		x = a,
		y = a,
		width = b,
		height = b
	}
end
ViewportManager.get_safe_rect_pixels = function (self)
	local res = RenderSettings.resolution
	slot4 = self
	local safe_rect_scale = self.get_safe_rect(slot3)
	local safe_rect_pixels = {}
	slot6 = safe_rect_scale.x * res.x
	safe_rect_pixels.x = math.round(slot5)
	slot6 = safe_rect_scale.y * res.y
	safe_rect_pixels.y = math.round(slot5)
	slot6 = safe_rect_scale.width * res.x
	safe_rect_pixels.width = math.round(slot5)
	slot6 = safe_rect_scale.height * res.y
	safe_rect_pixels.height = math.round(slot5)

	return safe_rect_pixels
end
ViewportManager.set_resolution = function (self, resolution)
	if RenderSettings.resolution ~= resolution or (self._render_settings_change_map and self._render_settings_change_map.resolution ~= resolution) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.resolution = resolution
	end

	return 
end
ViewportManager.is_fullscreen = function (self)
	if self._render_settings_change_map and self._render_settings_change_map.fullscreen ~= nil then
		return self._render_settings_change_map.fullscreen
	else
		return RenderSettings.fullscreen
	end

	return 
end
ViewportManager.is_borderless = function (self)
	if self._render_settings_change_map and self._render_settings_change_map.borderless ~= nil then
		return self._render_settings_change_map.borderless
	else
		return RenderSettings.borderless
	end

	return 
end
ViewportManager.set_fullscreen = function (self, fullscreen)
	if not RenderSettings.fullscreen ~= not fullscreen or (self._render_settings_change_map and not self._render_settings_change_map.fullscreen ~= not fullscreen) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.fullscreen = not not fullscreen
	end

	return 
end
ViewportManager.set_borderless = function (self, borderless)
	if not RenderSettings.borderless ~= not borderless or (self._render_settings_change_map and not self._render_settings_change_map.borderless ~= not borderless) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.borderless = not not borderless
	end

	return 
end
ViewportManager.set_aspect_ratio = function (self, aspect_ratio)
	if RenderSettings.aspect_ratio ~= aspect_ratio or (self._render_settings_change_map and self._render_settings_change_map.aspect_ratio ~= aspect_ratio) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.aspect_ratio = aspect_ratio
		self._aspect_ratio = aspect_ratio
	end

	return 
end
ViewportManager.set_vsync = function (self, vsync)
	if RenderSettings.v_sync ~= vsync or (self._render_settings_change_map and self._render_settings_change_map.v_sync ~= vsync) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.v_sync = vsync
		self._v_sync = vsync
	end

	return 
end
ViewportManager.set_buffer_count = function (self, buffer_count)
	if RenderSettings.buffer_count ~= buffer_count or (self._render_settings_change_map and self._render_settings_change_map.buffer_count ~= buffer_count) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.buffer_count = buffer_count
	end

	return 
end
ViewportManager.set_adapter_index = function (self, adapter_index)
	if RenderSettings.adapter_index ~= adapter_index or (self._render_settings_change_map and self._render_settings_change_map.adapter_index ~= adapter_index) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.adapter_index = adapter_index
	end

	return 
end
ViewportManager.aspect_ratio = function (self)
	return self._aspect_ratio
end
ViewportManager.set_aspect_ratio2 = function (self, aspect_ratio)
	self._aspect_ratio = aspect_ratio

	return 
end
ViewportManager.save = function (self, data)
	local state = {}
	slot5 = self
	state.default_environment = self.default_environment(slot4)
	data.ViewportManager = state

	return 
end
ViewportManager.load = function (self, data)
	local state = data.ViewportManager

	if not state then
		return 
	end

	slot6 = state.default_environment

	self.set_default_environment(slot4, self)

	return 
end

return 
