slot3 = "CoreCameraDataInterpreter"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

local mvector3_add = mvector3.add
local mvector3_sub = mvector3.subtract
local mvector3_mul = mvector3.multiply
local mvector3_copy = mvector3.copy
local mvector3_rotate_with = mvector3.rotate_with
local mrotation_slerp = mrotation.slerp
local mrotation_mul = mrotation.multiply
local mrotation_set_zero = mrotation.set_zero
CameraDataInterpreter = CameraDataInterpreter or CoreClass.class()
function CameraDataInterpreter:init(cud)
	if cud then
		self._position = cud._position
		self._rotation = cud._rotation
		self._pivot_position = cud._pivot_position
		self._pivot_rotation = cud._pivot_rotation
		self._fov = cud._fov
		self._dof_amount = cud._dof_amount
		self._dof_near_min = cud._dof_near_min
		self._dof_near_max = cud._dof_near_max
		self._dof_far_min = cud._dof_far_min
		self._dof_far_max = cud._dof_far_max
	else
		slot6 = 0
		self._position = Vector3(slot3, 0, 0)
		self._rotation = Rotation()
		self._pivot_position = nil
		self._pivot_rotation = nil
		self._fov = 0
		self._dof_amount = 0
		self._dof_near_min = 0
		self._dof_near_max = 0
		self._dof_far_min = 0
		self._dof_far_max = 0
	end

	return 
end
function CameraDataInterpreter:reset()
	slot5 = 0
	self._position = Vector3(slot2, 0, 0)
	self._rotation = Rotation()
	self._pivot_position = nil
	self._pivot_rotation = nil
	self._fov = 0
	self._dof_amount = 0
	self._dof_near_min = 0
	self._dof_near_max = 0
	self._dof_far_min = 0
	self._dof_far_max = 0

	return 
end
function CameraDataInterpreter:position()
	return self._position
end
function CameraDataInterpreter:set_position(position)
	self._position = position

	return 
end
function CameraDataInterpreter:rotation()
	return self._rotation
end
function CameraDataInterpreter:set_rotation(rotation)
	self._rotation = rotation

	return 
end
function CameraDataInterpreter:set_pivot_position(position)
	self._pivot_position = position

	return 
end
function CameraDataInterpreter:set_pivot_rotation(rotation)
	self._pivot_rotation = rotation

	return 
end
function CameraDataInterpreter:fov()
	return self._fov
end
function CameraDataInterpreter:set_fov(fov)
	self._fov = fov

	return 
end
function CameraDataInterpreter:dof()
	return {
		amount = self._dof_amount,
		near_min = self._dof_near_min,
		near_max = self._dof_near_max,
		far_min = self._dof_far_min,
		far_max = self._dof_far_max
	}
end
function CameraDataInterpreter:set_dof(amount, near_min, near_max, far_min, far_max)
	self._dof_amount = amount
	self._dof_near_min = near_min
	self._dof_near_max = near_max
	self._dof_far_min = far_min
	self._dof_far_max = far_max

	return 
end
function CameraDataInterpreter:transform_with(cud)
	if cud._pivot_position then
		slot6 = self._rotation
		self._position = self._position + cud._pivot_position.rotate_with(slot4, cud._pivot_position)
	end

	if cud._pivot_rotation then
		self._rotation = self._rotation * cud._pivot_rotation
	end

	slot6 = self._rotation
	self._position = self._position + cud._position.rotate_with(slot4, cud._position)
	self._rotation = self._rotation * cud._rotation
	self._fov = self._fov + cud._fov
	self._dof_amount = self._dof_amount + cud._dof_amount
	self._dof_near_min = self._dof_near_min + cud._dof_near_min
	self._dof_near_max = self._dof_near_max + cud._dof_near_max
	self._dof_far_min = self._dof_far_min + cud._dof_far_min
	self._dof_far_max = self._dof_far_max + cud._dof_far_max

	return 
end
function CameraDataInterpreter:interpolate_to_target(cud_target, fraction)
	local position = self._position
	slot6 = cud_target._position
	self._position = mvector3_copy(slot5)
	slot7 = position

	mvector3_sub(slot5, self._position)

	slot7 = fraction

	mvector3_mul(slot5, self._position)

	slot7 = position

	mvector3_add(slot5, self._position)

	local rotation = Rotation()
	slot10 = fraction

	mrotation_slerp(self._position, rotation, self._rotation, cud_target._rotation)

	self._rotation = rotation
	self._fov = self._fov + (cud_target._fov - self._fov) * fraction
	self._dof_amount = self._dof_amount + (cud_target._dof_amount - self._dof_amount) * fraction
	self._dof_near_min = self._dof_near_min + (cud_target._dof_near_min - self._dof_near_min) * fraction
	self._dof_near_max = self._dof_near_max + (cud_target._dof_near_max - self._dof_near_max) * fraction
	self._dof_far_min = self._dof_far_min + (cud_target._dof_far_min - self._dof_far_min) * fraction
	self._dof_far_max = self._dof_far_max + (cud_target._dof_far_max - self._dof_far_max) * fraction

	return 
end

return 
