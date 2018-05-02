slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementExplosionDamage then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementExplosionDamage = slot0
ElementExplosionDamage.init = function (self, ...)
	slot3 = self

	ElementExplosionDamage.super.init(slot2, ...)

	return 
end
ElementExplosionDamage.client_on_executed = function (self, ...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
ElementExplosionDamage.on_executed = function (self, instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = managers.player
	local player = managers.player.player_unit(slot3)

	if player then
		slot5 = player
		slot6 = {
			position = self._values.position,
			range = self._values.range,
			damage = self._values.damage
		}

		player.character_damage(slot4).damage_explosion(slot4, player.character_damage(slot4))
	end

	slot6 = instigator

	ElementExplosionDamage.super.on_executed(slot4, self)

	return 
end

return 
