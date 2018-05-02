slot3 = "CoreSmoketestReporter"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

Reporter = Reporter or CoreClass.class()
Reporter.init = function (self)
	return 
end
Reporter.begin_substep = function (self, name)
	slot5 = "[Smoketest] begin_substep " .. name

	cat_print(slot3, "spam")

	return 
end
Reporter.end_substep = function (self, name)
	slot5 = "[Smoketest] end_substep " .. name

	cat_print(slot3, "spam")

	return 
end
Reporter.fail_substep = function (self, name)
	slot5 = "[Smoketest] fail_substep " .. name

	cat_print(slot3, "spam")

	return 
end
Reporter.tests_done = function (self)
	slot4 = "[Smoketest] tests_done"

	cat_print(slot2, "spam")

	return 
end

return 
