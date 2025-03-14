extends Node3D

@export var gun_stats: Gun

var szybkosc_strzalu
var speed
var magazynek
var szybkosc_przeladowania
var obrazenia



func _ready() -> void:
	szybkosc_strzalu = gun_stats.szybkosc_strzalu
	speed = gun_stats.szybkosc_lotu
	magazynek = gun_stats.wielkosc_magazynku
	szybkosc_przeladowania = gun_stats.szybkosc_przeladowania
	obrazenia = gun_stats.obrazenia

var przegrzanie:bool = false

func _process(delta: float) -> void:
	szybkosc_strzalu -= delta

	$CSGBox3D/Miejsce_Spawnu_Pocisku.rotation = rotation
	
	if GlobalWeaponTimer.amunicja_lkm >= 30:
		przegrzanie = true
	if GlobalWeaponTimer.amunicja_lkm <= 15:
		przegrzanie = false
	
	if Input.is_action_pressed("strzał") and szybkosc_strzalu <= 0 and przegrzanie == false:
		# Animacja Strzalu To do
		GlobalWeaponTimer.timer = false
		GlobalWeaponTimer.ladowac_lkm = false
		GlobalWeaponTimer.timer_ladowanie = 0.3
		szybkosc_strzalu = gun_stats.szybkosc_strzalu
		GlobalWeaponTimer.amunicja_lkm += 1
		Shot(delta)
		
	if not Input.is_action_pressed("strzał") and szybkosc_strzalu <= 0 :
		GlobalWeaponTimer.timer = true
		
		
var bullet_path = load("res://Player/bullet.tscn")

@onready var miejsce_spawnu_pocisku: Node3D = $CSGBox3D/Miejsce_Spawnu_Pocisku


func Shot(delta):
	#Odrzut 
	if not AaGlobal.Player.is_on_floor():
		var dystans = miejsce_spawnu_pocisku.global_position - AaGlobal.Player.srodek.global_position
		print(dystans)
		AaGlobal.Player.velocity += -(dystans) * 3
	
	if AaGlobal.Player.is_on_floor():
		var dystans = miejsce_spawnu_pocisku.global_position - AaGlobal.Player.srodek.global_position
		print(dystans)
		AaGlobal.Player.velocity += Vector3(-dystans.x * 8, - dystans.y, - dystans.z * 8)

	var bullet = bullet_path.instantiate()
	get_tree().current_scene.add_child(bullet) 
	bullet.dire = global_rotation
	bullet.global_position = miejsce_spawnu_pocisku.global_position
	bullet.global_transform.basis = miejsce_spawnu_pocisku.global_transform.basis
	bullet.obrazenia = obrazenia
	bullet.speed = speed
