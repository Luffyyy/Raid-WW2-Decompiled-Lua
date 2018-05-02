TvGui = TvGui or class()
TvGui.init = function (self, unit)
	self._unit = unit
	slot5 = self._unit

	managers.raid_menu.register_background_unit(slot3, managers.raid_menu)

	self._gui_object = self._gui_object or "gui_name"
	slot4 = World
	self._new_gui = World.newgui(slot3)
	slot4 = self
	slot7 = self._unit
	slot10 = self._gui_object

	self.add_workspace(slot3, self._unit.get_object(slot6, Idstring(slot9)))

	slot4 = self

	self.setup(slot3)

	slot7 = "tv_gui"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(slot6))

	slot4 = self
	slot7 = Application

	self.set_visible(slot3, Application.editor(false))

	slot4 = self

	self.pause(slot3)

	return 
end
TvGui.add_workspace = function (self, gui_object)
	slot7 = gui_object
	slot12 = 0
	self._ws = self._new_gui.create_object_workspace(slot3, self._new_gui, 0, 0, Vector3(slot9, 0, 0))

	return 
end
TvGui.setup = function (self)
	slot3 = self._ws
	slot4 = {
		loop = true,
		visible = true,
		layer = 10,
		video = self._video
	}
	self._video_panel = self._ws.panel(slot2).video(slot2, self._ws.panel(slot2))
	slot3 = self._video_panel
	slot6 = "gui:DIFFUSE_TEXTURE:FULLBRIGHT"

	self._video_panel.set_render_template(slot2, Idstring(self._video))

	return 
end
TvGui.set_visible = function (self, visible)
	slot5 = visible

	self._video_panel.set_visible(slot3, self._video_panel)

	slot5 = visible

	self._unit.set_visible(slot3, self._unit)

	return 
end
TvGui.start = function (self)
	slot3 = self._video_panel

	self._video_panel.play(slot2)

	return 
end
TvGui.pause = function (self)
	slot3 = self._video_panel

	self._video_panel.pause(slot2)

	return 
end
TvGui.stop = function (self)
	slot3 = self._video_panel

	self._video_panel.pause(slot2)

	slot3 = self._video_panel

	self._video_panel.rewind(slot2)

	return 
end
TvGui.destroy = function (self)
	slot3 = self._new_gui

	if alive(slot2) then
		slot3 = self._ws

		if alive(slot2) then
			slot4 = self._ws

			self._new_gui.destroy_workspace(slot2, self._new_gui)

			self._ws = nil
			self._new_gui = nil
		end
	end

	slot4 = self._unit

	managers.raid_menu.unregister_background_unit(slot2, managers.raid_menu)

	return 
end

return 
