extends CharacterBody2D

const move_speed: float = 50
var move_input: Vector2

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


func _physics_process(delta: float) -> void:

	# Construct movement velocity from user input and player movement speed
	velocity = move_input * move_speed

	move_and_slide() # Uses delta automatically with the set velocity
