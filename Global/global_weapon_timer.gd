extends Node

var reload: int = 3
var caly_reload: int = 3
var start_reload: bool = false

func _process(delta: float):
	if start_reload == true:
		reload -= delta
	if reload <= 0:
		start_reload = false
