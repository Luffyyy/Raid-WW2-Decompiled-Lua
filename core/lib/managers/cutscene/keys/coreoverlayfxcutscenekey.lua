-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

slot3 = "CoreColorPickerDialog"

core.import(slot1, core)

if not CoreOverlayFXCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreOverlayFXCutsceneKey = slot0
CoreOverlayFXCutsceneKey.ELEMENT_NAME = "overlay_fx"
CoreOverlayFXCutsceneKey.NAME = "Overlay Effect"
CoreOverlayFXCutsceneKey.VALID_BLEND_MODES = {
	"normal",
	"add"
}
slot4 = CoreOverlayFXCutsceneKey.VALID_BLEND_MODES[1]

CoreOverlayFXCutsceneKey.register_serialized_attribute(, CoreOverlayFXCutsceneKey, "blend_mode")

slot5 = CoreCutsceneKeyBase.string_to_color

CoreOverlayFXCutsceneKey.register_serialized_attribute(, CoreOverlayFXCutsceneKey, "color", Color.white)

slot5 = tonumber

CoreOverlayFXCutsceneKey.register_serialized_attribute(, CoreOverlayFXCutsceneKey, "fade_in", 0)

slot5 = tonumber

CoreOverlayFXCutsceneKey.register_serialized_attribute(, CoreOverlayFXCutsceneKey, "sustain", 0)

slot5 = tonumber

CoreOverlayFXCutsceneKey.register_serialized_attribute(, CoreOverlayFXCutsceneKey, "fade_out", 0)

CoreOverlayFXCutsceneKey.control_for_blend_mode = CoreCutsceneKeyBase.standard_combo_box_control
slot5 = CoreOverlayFXCutsceneKey.VALID_BLEND_MODES
CoreOverlayFXCutsceneKey.refresh_control_for_blend_mode = CoreCutsceneKeyBase.standard_combo_box_control_refresh(CoreOverlayFXCutsceneKey, CoreCutsceneKeyBase, "blend_mode")
CoreOverlayFXCutsceneKey.__tostring = function (self)
	return "Trigger overlay effect."
end
CoreOverlayFXCutsceneKey.preroll = function (self, player)
	slot4 = self

	if self.fade_in(slot3) == 0 then
		local effect_data = self._effect_data(slot3)
		effect_data.fade_in = 0
		effect_data.sustain = nil
		effect_data.fade_out = 0
		slot6 = effect_data

		managers.cutscene.play_overlay_effect(self, managers.cutscene)
	end

	return 
end
CoreOverlayFXCutsceneKey.skip = function (self, player)
	slot5 = self
	local full_intensity_start = self.time(slot3) + self.fade_in(self)
	local full_intensity_end = full_intensity_start + self.sustain(self)
	slot6 = player
	local cutscene_end = player.cutscene_duration(self)

	if full_intensity_start <= cutscene_end and cutscene_end <= full_intensity_end then
		local effect_data = self._effect_data(slot6)
		effect_data.fade_in = 0
		slot9 = 0
		effect_data.sustain = math.max(self, full_intensity_end - cutscene_end)
		slot9 = effect_data

		managers.cutscene.play_overlay_effect(self, managers.cutscene)
	end

	return 
end
CoreOverlayFXCutsceneKey.evaluate = function (self, player, fast_forward)
	slot7 = self

	function slot6(_, attribute_name)
		slot6 = attribute_name

		return attribute_name, self.attribute_value(slot4, self)
	end

	local effect_data = table.remap(slot4, self.attribute_names(slot6))
	slot7 = effect_data

	managers.cutscene.play_overlay_effect(self.attribute_names(slot6), managers.cutscene)

	return 
end
CoreOverlayFXCutsceneKey.revert = function (self, player)
	slot4 = self

	self._stop(slot3)

	return 
end
CoreOverlayFXCutsceneKey.update_gui = function (self, time, delta_time, player)
	if self.__color_picker_dialog then
		slot8 = delta_time

		self.__color_picker_dialog.update(slot5, self.__color_picker_dialog, time)
	end

	return 
end
CoreOverlayFXCutsceneKey.is_valid_blend_mode = function (self, value)
	slot5 = value

	return table.contains(slot3, self.VALID_BLEND_MODES)
end
CoreOverlayFXCutsceneKey.is_valid_fade_in = function (self, value)
	return 0 <= value
end
CoreOverlayFXCutsceneKey.is_valid_sustain = function (self, value)
	return 0 <= value
end
CoreOverlayFXCutsceneKey.is_valid_fade_out = function (self, value)
	return 0 <= value
end
CoreOverlayFXCutsceneKey.control_for_color = function (self, parent_frame)
	slot6 = ""
	local control = EWS.ColorWell(slot3, EWS, parent_frame)
	slot6 = "Open Color Picker"

	control.set_tool_tip(EWS, control)

	slot8 = 255

	control.set_background_colour(EWS, control, 255, 20)

	slot5 = control

	control.set_color(EWS, self.color(20))

	slot11 = "_on_pick_color"
	slot8 = control

	control.connect(EWS, control, "EVT_LEFT_UP", callback(self, self, self))

	return control
end
CoreOverlayFXCutsceneKey._on_pick_color = function (self, sender)
	if self.__color_picker_dialog == nil then
		slot5 = sender
		local cutscene_editor_window = self._top_level_window(slot3, self)
		slot9 = true
		self.__color_picker_dialog = CoreColorPickerDialog.ColorPickerDialog.new(self, CoreColorPickerDialog.ColorPickerDialog, cutscene_editor_window, true, "HORIZONTAL")

		function slot7()
			self.__color_picker_dialog = nil

			return 
		end

		self.__color_picker_dialog.connect(self, self.__color_picker_dialog, "EVT_CLOSE_WINDOW")
		self.__color_picker_dialog.connect(self, self.__color_picker_dialog, "EVT_COLOR_CHANGED")

		slot6 = cutscene_editor_window

		self.__color_picker_dialog.center(self, self.__color_picker_dialog)

		slot5 = self.__color_picker_dialog
		slot8 = self

		self.__color_picker_dialog.set_color(self, self.color(function ()
			local color = self.__color_picker_dialog.color(slot1)
			slot4 = color

			sender.set_color(self.__color_picker_dialog, sender)

			slot4 = color

			self.set_color(self.__color_picker_dialog, self)

			return 
		end))

		slot6 = true

		self.__color_picker_dialog.set_visible(self, self.__color_picker_dialog)
	end

	return 
end
CoreOverlayFXCutsceneKey._effect_data = function (self)
	slot5 = self

	function slot4(_, attribute_name)
		slot6 = attribute_name

		return attribute_name, self.attribute_value(slot4, self)
	end

	return table.remap(slot2, self.attribute_names(slot4))
end
CoreOverlayFXCutsceneKey._stop = function (self)
	slot3 = managers.cutscene

	managers.cutscene.stop_overlay_effect(slot2)

	return 
end
CoreOverlayFXCutsceneKey._top_level_window = function (self, window)

	-- Decompilation error in this vicinity:
	slot4 = window

	return slot2
end

return 
