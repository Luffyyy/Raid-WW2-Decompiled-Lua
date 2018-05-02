slot3 = "CoreSessionStateQuitSession"

core.module(slot1, core)

slot3 = "CoreSessionStateInit"

core.import(slot1, core)

QuitSession = QuitSession or class()
QuitSession.init = function (self, session)
	self._session = session
	slot4 = self.session_state._quit_session_requester

	self.session_state._quit_session_requester.task_started(slot3)

	slot4 = self.session_state
	slot4 = self.session_state.player_slots(slot3)

	self.session_state.player_slots(slot3).clear_session(slot3)

	slot4 = self.session_state._game_state

	self.session_state._game_state.request_front_end(slot3)

	slot4 = self._session

	self._session.delete_session(slot3)

	return 
end
QuitSession.destroy = function (self)
	slot3 = self.session_state._quit_session_requester

	self.session_state._quit_session_requester.task_completed(slot2)

	self.session_state._session = nil

	return 
end
QuitSession.transition = function (self)
	return CoreSessionStateInit.Init, self._session
end

return 
