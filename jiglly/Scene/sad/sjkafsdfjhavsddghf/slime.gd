extends CharacterBody3D

@export var MoveSpeed:float = 4.0
@onready var navigation_agent : NavigationAgent3D = $NavigationAgent3D
var player: CharacterBody3D = null

@onready var srodek: Node3D = $Srodek

var timer:float = 0.8
var start_timer: bool = false

func _ready() -> void:
	player = get_tree().get_nodes_in_group("player")[0]
	velocity = Vector3(1,0,1)

func _physics_process(delta: float) -> void:
	if start_timer == true:
		timer -= delta
		
	if timer <= 0:
		timer = 0.8
		Atak()
	if not is_on_floor():
		if velocity.y >= 0:
			velocity += get_gravity() * delta * 3
		else:
			velocity += get_gravity() * delta * 6
	
	navigation_agent.set_target_position(player.global_position)
	
	if navigation_agent.is_navigation_finished():
		return
	var next_position: Vector3 = navigation_agent.get_next_path_position()
	if abs(velocity.z) < abs(next_position.z * MoveSpeed) and abs(velocity.x) < abs(next_position.x * MoveSpeed):
		velocity = global_position.direction_to(next_position)  *  MoveSpeed

	move_and_slide()
	

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		start_timer = true
	
	
func Atak():
	GlobalWeaponTimer.Życie -= 10
	$CPUParticles3D.global_position = player.global_position
	$CPUParticles3D.emitting = true
	
func test (a):
	velocity=a


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		start_timer = false
		timer = 0.8
