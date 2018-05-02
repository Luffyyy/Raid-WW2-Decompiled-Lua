CoreMissionElementData = CoreMissionElementData or class()

if not MissionElementData then
	slot2 = CoreMissionElementData
	slot0 = class(slot1)
end

MissionElementData = slot0
MissionElementData.init = function (self, ...)
	slot3 = self

	CoreMissionElementData.init(slot2, ...)

	return 
end
CoreMissionElementData.init = function (self, unit)
	return 
end

return 
