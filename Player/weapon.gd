extends Node3D

var shotgun_path = preload("res://Player/shotgun.tscn")
var LKM_path = preload("res://Player/lkm.tscn")

@export var weapon: Node3D

var change_weapon: bool = false

var start_timer:bool = false
var timer: float = 0.6

func _process(delta: float) -> void:
	
	if start_timer == true:
		timer -= delta
		
	if timer <= 0:
		timer = 0.6
		start_timer = false
		GlobalWeaponTimer.timer = true
	
	if Input.is_action_just_pressed("bron_1"):
		change_weapon = true
		start_timer = true
		GlobalWeaponTimer.current_weapon = 1
		
	if Input.is_action_just_pressed("bron_2"):
		change_weapon = true
		GlobalWeaponTimer.current_weapon = 2
	
	
	if change_weapon == true:
		if weapon != null:
			weapon.queue_free()
		
		if GlobalWeaponTimer.current_weapon == 1:
			var shotgun = shotgun_path.instantiate()
			add_child(shotgun)
			shotgun.global_position = global_position
			weapon = shotgun
			
		
		if GlobalWeaponTimer.current_weapon == 2:
			var LKM = LKM_path.instantiate()
			add_child(LKM)
			LKM.global_position = global_position
			weapon = LKM
		
		change_weapon = false
