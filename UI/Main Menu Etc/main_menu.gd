extends Control

@export var settings: Control


func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	visible = true
	process_mode = Node.PROCESS_MODE_ALWAYS
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_play_pressed():
	visible = false
	AaGlobal.Is_Playing = true
	AaGlobal.Resume()


func _on_settings_pressed():
	visible = false
	settings.visible = true

func _on_quit_pressed():
	get_tree().quit()



func _on_button_pressed() -> void:
	$Control.visible = true
