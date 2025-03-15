extends Control

@onready var runda_licznik: Label = $Runda_Licznik
@onready var czas_rundy: Label = $Czas_Rundy

func _process(delta: float) -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	if AaGlobal.Is_Playing == true:
		visible = true
	else:
		visible = false
	
	runda_licznik.text = str(SpawnerGlobal.runda) + " runda"
	var x = int(SpawnerGlobal.czas_rundy)
	czas_rundy.text = str(x) + " s"
	
	$Runda_Licznik2.text = "score " + str(GlobalWeaponTimer.score)
