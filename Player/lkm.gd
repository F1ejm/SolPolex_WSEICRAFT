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
	
	$CSGBox3D/Miejsce_Spawnu_Pocisku.rotation = rotation
	
	if Input.is_action_pressed("strzał") and szybkosc_strzalu <= 0:
		# Animacja Strzalu To do
		szybkosc_strzalu = gun_stats.szybkosc_strzalu
		print(szybkosc_strzalu)
		Shot()

		
var bullet_path = load("res://Player/bullet.tscn")

@onready var miejsce_spawnu_pocisku: Node3D = $CSGBox3D/Miejsce_Spawnu_Pocisku


func Shot():
	
	var bullet = bullet_path.instantiate()
	get_tree().current_scene.add_child(bullet) 
	bullet.dire = global_rotation
	bullet.global_position = miejsce_spawnu_pocisku.global_position
	bullet.global_transform.basis = miejsce_spawnu_pocisku.global_transform.basis
	bullet.obrazenia = obrazenia
	bullet.speed = speed
