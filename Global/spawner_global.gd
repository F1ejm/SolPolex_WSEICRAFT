extends Node

var runda = 0
var czas_rundy: float = 60
var round_playing: bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("new_round") and round_playing == false and AaGlobal.Is_Playing == true:
		runda += 1
		round_playing = true
	if round_playing == true and AaGlobal.Is_Playing == true:
		czas_rundy -= delta
	if czas_rundy <= 0:
		czas_rundy = 60
		round_playing = false
		GlobalWeaponTimer.Życie = 100
		var x = get_tree().get_nodes_in_group("Enemy")
		for i in range(len(x)):
			x[i].queue_free()
