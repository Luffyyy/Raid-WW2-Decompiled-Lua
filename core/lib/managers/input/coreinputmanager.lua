slot3 = "CoreInputManager"

core.module(slot1, core)

slot3 = "CoreInputContextFeeder"

core.import(slot1, core)

slot3 = "CoreInputSettingsReader"

core.import(slot1, core)

InputManager = InputManager or class()
InputManager.init = function (self)
	local settings_reader = CoreInputSettingsReader.SettingsReader.new(slot2)
	slot4 = settings_reader
	self._layer_descriptions = settings_reader.layer_descriptions(CoreInputSettingsReader.SettingsReader)
	self._feeders = {}
	self._input_provider_to_feeder = {}

	return 
end
InputManager.destroy = function (self)
	return 
end
InputManager.update = function (self, t, dt)
	slot5 = self._feeders

	for _, feeder in pairs(slot4) do
		slot10 = feeder

		feeder.update(slot9)
	end

	return 
end
InputManager.input_provider_id_that_presses_start = function (self)
	local layer_description_ids = {}
	slot4 = Input
	local count = Input.num_real_controllers(slot3)

	for i = 1, count, 1 do
		slot10 = i
		local controller = Input.controller(slot8, Input)
		slot10 = controller

		if controller.connected(Input) then
			slot10 = controller
			slot13 = "start"

			if controller.pressed(slot9, Idstring(slot12)) then
				slot11 = controller

				table.insert(slot9, layer_description_ids)
			end
		end
	end

	return layer_description_ids
end
InputManager.debug_primary_input_provider_id = function (self)
	slot3 = Input
	local count = Input.num_real_controllers(slot2)
	local best_controller = nil

	for i = 1, count, 1 do
		slot10 = i
		local controller = Input.controller(slot8, Input)
		slot10 = controller

		if controller.connected(Input) then
			slot10 = controller

			if controller.type(slot9) == "xbox360" then
				best_controller = controller

				break
			elseif best_controller == nil then
				best_controller = controller
			end
		end
	end

	slot6 = "You need at least one compatible controller plugged in"

	assert(slot4, best_controller)

	return best_controller
end
InputManager._create_input_provider_for_controller = function (self, engine_controller)
	slot6 = self._layer_descriptions
	local feeder = CoreInputContextFeeder.Feeder.new(slot3, CoreInputContextFeeder.Feeder, engine_controller)
	slot5 = feeder
	local input_provider = feeder.input_provider(CoreInputContextFeeder.Feeder)
	self._input_provider_to_feeder[input_provider] = feeder
	self._feeders[feeder] = feeder

	return input_provider
end
InputManager._destroy_input_provider = function (self, input_provider)
	local feeder = self._input_provider_to_feeder[input_provider]
	self._feeders[feeder] = nil

	return 
end

return 
