extends Node3D


@export var ray_down : RayCast3D
@export var ray_1 : RayCast3D
@export var ray_2 : RayCast3D
@export var ray_3 : RayCast3D
@export var ray_4 : RayCast3D
@export var ray_5 : RayCast3D



func _process(delta: float) -> void: 
	print(ray_1.get_collider())
