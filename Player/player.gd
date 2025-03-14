extends CharacterBody3D

@onready var head: Node3D = $head

@export var walk_speed = 5.0
@export var sprint_speed = 8.0
@export var crouch_speed = 3.0
@export var jump_force = 4.5
var current_speed = 5.0


const mouse_sens = 0.2

const crouch_depth = -0.5


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_sens))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))
	
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force

	if Input.is_action_pressed("crouch"):
		current_speed = crouch_speed
		head.position.y = move_toward(head.position.y, 1.8 + crouch_depth, delta * 3)
		$normal_collision.disabled = true
		$crouching_collision.disabled = false
	elif !$RayCast3D.is_colliding():
		$normal_collision.disabled = false
		$crouching_collision.disabled = true
		head.position.y = move_toward(head.position.y, 1.8, delta * 3)
		if Input.is_action_pressed("sprint"):
			current_speed = sprint_speed
		else:
			current_speed = walk_speed

	var input_dir := Input.get_vector("walk_left", "walk_right", "walk_forward", "walk_backwards")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)

	move_and_slide()
