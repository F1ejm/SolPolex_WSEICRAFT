extends Control

@export var main_menu: Control


func _ready():
	visible = false


func _on_music_audio_value_changed(value):
	pass # Replace with function body.


func _on_main_menu_pressed():
	visible = false
	main_menu.visible = true


func _on_sfx_audio_value_changed(value: float) -> void:
	pass # Replace with function body.


func _on_mute_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.
