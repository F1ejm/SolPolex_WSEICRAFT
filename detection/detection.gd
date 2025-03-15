extends Node3D

var hp = 100
var can_colide = true

@export var ray_down : RayCast3D
@export var ray_1 : RayCast3D
@export var ray_2 : RayCast3D
@export var ray_3 : RayCast3D
@export var ray_4 : RayCast3D

var start_timer = false
var timer: float = 0


func _process(delta: float) -> void:
	if start_timer == true:
		timer += delta
	if timer >= 0.5:
		$"..".queue_free()
	
	if get_parent().velocity.x > 4 or get_parent().velocity.y > 4 or get_parent().velocity.z > 4:
	
		if ray_1.is_colliding() == true:
			if can_colide == true:
				can_colide = false
				$Timer.start()
				hp-=40
				if hp <= 0 :
					$"../AudioStreamPlayer3D".play()
					$"../Srodek/CPUParticles3D2".emitting = true
					start_timer = true
					GlobalWeaponTimer.score += randi_range(1,3)
					
		else:
			pass
		if ray_2.is_colliding() == true:
			if can_colide == true:
				can_colide = false
				$Timer.start()
				hp-=40
				if hp <= 0 :
					$"../AudioStreamPlayer3D".play()
					$"../Srodek/CPUParticles3D2".emitting = true
					start_timer = true
					GlobalWeaponTimer.score += randi_range(1,3)
		else:
			pass
		if ray_3.is_colliding() == true:
			if can_colide == true:
				can_colide = false
				$Timer.start()
				hp-=40
				if hp <= 0 :
					$"../AudioStreamPlayer3D".play()
					$"../Srodek/CPUParticles3D2".emitting = true
					start_timer = true
					GlobalWeaponTimer.score += randi_range(1,3)
		else:
			pass
		if ray_4.is_colliding() == true:
			if can_colide == true:
				can_colide = false
				$Timer.start()
				hp-=40
				if hp <= 0 :
					$"../AudioStreamPlayer3D".play()
					$"../Srodek/CPUParticles3D2".emitting = true
					start_timer = true
					GlobalWeaponTimer.score += randi_range(1,3)
					
		else:
			pass

func _on_timer_timeout() -> void:
	can_colide = true
