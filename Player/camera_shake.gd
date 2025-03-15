extends Camera3D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("strzał"):
		if GlobalWeaponTimer.current_weapon == 1:
			camera_shake(0.3, 0.3)
		elif GlobalWeaponTimer.current_weapon == 2:
			camera_shake(0.1, 0.1)


func camera_shake(magnitude, period):
	var initial_transform = self.transform 
	var elapsed_time = 0.0

	while elapsed_time < period:
		var offset = Vector3(
			randf_range(-magnitude, magnitude),
			randf_range(-magnitude, magnitude),
			0.0
		)

		self.transform.origin = initial_transform.origin + offset
		elapsed_time += get_process_delta_time()
		await get_tree().process_frame

	self.transform = initial_transform
