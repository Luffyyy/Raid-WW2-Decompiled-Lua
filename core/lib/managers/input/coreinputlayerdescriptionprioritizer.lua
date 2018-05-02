-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreInputLayerDescriptionPrioritizer"

core.module(slot1, core)

Prioritizer = Prioritizer or class()
Prioritizer.init = function (self)
	self._layer_descriptions = {}

	return 
end
Prioritizer.add_layer_description = function (self, input_layer_description_description)

	-- Decompilation error in this vicinity:
	self._layer_descriptions[input_layer_description_description] = input_layer_description_description

	return 
end
Prioritizer.remove_layer_description = function (self, input_layer_description_description)
	local needs_to_search = self._layer_description == input_layer_description_description
	slot5 = self._layer_descriptions[input_layer_description_description] ~= nil

	assert(slot4)

	self._layer_descriptions[input_layer_description_description] = nil
	local best_layer_description = nil
	slot6 = self._layer_descriptions

	for _, layer_description in pairs(slot5) do
	end

	self._layer_description = best_layer_description

	return 
end
Prioritizer.active_layer_description = function (self)
	return self._layer_description
end

return 
