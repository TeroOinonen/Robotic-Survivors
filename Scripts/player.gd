extends CharacterBody2D

const move_speed: float = 50
var move_input: Vector2

@export var hit_points: int = 5

@onready var gun_slot = %GunSlot

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _input(event: InputEvent) -> void:
	# Read player mouse clicks
	if event.is_action_pressed("attack"):
		print("Player Attacks!")
	
	if event.is_action_pressed("interact"):
		print("Player Interacts!")

func _process(delta: float) -> void:
	# Get the movement direction vector
	move_input = Input.get_vector("left", "right", "up", "down")

	gun_slot.look_at(get_global_mouse_position()+get_local_mouse_position())

func _physics_process(delta: float) -> void:

	# Construct movement velocity from user input and player movement speed
	velocity = move_input * move_speed

	move_and_slide() # Uses delta automatically with the set velocity

func take_damage(amount: int):
	hit_points -= amount
	
	if hit_points < 1:
		get_destroyed()

func get_destroyed():
	print("Player died, game over")
	get_tree().reload_current_scene()
