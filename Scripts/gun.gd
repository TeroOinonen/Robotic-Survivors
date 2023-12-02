extends Node2D

## Delay for firing the gun
@export_range(0.1, 2.0) var fire_delay: float = 1.5

## Coefficient for affecting fire delay, lower for faster firing
@export_range(0.1, 2.0) var fire_coefficient: float = 1

# Preload the bullet scene that gun will fire
@onready var bullet = preload("res://Scenes/Items/bullet.tscn")

@onready var bullet_container = $BulletContainer
@onready var shot_sound: AudioStreamPlayer = $ShotSound

var next_shot_in: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	next_shot_in -= delta

func shoot():
	#Do not fire if delay is going on
	if (next_shot_in > 0):
		return

	print("bang") 
	# start delay between shots and reduce delay by coefficient
	next_shot_in = fire_delay * fire_coefficient
	new_bullet()

func new_bullet():
	var pew = bullet.instantiate()
	shot_sound.play()
	
	# Add as child, then set as top level
	bullet_container.add_child(pew)
	pew.top_level = true

	# After becoming top level, set the spawn position
	pew.global_position = global_position
	pew.global_rotation = global_rotation
