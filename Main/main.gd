extends Node3D

@onready var reload: Control = $CanvasLayer/Reload
@onready var runda_control: Control = $CanvasLayer/Runda_Control


func _process(delta: float) -> void:
	if AaGlobal.Is_Playing == true:
		reload.visible = true
		runda_control.visible = true
		
	if AaGlobal.Is_Playing == false:
		reload.visible = false
		runda_control.visible = false
