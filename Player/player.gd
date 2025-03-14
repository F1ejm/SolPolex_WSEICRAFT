extends CharacterBody3D

# weapon
@onready var weapon: Node3D = $weapon

#Srodek Gracza
@onready var srodek: Node3D = $Srodek


# looking
@onready var neck: Node3D = $neck
@onready var head: Node3D = $neck/head
@onready var camera_3d: Camera3D = $neck/head/Camera3D
const mouse_sens = 0.2

# speeds
@export var walk_speed = 5.0
@export var sprint_speed = 8.0
@export var crouch_speed = 3.0
@export var jump_force = 6.0
var current_speed = 5.0

# movement
var slide_timer = 0.0
var slide_timer_max = 1.0
var slide_vector = Vector2.ZERO
var slide_speed = 10.0

const crouch_depth = -0.5

var free_look_tilt_amount = 8

var double_jump_controller: int = 1

# wallrun
@onready var ray_cast_lewo: RayCast3D = $neck/head/RayCast_lewo
@onready var ray_cast_prawo: RayCast3D = $neck/head/RayCast_prawo

#states
var walking: bool = true
var sprinting: bool = false
var crouching: bool = false
var sliding: bool = false
var freelooking: bool = false
var wallrunning: bool = false


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if freelooking:
			neck.rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
		else:
			rotate_y(deg_to_rad(-event.relative.x * mouse_sens))
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_sens))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))
	
func _physics_process(delta: float) -> void:
	AaGlobal.Player = self
	# getting movement input
	var input_dir := Input.get_vector("walk_left", "walk_right", "walk_forward", "walk_backwards")
	
	if not is_on_floor() and not wallrunning:
		if velocity.y >= 0:
			velocity += get_gravity() * delta * 2
		else:
			velocity += get_gravity() * delta * 4

	if is_on_floor() or is_on_wall():
		double_jump_controller = 1
	


	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_force
			sliding = false
		if not is_on_floor() and double_jump_controller == 1:
			double_jump_controller = 0
			velocity.y = jump_force
			sliding = false


# handle crouch
	if Input.is_action_pressed("crouch") or sliding:
		current_speed = crouch_speed
		
		head.position.y = move_toward(head.position.y, crouch_depth, delta * 3)
		$normal_collision.disabled = true
		$crouching_collision.disabled = false
		
		# start sliding
		if sprinting and input_dir != Vector2.ZERO:
			sliding = true
			slide_timer = slide_timer_max
			slide_vector = input_dir
		
		crouching = true
		walking = false
		sprinting = false
		
	# stay crouched if under object
	elif !$RayCast3D.is_colliding():
		$normal_collision.disabled = false
		$crouching_collision.disabled = true
		head.position.y = move_toward(head.position.y, 0.0, delta * 3)
		
		#handle sprint
		if Input.is_action_pressed("sprint"):
			current_speed = sprint_speed
			
			camera_3d.fov = move_toward(camera_3d.fov, 100, delta * 150)
			
			crouching = false
			walking = false
			sprinting = true
		
		else:
			camera_3d.fov = move_toward(camera_3d.fov, 75, delta * 150)
			
			current_speed = walk_speed
			crouching = false
			walking = true
			sprinting = false
			
	#Handle free looking || FREELOOK KURWO
	if sliding == true: 
		freelooking = true
		if not wallrunning:
			camera_3d.rotation.z = move_toward(camera_3d.rotation.z, -deg_to_rad(7.0), delta)
	else:
		freelooking = false
		neck.rotation.y = move_toward(neck.rotation.y, 0.0, delta * 10)
		if not wallrunning:
			camera_3d.rotation.z = move_toward(camera_3d.rotation.z,0.0, delta)
	
	
	# handle sliding
	
	if sliding:
		slide_timer -= delta
		if slide_timer <= 0:
			sliding = false
			freelooking = false

	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if sliding:
		direction = (transform.basis * Vector3(slide_vector.x, 0, slide_vector.y)).normalized()
	
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
		
		if sliding:
			velocity.x = direction.x * (slide_timer + 0.2) * slide_speed
			velocity.z = direction.z * (slide_timer + 0.2) * slide_speed
			
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)

	wall_run(delta)

	move_and_slide()

func wall_run(delta):
	if sprinting and is_on_wall() and not is_on_floor():
		wallrunning = true
		velocity += get_gravity() * delta / 3
		
		if ray_cast_lewo.is_colliding():
			camera_3d.rotation.z = move_toward(camera_3d.rotation.z, -deg_to_rad(15.0), delta * 2)
		elif ray_cast_prawo.is_colliding():
			camera_3d.rotation.z = move_toward(camera_3d.rotation.z, -deg_to_rad(-15.0), delta * 2)
	else:
		wallrunning = false
		
