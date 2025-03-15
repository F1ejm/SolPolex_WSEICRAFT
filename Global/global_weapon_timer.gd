extends Node

var reload: float = 3
var caly_reload: float = 3
var start_reload: bool = false

var current_weapon: int = 1
# Obecna broń
# 1 - Shotgun
# 2 - LKM

var amunicja_lkm: float = 0

var ladowac_lkm: bool = true
var timer_ladowanie: float = 0.6
var timer: bool = false

var Życie: int = 100
var death_screen: bool = false

var score: int = 0

func _process(delta: float):
	if Życie <= 0:
		AaGlobal.Is_Playing = false
		death_screen = true
	
	if start_reload == true:
		reload = reload - delta
	if reload <= 0:
		start_reload = false
	if start_reload == false:
		reload = 0
		
	if timer == true:
		timer_ladowanie -= delta 
	
	if timer_ladowanie <= 0:
		ladowac_lkm = true
	
	if ladowac_lkm == true and amunicja_lkm >= 0:
		amunicja_lkm -= delta * 5
