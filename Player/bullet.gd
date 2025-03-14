extends CharacterBody3D

var obrazenia
var speed

var timer: float = 0.1
var start_timer: bool = false

var rotate:bool = true

var dire

func _process(delta: float) -> void:
	
	if start_timer == true:
		timer -= delta
	if timer <= 0:
		queue_free()
		
	position += transform.basis * Vector3(0,0,-speed) * delta 
	rotation = dire
	
	move_and_slide()


func _on_timer_timeout() -> void:
	queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Odbijajace"):
		body.velocity = -(body.velocity)
		
	if body.is_in_group("Enemy"):
		body.queue_free()
	else:
		queue_free()
