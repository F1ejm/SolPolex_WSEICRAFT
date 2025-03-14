extends Control

@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar

func _process(delta: float) -> void:
	texture_progress_bar.max_value = GlobalWeaponTimer.caly_reload
	texture_progress_bar.value = GlobalWeaponTimer.reload
