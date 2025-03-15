extends Node3D

@export var gun_stats: Gun

var szybkosc_strzalu
var speed
var magazynek
var szybkosc_przeladowania
var obrazenia

@export var ilosc_pociskow: int = 20

func _ready() -> void:
	szybkosc_strzalu = gun_stats.szybkosc_strzalu
	speed = gun_stats.szybkosc_lotu
	magazynek = gun_stats.wielkosc_magazynku
	szybkosc_przeladowania = gun_stats.szybkosc_przeladowania
	obrazenia = gun_stats.obrazenia

func _process(delta: float) -> void:
	szybkosc_strzalu -= delta
	
	$CSGBox3D/Miejsce_Spawnu_Pocisku.rotation = rotation
	
	if Input.is_action_just_pressed("strzał") and GlobalWeaponTimer.start_reload != true :
		# Animacja Strzalu To do
		
		GlobalWeaponTimer.caly_reload = szybkosc_przeladowania
		GlobalWeaponTimer.reload = szybkosc_przeladowania
		GlobalWeaponTimer.start_reload = true
		Shot()
		
		
	if GlobalWeaponTimer.reload <= 0:
		magazynek = gun_stats.wielkosc_magazynku
		GlobalWeaponTimer.reload = 0
		
var bullet_path = load("res://Player/bullet.tscn")

@onready var miejsce_spawnu_pocisku: Node3D = $CSGBox3D/Miejsce_Spawnu_Pocisku


func Shot():
	# Odrzut
	if not AaGlobal.Player.is_on_floor():
		var dystans = miejsce_spawnu_pocisku.global_position - AaGlobal.Player.srodek.global_position
		AaGlobal.Player.velocity = Vector3(-dystans.x * 30, -dystans.y * 10, -dystans.z * 30)
	if AaGlobal.Player.is_on_floor():
		var dystans = miejsce_spawnu_pocisku.global_position - AaGlobal.Player.srodek.global_position
		AaGlobal.Player.velocity = Vector3(-dystans.x * 20, -dystans.y * 10, -dystans.z * 20)
	 
	
	var bullet = bullet_path.instantiate()
	get_tree().current_scene.add_child(bullet) 
	bullet.dire = get_parent().global_rotation
	bullet.global_position = miejsce_spawnu_pocisku.global_position
	bullet.global_transform.basis = miejsce_spawnu_pocisku.global_transform.basis
	bullet.obrazenia = obrazenia
	bullet.odrzut = 1
	bullet.speed = speed
	
	for i in range(ilosc_pociskow):
		var bullet2 = bullet_path.instantiate()
		get_tree().current_scene.add_child(bullet2) 
		bullet2.global_transform.basis = miejsce_spawnu_pocisku.global_transform.basis
		bullet2.dire = Vector3(randf_range(get_parent().global_rotation.x - 0.2, get_parent().global_rotation.x + 0.2),
		randf_range(get_parent().global_rotation.y - 0.2, get_parent().global_rotation.y + 0.2),
		randf_range(get_parent().global_rotation.z - 0.2, get_parent().global_rotation.z + 0.2))
		bullet2.global_position = miejsce_spawnu_pocisku.global_position
		bullet2.area_3d.monitoring = false
		bullet2.odrzut = 1
		bullet2.obrazenia = obrazenia
		bullet2.speed = speed
	
