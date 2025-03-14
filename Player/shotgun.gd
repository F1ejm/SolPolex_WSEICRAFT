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

func _process(delta: float) -> void:
	szybkosc_strzalu -= delta
	if Input.is_action_just_pressed("strzał") and szybkosc_strzalu <= 0 and magazynek > 0:
		# Animacja Strzalu To do
		szybkosc_strzalu = 1
		magazynek -= 1
		Shot()
		
	if Input.is_action_just_pressed("reload") and GlobalWeaponTimer.start_reload != true:
		# Animacja Przeładowania To do
		GlobalWeaponTimer.caly_reload = szybkosc_przeladowania
		GlobalWeaponTimer.reload = szybkosc_przeladowania
		GlobalWeaponTimer.start_reload
		
	if GlobalWeaponTimer.reload <= 0:
		magazynek = gun_stats.wielkosc_magazynku
		GlobalWeaponTimer.reload = szybkosc_przeladowania
		
var bullet_path = preload("res://Player/bullet.tscn")

func Shot():
	var bullet = bullet_path.instantiate()
	bullet.position = $CSGBox3D/Miejsce_Spawnu_Pocisku.position
	bullet.obrazenia = obrazenia
	bullet.velocity = speed
