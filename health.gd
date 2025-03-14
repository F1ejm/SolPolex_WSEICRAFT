extends Control

@onready var progress_bar: ProgressBar = $ProgressBar

func _process(delta: float) -> void:
	progress_bar.max_value = 100
	progress_bar.value = GlobalWeaponTimer.Życie
