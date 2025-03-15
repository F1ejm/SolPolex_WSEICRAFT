extends Control

@export var main_menu: Control

func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if GlobalWeaponTimer.death_screen == true:
		GlobalWeaponTimer.death_screen = false
		visible = true




func _on_quit_pressed() -> void:
	get_tree().quit()
