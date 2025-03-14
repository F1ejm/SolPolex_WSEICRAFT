extends Node

var runda = 0
var czas_rundy: float = 120
var round_playing: bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("new_round") and round_playing == false and AaGlobal.Is_Playing == true:
		runda += 1
		round_playing = true
	if round_playing == true and AaGlobal.Is_Playing == true:
		czas_rundy -= delta
