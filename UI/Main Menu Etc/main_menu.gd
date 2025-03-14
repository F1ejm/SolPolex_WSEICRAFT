extends Control

@export var settings: Control


func _ready():
	visible = false


func _on_play_pressed():
	visible = false
	AaGlobal.Is_Playing = true
	AaGlobal.Resume()


func _on_settings_pressed():
	visible = false
	settings.visible = true

func _on_quit_pressed():
	get_tree().quit()
