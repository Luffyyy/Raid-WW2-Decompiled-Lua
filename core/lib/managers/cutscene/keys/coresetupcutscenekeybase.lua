slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreSetupCutsceneKeyBase then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreSetupCutsceneKeyBase = slot0
CoreSetupCutsceneKeyBase.populate_from_editor = function (self, cutscene_editor)
	return 
end
CoreSetupCutsceneKeyBase.frame = function (self)
	return 0
end
CoreSetupCutsceneKeyBase.set_frame = function (self, frame)
	return 
end
CoreSetupCutsceneKeyBase.on_gui_representation_changed = function (self, sender, sequencer_clip)
	return 
end
CoreSetupCutsceneKeyBase.prime = function (self, player)
	slot4 = "Cutscene keys deriving from CoreSetupCutsceneKeyBase must define the \"prime\" method."

	error(slot3)

	return 
end
CoreSetupCutsceneKeyBase.play = function (self, player, undo, fast_forward)
	return 
end

return 
