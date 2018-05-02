-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not HubTimeline then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

HubTimeline = slot0
function HubTimeline:init(caption)
	slot12 = 0
	slot13 = 0
	slot10 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,STAY_ON_TOP"

	CoreEditorEwsDialog.init(slot3, self, nil, "Hub - " .. caption, "", Vector3(slot9, 25, 602), Vector3(25, 1000, 200))

	slot5 = "VERTICAL"

	self.create_panel(slot3, self)

	self._multiplier = 30
	slot5 = self._panel
	self._scrolled_area = EWS.ScrolledWindow(slot3, EWS)
	slot9 = 1
	slot10 = 1
	slot11 = 0
	slot8 = false

	self._scrolled_area.set_scrollbars(slot3, self._scrolled_area, Vector3("Hub - " .. caption, 1, 1), Vector3(1, 1, 1), Vector3(1, 0, 0))

	slot5 = "VERTICAL"
	local scrolled_area_sizer = EWS.BoxSizer(slot3, EWS)
	slot6 = scrolled_area_sizer

	self._scrolled_area.set_sizer(EWS, self._scrolled_area)

	slot9 = "EXPAND"

	self._panel_sizer.add(EWS, self._panel_sizer, self._scrolled_area, 1, 0)

	self._sequence_track = EWS.SequencerTrack(EWS, EWS, self._scrolled_area)
	slot6 = self._sequence_track

	self._connect_mouse_events(EWS, self)

	slot5 = self._sequence_track
	slot9 = "3DFACE"
	slot8 = EWS.get_system_colour("", EWS)

	self._sequence_track.set_background_colour(EWS, EWS.get_system_colour("", EWS).unpack(""))

	slot6 = self._scrolled_area
	self._ruler = EWS.SequencerRuler(EWS, EWS)
	slot7 = 1

	self._ruler.set_major_divisions(EWS, self._ruler, 100)

	slot7 = self._multiplier

	self._sequence_track.set_units(EWS, self._sequence_track, 100)

	slot9 = "EXPAND"

	scrolled_area_sizer.add(EWS, scrolled_area_sizer, self._ruler, 0, 0)

	slot9 = "EXPAND"

	scrolled_area_sizer.add(EWS, scrolled_area_sizer, self._sequence_track, 1, 0)

	slot6 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = "HORIZONTAL"
	local button_sizer1 = EWS.BoxSizer(EWS, EWS)
	slot10 = 1

	self._zoom_button(EWS, self, button_sizer1, "1")

	slot10 = 2

	self._zoom_button(EWS, self, button_sizer1, "2")

	slot10 = 5

	self._zoom_button(EWS, self, button_sizer1, "5")

	slot10 = 10

	self._zoom_button(EWS, self, button_sizer1, "10")

	slot10 = 25

	self._zoom_button(EWS, self, button_sizer1, "25")
	self._zoom_button(EWS, self, button_sizer1, "50")

	slot8 = "HORIZONTAL"
	local element_name_sizer = EWS.BoxSizer(EWS, EWS)
	slot15 = ""
	slot12 = "ALIGN_CENTER_VERTICAL"

	element_name_sizer.add(EWS, element_name_sizer, EWS.StaticText(50, EWS, self._panel, "Name:", 0), 1, 0)

	slot12 = "ALIGN_CENTRE,ST_NO_AUTORESIZE"
	self._element_name = EWS.StaticText(EWS, EWS, self._panel, "", "")
	slot12 = "ALIGN_CENTER_VERTICAL"

	element_name_sizer.add(EWS, element_name_sizer, self._element_name, 6, 0)

	slot12 = "EXPAND,LEFT"

	button_sizer1.add(EWS, button_sizer1, element_name_sizer, 0, 32)

	slot9 = "HORIZONTAL"
	local element_type_sizer = EWS.BoxSizer(EWS, EWS)
	slot16 = ""
	slot13 = "ALIGN_CENTER_VERTICAL"

	element_type_sizer.add(EWS, element_type_sizer, EWS.StaticText(32, EWS, self._panel, "Type:", ""), 1, 0)

	slot13 = "ALIGN_CENTRE,ST_NO_AUTORESIZE"
	self._element_type = EWS.StaticText(EWS, EWS, self._panel, "", "")
	slot13 = "ALIGN_CENTER_VERTICAL"

	element_type_sizer.add(EWS, element_type_sizer, self._element_type, 4, 0)

	slot13 = "EXPAND,LEFT"

	button_sizer1.add(EWS, button_sizer1, element_type_sizer, 0, 32)

	slot10 = "HORIZONTAL"
	local element_delay_sizer = EWS.BoxSizer(EWS, EWS)
	slot17 = ""
	slot14 = "ALIGN_CENTER_VERTICAL"

	element_delay_sizer.add(EWS, element_delay_sizer, EWS.StaticText(32, EWS, self._panel, "Delay:", 0), 1, 0)

	slot14 = "ALIGN_CENTRE,ST_NO_AUTORESIZE"
	self._element_delay = EWS.StaticText(EWS, EWS, self._panel, "", "")
	slot14 = "ALIGN_CENTER_VERTICAL"

	element_delay_sizer.add(EWS, element_delay_sizer, self._element_delay, 2, 0)

	slot14 = "EXPAND,LEFT"

	button_sizer1.add(EWS, button_sizer1, element_delay_sizer, 0, 32)

	slot14 = "ALIGN_LEFT"

	button_sizer.add(EWS, button_sizer, button_sizer1, 1, 0)

	slot11 = "HORIZONTAL"
	local button_sizer2 = EWS.BoxSizer(EWS, EWS)
	slot15 = ""
	local cancel_btn = EWS.Button(EWS, EWS, self._panel, "Close", "")
	slot16 = "RIGHT,LEFT"

	button_sizer2.add(EWS, button_sizer2, cancel_btn, 0, 2)

	slot18 = "on_cancel"

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot18 = "key_cancel"
	slot15 = ""

	cancel_btn.connect(EWS, cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot16 = "EXPAND"

	button_sizer.add(EWS, button_sizer, button_sizer2, 0, 0)

	slot16 = "EXPAND,TOP,BOTTOM"

	self._panel_sizer.add(EWS, self._panel_sizer, button_sizer, 0, 2)

	slot16 = "EXPAND"

	self._dialog_sizer.add(EWS, self._dialog_sizer, self._panel, 1, 0)

	slot13 = true

	self._dialog.set_visible(EWS, self._dialog)

	slot18 = "on_focus"

	self._dialog.connect(EWS, self._dialog, "EVT_CHILD_FOCUS", callback(0, self, self))

	slot18 = "key_cancel"
	slot15 = ""

	self._sequence_track.connect(EWS, self._sequence_track, "EVT_KEY_DOWN", callback("", self, self))

	return 
end
function HubTimeline:on_focus()
	slot4 = self._hub_unit

	managers.editor.select_unit(slot2, managers.editor)

	return 
end
function HubTimeline:_zoom_button(sizer, name, seconds)
	slot10 = "BU_EXACTFIT"
	local btn = EWS.Button(slot5, EWS, self._panel, name, "")
	slot11 = "RIGHT,LEFT,TOP"

	sizer.add(EWS, sizer, btn, 0, 2)

	slot13 = "on_btn_zoom"

	btn.connect(EWS, btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot13 = "key_cancel"
	slot10 = ""

	btn.connect(EWS, btn, "EVT_KEY_DOWN", callback(seconds, self, self))

	return 
end
function HubTimeline:on_btn_zoom(seconds)
	slot5 = (self.size(slot6).x - 40) / seconds
	slot8 = self._ruler

	self._ruler.set_major_divisions(slot3, self._ruler, self._ruler.units_per_major_division(self))

	slot7 = self
	slot6 = self._multiplier

	self._sequence_track.set_units(slot3, self._sequence_track, (self.size(self._ruler.units_per_major_division).x - 40) / seconds)

	slot4 = self._sequence_track

	self._sequence_track.set_focus(slot3)

	slot4 = self._sequence_track
	local clip = self._sequence_track.selected_clips(slot3)[1]

	if not clip then
		return 
	end

	local offset_in_window = self.size(slot4).x / 2
	local scroll_offset = self._sequence_track.units_to_pixels(self, clip.start_time(slot8)) - offset_in_window
	slot7 = self._scrolled_area
	slot12 = self._scrolled_area
	slot12 = 0

	self._scrolled_area.scroll(self._sequence_track, Vector3(clip, scroll_offset / self._scrolled_area.scroll_pixels_per_unit(slot11).x, -1))

	return 
end
function HubTimeline:set_hub_unit(unit)
	self._hub_unit = unit
	slot4 = self

	self.update_timeline(slot3)

	return 
end
function HubTimeline:update_timeline()
	slot3 = self._sequence_track

	self._sequence_track.remove_all_clips(slot2)

	slot5 = self._hub_unit
	slot3 = self._hub_unit.hub_element_data(slot4).actions

	for _, unit in pairs(slot2) do
		slot9 = unit

		self._add_unit(slot7, self)
	end

	return 
end
function HubTimeline:action_delay_updated(data)
	slot6 = self._sequence_track

	for _, clip in ipairs(self._sequence_track.clips(slot5)) do
		slot9 = clip

		if clip.metadata(slot8).data == data then
			local coor = data.action_delay * self._multiplier

			clip.set_range(slot9, clip, coor)

			slot10 = self._element_delay
			slot14 = data.action_delay

			self._element_delay.set_value(slot9, string.format(coor, "%.4f"))

			return 
		end
	end

	return 
end
function HubTimeline:add_action(unit)
	slot5 = unit
	local clip = self._add_unit(slot3, self)

	return 
end
function HubTimeline:select_action(action)
	slot6 = self._sequence_track

	for _, clip in ipairs(self._sequence_track.clips(slot5)) do
		slot9 = clip

		if clip.metadata(slot8).data == action then
			slot10 = clip

			self._select_clip(slot8, self)

			return 
		end
	end

	return 
end
function HubTimeline:_select_clip(clip)

	-- Decompilation error in this vicinity:
	slot4 = self._element_name
	slot2 = self._element_name.set_value

	return 
end
function HubTimeline:remove_action(unit)
	slot6 = self._sequence_track

	for _, clip in ipairs(self._sequence_track.clips(slot5)) do
		slot9 = clip

		if clip.metadata(slot8).unit == unit then
			slot10 = clip

			self._sequence_track.remove_clip(slot8, self._sequence_track)

			return 
		end
	end

	return 
end
function HubTimeline:_add_unit(unit)
	local key = EWS.SequencerKey(slot3)
	slot5 = self._hub_unit
	slot6 = unit
	local ha = self._hub_unit.hub_element(EWS).get_hub_action(EWS, self._hub_unit.hub_element(EWS))
	slot7 = {
		unit = unit,
		data = ha
	}

	key.set_metadata(self._hub_unit.hub_element(EWS), key)

	slot7 = unit
	local r, g, b = self._get_color(self._hub_unit.hub_element(EWS), self)
	slot12 = b

	key.set_colour(slot8, key, r, g)

	slot11 = ha.action_delay * self._multiplier

	return self._sequence_track.add_clip(slot8, self._sequence_track, key)
end
function HubTimeline:_get_color(unit)
	slot4 = unit
	slot4 = unit.hub_element(slot3)
	local color = unit.hub_element(slot3).timeline_color(slot3)

	if color then
		return color.x, color.y, color.z
	end

	slot7 = 1

	return math.rand(slot4), math.rand(1), math.rand(1)
end
function HubTimeline:_connect_mouse_events(component)
	slot10 = "_on_mouse_left_down"

	component.connect(slot3, component, "EVT_LEFT_DOWN", callback(slot7, self, self))

	slot10 = "_on_mouse_right_down"

	component.connect(slot3, component, "EVT_RIGHT_DOWN", callback(component, self, self))

	slot10 = "_on_mousewheel"

	component.connect(slot3, component, "EVT_MOUSEWHEEL", callback(component, self, self))

	slot10 = "_on_mouse_motion"

	component.connect(slot3, component, "EVT_MOTION", callback(component, self, self))

	slot10 = "_on_mouse_left_up"
	slot7 = component

	component.connect(slot3, component, "EVT_LEFT_UP", callback(component, self, self))

	return 
end
function HubTimeline:_on_mouse_left_down(sender, event)
	self._dragging = true
	slot6 = event
	local key = self._sequence_track.clip_at_event(slot4, self._sequence_track)

	if key then
		slot6 = self._hub_unit
		slot9 = key
		slot7 = key.metadata(slot8).unit

		self._hub_unit.hub_element(slot5).select_action_with_unit(slot5, self._hub_unit.hub_element(slot5))
	end

	slot7 = self._hub_unit

	managers.editor.select_unit(slot5, managers.editor)

	return 
end
function HubTimeline:_on_mouse_left_up(sender, event)
	self._dragging = false

	return 
end
function HubTimeline:_on_mouse_right_down(sender, event)
	slot6 = event
	local key = self._sequence_track.clip_at_event(slot4, self._sequence_track)
	slot7 = key

	self._select_clip(self._sequence_track, self)

	if key then
		slot9 = key
		slot7 = key.metadata(slot8).unit

		managers.editor.select_unit(slot5, managers.editor)
	else
		slot7 = self._hub_unit

		managers.editor.select_unit(slot5, managers.editor)
	end

	return 
end
function HubTimeline:_on_mouse_motion(sender, event)
	if not self._dragging then
		return 
	end

	slot6 = self._sequence_track
	local pos = event.get_position(slot4, event)
	slot7 = pos.x
	local coor = self._sequence_track.pixels_to_units(event, self._sequence_track)
	slot9 = self._sequence_track

	for _, key in ipairs(self._sequence_track.selected_clips(slot8)) do
		slot14 = coor

		key.set_range(slot11, key, coor)

		local delay = coor / self._multiplier
		slot13 = key
		key.metadata(key).data.action_delay = delay
		slot13 = self._hub_unit
		slot13 = self._hub_unit.hub_element(key)

		self._hub_unit.hub_element(key).ews_select_action(key)

		slot13 = self._element_delay
		slot19 = key
		slot17 = key.metadata(slot18).data.action_delay

		self._element_delay.set_value(key, string.format(slot15, "%.4f"))
	end

	return 
end
function HubTimeline:_on_mousewheel(track, event)
	slot5 = self._sequence_track
	local clip = self._sequence_track.selected_clips(slot4)[1]

	if not clip then
		return 
	end

	slot9 = self._ruler
	local delta = math.sign(event.get_wheel_rotation(slot7)) * math.clamp(event.get_wheel_rotation, self._ruler.pixels_per_major_division(event) / 100, 1)
	slot11 = self._panel
	slot10 = delta

	self.zoom_around(event.get_wheel_rotation, self, clip.start_time(20), self._panel.get_size(clip).x / 2)

	return 
end
function HubTimeline:zoom_around(time, offset_in_window, delta)
	slot6 = self._scrolled_area

	self._scrolled_area.freeze(slot5)

	slot8 = self._ruler
	slot8 = 10000
	local new_pixels_per_division = math.clamp(slot5, self._ruler.pixels_per_major_division(slot7) + delta, 20)
	slot8 = new_pixels_per_division
	slot11 = self._ruler

	self._ruler.set_major_divisions(self._ruler.pixels_per_major_division(slot7) + delta, self._ruler, self._ruler.units_per_major_division(slot10))

	slot9 = self._multiplier

	self._sequence_track.set_units(self._ruler.pixels_per_major_division(slot7) + delta, self._sequence_track, new_pixels_per_division)

	slot8 = time
	local scroll_offset = self._sequence_track.units_to_pixels(self._ruler.pixels_per_major_division(slot7) + delta, self._sequence_track) - offset_in_window
	slot8 = self._scrolled_area
	slot13 = self._scrolled_area
	slot13 = 0

	self._scrolled_area.scroll(self._sequence_track, Vector3(slot10, scroll_offset / self._scrolled_area.scroll_pixels_per_unit(slot12).x, -1))

	slot8 = self._scrolled_area

	self._scrolled_area.thaw(self._sequence_track)

	return 
end

return 
