extends Control

@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar
@onready var texture_progress_bar_2: TextureProgressBar = $TextureProgressBar2

func _process(delta: float) -> void:
	texture_progress_bar.max_value = GlobalWeaponTimer.caly_reload
	texture_progress_bar.value = GlobalWeaponTimer.reload
	
	texture_progress_bar_2.max_value = 100
