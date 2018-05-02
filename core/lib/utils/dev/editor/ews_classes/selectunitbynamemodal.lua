if not SelectUnitByNameModal then
	slot2 = UnitByName
	slot0 = class(slot1)
end

SelectUnitByNameModal = slot0
SelectUnitByNameModal.init = function (self, name, unit_filter_function, ...)
	slot7 = unit_filter_function

	UnitByName.init(slot4, self, name, ...)

	slot5 = self

	self.show_modal(slot4)

	return 
end
SelectUnitByNameModal._build_buttons = function (self, panel, sizer)
	slot9 = "BU_BOTTOM"
	local select_btn = EWS.Button(slot4, EWS, panel, "Select", "")
	slot10 = "RIGHT,LEFT"

	sizer.add(EWS, sizer, select_btn, 0, 2)

	slot12 = "_on_select_unit"

	select_btn.connect(EWS, select_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot12 = "key_cancel"
	slot9 = ""

	select_btn.connect(EWS, select_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot8 = sizer

	UnitByName._build_buttons(EWS, self, panel)

	return 
end
SelectUnitByNameModal._on_select_unit = function (self)
	slot3 = self

	self.end_modal(slot2)

	return 
end
SelectUnitByNameModal.on_cancel = function (self)
	self._cancelled = true
	slot3 = self

	self.end_modal(slot2)

	return 
end
SelectUnitByNameModal.end_modal = function (self)
	slot4 = "hello"

	self._dialog.end_modal(slot2, self._dialog)

	return 
end
SelectUnitByNameModal.cancelled = function (self)
	return self._cancelled
end
SelectUnitByNameModal.selected_units = function (self)
	slot3 = self

	return self._selected_item_units(slot2)
end

if not SingleSelectUnitByNameModal then
	slot2 = SelectUnitByNameModal
	slot0 = class(slot1)
end

SingleSelectUnitByNameModal = slot0
SingleSelectUnitByNameModal.STYLE = "LC_REPORT,LC_NO_HEADER,LC_SORT_ASCENDING,LC_SINGLE_SEL"

return 
