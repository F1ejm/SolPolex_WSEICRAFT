extends Node

var Is_Playing: bool

var Player: CharacterBody3D

func _ready():
	Is_Playing = true

func _process(delta):
	
	if Is_Playing == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	if Is_Playing == false:
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func Resume():
	get_tree().paused = false
	
