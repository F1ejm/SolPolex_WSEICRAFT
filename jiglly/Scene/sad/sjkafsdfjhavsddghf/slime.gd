extends CharacterBody3D

@export var MoveSpeed:float = 4.0
@onready var navigation_agent : NavigationAgent3D = $NavigationAgent3D
var player: CharacterBody3D = null

func _ready() -> void:
	player = get_tree().get_nodes_in_group("player")[0]

func _physics_process(delta: float) -> void:
	navigation_agent.set_target_position(player.global_position)
	
	if navigation_agent.is_navigation_finished():
		return
	
	var next_position: Vector3 = navigation_agent.get_next_path_position()
	velocity = global_position.direction_to(next_position)  *  MoveSpeed
	
	move_and_slide()
