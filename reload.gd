extends Control

@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar
@onready var texture_progress_bar_2: TextureProgressBar = $TextureProgressBar2
@onready var texture_rect: TextureRect = $TextureRect

@export var shotgun : Texture2D
@export var LKM : Texture2D

func _process(delta: float) -> void:
	texture_progress_bar.max_value = GlobalWeaponTimer.caly_reload
	texture_progress_bar.value = GlobalWeaponTimer.reload
	
	texture_progress_bar_2.max_value = 30
	texture_progress_bar_2.value = GlobalWeaponTimer.amunicja_lkm
	
	if GlobalWeaponTimer.current_weapon == 1:
		texture_rect.texture = shotgun
	if GlobalWeaponTimer.current_weapon == 2:
		texture_rect.texture = LKM
