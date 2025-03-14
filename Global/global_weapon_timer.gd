extends Node

var reload: float = 3
var caly_reload: float = 3
var start_reload: bool = false

var current_weapon: int = 1
# Obecna broń
# 1 - Shotgun
# 2 - LKM

func _process(delta: float):
	if start_reload == true:
		reload = reload - delta
	if reload <= 0:
		start_reload = false
	if start_reload == false:
		reload = 0
