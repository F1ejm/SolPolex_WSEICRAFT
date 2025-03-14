extends Node

var reload: float = 3
var caly_reload: float = 3
var start_reload: bool = false

func _process(delta: float):
	if start_reload == true:
		reload = reload - delta
	if reload <= 0:
		start_reload = false
	if start_reload == false:
		reload = 0
