extends Control

@onready var runda_licznik: Label = $Runda_Licznik
@onready var czas_rundy: Label = $Czas_Rundy

func _process(delta: float) -> void:
	runda_licznik.text = str(SpawnerGlobal.runda) + " runda"
	var x = int(SpawnerGlobal.czas_rundy)
	czas_rundy.text = str(x) + " s"
