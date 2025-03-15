extends Node3D

var hp = 100
var can_colide = true

@export var ray_down : RayCast3D
@export var ray_1 : RayCast3D
@export var ray_2 : RayCast3D
@export var ray_3 : RayCast3D
@export var ray_4 : RayCast3D



func _process(delta: float) -> void:
	if ray_1.is_colliding() == true:
		if can_colide == true:
			can_colide = false
			$Timer.start()
			print("ads")
	else:
		pass
	if ray_2.is_colliding() == true:
		if can_colide == true:
			can_colide = false
			$Timer.start()
			print("ads")
	else:
		pass
	if ray_3.is_colliding() == true:
		if can_colide == true:
			can_colide = false
			$Timer.start()
			print("ads")
	else:
		pass
	if ray_4.is_colliding() == true:
		if can_colide == true:
			can_colide = false
			$Timer.start()
			print("ads")
	else:
		pass

func _on_timer_timeout() -> void:
	can_colide = true
