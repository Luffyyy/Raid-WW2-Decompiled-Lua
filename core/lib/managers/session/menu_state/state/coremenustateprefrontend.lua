slot3 = "CoreMenuStatePreFrontEnd"

core.module(slot1, core)

slot3 = "CoreMenuStateFrontEnd"

core.import(slot1, core)

slot3 = "CoreMenuStateStart"

core.import(slot1, core)

slot3 = "CoreFiniteStateMachine"

core.import(slot1, core)

PreFrontEnd = PreFrontEnd or class()
PreFrontEnd.init = function (self)
	slot6 = self
	self._state = CoreFiniteStateMachine.FiniteStateMachine.new(slot2, CoreFiniteStateMachine.FiniteStateMachine, CoreMenuStateStart.Start, "pre_front_end")

	return 
end
PreFrontEnd.destroy = function (self)
	slot3 = self._state

	self._state.destroy(slot2)

	return 
end
PreFrontEnd.transition = function (self)
	self._state.transition(slot2)

	local state = self.menu_state._game_state
	slot4 = state

	if not state.is_in_pre_front_end(self._state) then
		return CoreMenuStateFrontEnd.FrontEnd
	end

	return 
end

return 
