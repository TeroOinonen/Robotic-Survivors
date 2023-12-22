extends Node2D

signal ammo_count_changed(ammo_count)
signal reloading_gun
signal finished_reloading

## Delay for firing the gun
@export_range(0.1, 2.0) var fire_delay: float = 0.3

## Coefficient for affecting fire delay, lower for faster firing
@export_range(0.1, 2.0) var fire_coefficient: float = 1

# Preload the bullet scene that gun will fire
@onready var bullet = preload("res://Scenes/Items/bullet.tscn")

@onready var bullet_container = $BulletContainer
@onready var shot_sound: AudioStreamPlayer = $ShotSound

const ammo_count_max : int = 6
@onready var ammo_count: int = ammo_count_max
var next_shot_in: float = 0

var is_reloading: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	next_shot_in -= delta

func shoot():
	#Do not fire if delay is going on
	if (next_shot_in > 0 || is_reloading):
		return

	if ammo_count > 0:
		print("bang")
		# start delay between shots and reduce delay by coefficient
		next_shot_in = fire_delay * fire_coefficient
		change_ammo_count(-1)
		new_bullet()
		
	if ammo_count < 1:
		reload_gun()

func change_ammo_count(change: int) -> void:
	ammo_count += change
	ammo_count_changed.emit(ammo_count)

func new_bullet():
	var pew = bullet.instantiate()
	shot_sound.play()
	
	# Add as child, then set as top level
	bullet_container.add_child(pew)
	pew.top_level = true

	# After becoming top level, set the spawn position
	pew.global_position = global_position
	pew.global_rotation = global_rotation

func reload_gun() -> void:
	is_reloading = true
	reloading_gun.emit()
	await get_tree().create_timer(2).timeout
	change_ammo_count(ammo_count_max)
	is_reloading = false
	finished_reloading.emit()
	print("Reloaded!")
