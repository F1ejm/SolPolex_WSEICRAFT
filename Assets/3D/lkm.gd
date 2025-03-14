extends Node3D

var anim = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("strzał"):
		$AnimationPlayer.play("ArmatureAction")
#		$AnimationPlayer.play("Cylinder_003Action")
