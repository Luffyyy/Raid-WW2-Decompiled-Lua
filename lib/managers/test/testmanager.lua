TestManager = TestManager or class()
slot2 = "lib/managers/test/TestPhysXCrashRandom"

require(slot1)

slot2 = "lib/managers/test/TestPhysXCrash"

require(slot1)

slot2 = "lib/managers/test/TestUtilities"

require(slot1)

local tests = {
	PhysX = TestPhysXCrash,
	PhysXRandom = TestPhysXCrashRandom
}
local active_tests = {}
local utils = nil
TestManager.init = function (self)
	slot3 = TestUtilities
	self.utils = TestUtilities.new(slot2)

	return 
end
TestManager.update = function (self, t, dt)
	slot5 = active_tests

	for test, value in pairs(slot4) do
		slot12 = dt

		active_tests[test].update(slot9, active_tests[test], t)
	end

	return 
end
TestManager.toggleTest = function (self, test_name)
	if tests[test_name] then
		if active_tests[test_name] then
			active_tests[test_name].toggleTest()
		else
			slot5 = tests[test_name]
			active_tests[test_name] = tests[test_name].new(slot4)
		end
	end

	return 
end

return 
