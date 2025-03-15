extends CharacterBody3D

var obrazenia
var speed

var timer: float = 0.1
var start_timer: bool = false

@onready var area_3d: Area3D = $Area3D

var rotate:bool = true

var dire

var odrzut


func _physics_process(delta: float) -> void:

	
	if start_timer == true:
		timer -= delta
	if timer <= 0:
		queue_free()
		
	position += transform.basis * Vector3(0,0,-speed) * delta 
	rotation = dire
	
	move_and_slide()


func _on_timer_timeout() -> void:
	queue_free()


func _on_area_3d_area_entered(area: Area3D) -> void:

	if area.get_parent().is_in_group("Enemy"):
#		var dystans = position - area.get_parent().srodek.position
#		area.get_parent().velocity = dystans * 7 * Vector3(-1.2,1,1)
		area.get_parent().test(transform.basis * Vector3(0,0,-speed) * odrzut)
		queue_free()
		
