extends Node3D

var anim = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("strzał"):
		$AnimationPlayer.play("Cylinder_003Action")
		$"../Timer".start()
#		$AnimationPlayer.play("Cylinder_003Action")


func _on_timer_timeout() -> void:
	$AnimationPlayer.play("Cylinder_003Action")
