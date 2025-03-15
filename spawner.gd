extends Node3D

var x

var slime_path = preload("res://jiglly/Scene/sad/sjkafsdfjhavsddghf/slime.tscn")

var can_spawn: bool = true

func _ready() -> void:
	x = randf_range(5 / (SpawnerGlobal.runda + 1), 15/ (SpawnerGlobal.runda + 1))

func _process(delta: float) -> void:
	if SpawnerGlobal.round_playing == true and AaGlobal.Is_Playing == true:
		x -= delta
	if x <= 0 and can_spawn == true:
		var slime = slime_path.instantiate()
		add_child(slime)
		slime.global_position = global_position
		x = randf_range(5 / SpawnerGlobal.runda, 15/ SpawnerGlobal.runda)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		can_spawn = false


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		can_spawn = true
