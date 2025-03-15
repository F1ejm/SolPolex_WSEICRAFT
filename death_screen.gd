extends Control

@export var main_menu: Control

func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if GlobalWeaponTimer.death_screen == true:
		GlobalWeaponTimer.death_screen = false
		visible = true


func _on_retry_pressed() -> void:
	GlobalWeaponTimer.Życie = 100
	SpawnerGlobal.runda = 1
	SpawnerGlobal.round_playing = false
	AaGlobal.Is_Playing = true
	AaGlobal.Resume()
	get_tree().reload_current_scene()
	visible = false
	

func _on_main_menu_pressed() -> void:
	visible = false
	main_menu.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()
