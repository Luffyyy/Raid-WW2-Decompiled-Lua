if not GrenadeLauncherBase then
	slot2 = ProjectileWeaponBase
	slot0 = class(slot1)
end

GrenadeLauncherBase = slot0

if not GrenadeLauncherContinousReloadBase then
	slot2 = GrenadeLauncherBase
	slot0 = class(slot1)
end

GrenadeLauncherContinousReloadBase = slot0
GrenadeLauncherContinousReloadBase.init = function (self, ...)
	slot3 = self

	GrenadeLauncherContinousReloadBase.super.init(slot2, ...)

	self._use_shotgun_reload = true

	return 
end
GrenadeLauncherContinousReloadBase.shotgun_shell_data = function (self)
	return nil
end

return 
