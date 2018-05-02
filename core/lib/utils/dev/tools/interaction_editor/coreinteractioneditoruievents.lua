slot3 = "CoreInteractionEditorUIEvents"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreMath"

core.import(slot1, core)

slot3 = "CoreInteractionEditorConfig"

core.import(slot1, core)

InteractionEditorUIEvents = InteractionEditorUIEvents or CoreClass.class()
InteractionEditorUIEvents.on_close = function (self)
	slot4 = CoreInteractionEditorConfig.EDITOR_TITLE

	managers.toolhub.close(slot2, managers.toolhub)

	return 
end
InteractionEditorUIEvents.on_new = function (self)
	slot3 = self

	self.open_system(slot2)

	return 
end
InteractionEditorUIEvents.on_close_system = function (self)
	slot3 = self

	self.close_system(slot2)

	return 
end
InteractionEditorUIEvents.on_notebook_changing = function (self, data, event)
	slot5 = self
	slot8 = self
	slot8 = self.ui(slot7)
	slot11 = event

	self.activate_system(slot4, self.ui(slot7).get_nb_page(slot7, event.get_selection(slot10)))

	return 
end
InteractionEditorUIEvents.on_show_graph_context_menu = function (self, system)
	slot4 = self
	slot5 = system

	self.ui(slot3).show_graph_context_menu(slot3, self.ui(slot3))

	return 
end
InteractionEditorUIEvents.on_add_node = function (self, func)
	func()

	return 
end
InteractionEditorUIEvents.on_remove_node = function (self, func)
	func()

	return 
end
InteractionEditorUIEvents.on_save = function (self)
	slot3 = self

	self.do_save(slot2)

	return 
end
InteractionEditorUIEvents.on_save_as = function (self)
	slot3 = self

	self.do_save_as(slot2)

	return 
end
InteractionEditorUIEvents.on_save_all = function (self)
	slot3 = self

	self.do_save_all(slot2)

	return 
end
InteractionEditorUIEvents.on_open = function (self)
	slot6 = self
	slot6 = self.ui("*.interaction_project")
	local path, dir = managers.database.open_file_dialog(slot2, managers.database, self.ui("*.interaction_project").frame("*.interaction_project"))

	if path then
		slot6 = path

		if managers.database.has(slot4, managers.database) then
			slot6 = path

			self.open_system(slot4, self)
		end
	end

	return 
end
InteractionEditorUIEvents.on_undo = function (self)
	return 
end
InteractionEditorUIEvents.on_redo = function (self)
	return 
end

return 
