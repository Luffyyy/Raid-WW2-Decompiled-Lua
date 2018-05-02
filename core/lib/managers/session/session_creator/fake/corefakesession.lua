slot3 = "CoreFakeSession"

core.module(slot1, core)

slot3 = "CoreSession"

core.import(slot1, core)

Session = Session or class()
Session.init = function (self)
	return 
end
Session.delete_session = function (self)
	slot4 = "FakeSession: delete_session"

	cat_print(slot2, "debug")

	return 
end
Session.start_session = function (self)
	slot4 = "FakeSession: start_session"

	cat_print(slot2, "debug")

	return 
end
Session.end_session = function (self)
	slot4 = "FakeSession: end_session"

	cat_print(slot2, "debug")

	return 
end
Session.join_local_user = function (self, local_user)
	slot8 = local_user
	slot5 = "FakeSession: Local user:'" .. local_user.gamer_name(slot7) .. "' joined!"

	cat_print(slot3, "debug")

	return 
end
Session.join_remote_user = function (self, remote_user)
	slot8 = remote_user
	slot5 = "FakeSession: Remote user:'" .. remote_user.gamer_name(slot7) .. "' joined!"

	cat_print(slot3, "debug")

	return 
end

return 
