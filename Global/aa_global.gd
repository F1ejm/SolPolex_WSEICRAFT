extends Node

var Is_Playing: bool

var Player: CharacterBody3D

@onready var reload: Control = $CanvasLayer/Reload
@onready var runda_control: Control = $CanvasLayer/Runda_Control


func _ready():
	Is_Playing = false

func _process(delta):
	
	if Is_Playing == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		Input.action_press("bron_1")

	if Is_Playing == false:
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func Resume():
	get_tree().paused = false
	
