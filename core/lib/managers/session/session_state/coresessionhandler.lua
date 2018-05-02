slot3 = "CoreSessionHandler"

core.module(slot1, core)

Session = Session or class()
Session.joined_session = function (self)
	slot4 = "Joined Session!"

	cat_print(slot2, "debug")

	return 
end
Session.session_ended = function (self)
	slot4 = "Session Ended"

	cat_print(slot2, "debug")

	return 
end
Session.session_started = function (self)
	slot4 = "Session Started!"

	cat_print(slot2, "debug")

	return 
end

return 
