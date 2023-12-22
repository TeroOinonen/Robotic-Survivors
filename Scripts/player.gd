extends CharacterBody2D

signal hit_point_count_changed(hit_point_count)
signal game_over

signal gun_ammo_count_changed(ammo_count)
signal gun_reloading_gun
signal gun_finished_reloading

const move_speed: float = 50
var move_input: Vector2

@onready var gun_slot = %GunSlot
@onready var damage_flash: ColorRect = $AnimatedSprite2D/DamageFlash

## Money for buing ammo and upgrades
@export var money: int = 0
## Hitpoints available before death
@export var hit_points: int = 5

func _input(event: InputEvent) -> void:
	# Read player mouse clicks
	if event.is_action_pressed("attack"):
		print("Player Attacks!")
		$GunSlot/Gun.shoot();
	
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
	hit_point_count_changed.emit(hit_points)

	if hit_points < 1:
		get_destroyed()
	else:
		damage_flash.flash()


func get_destroyed():
	print("Player died, game over")
	game_over.emit()

func _on_collect_area_body_entered(body: Node2D) -> void:
	body.get_collected()
	
func add_coin(value):
	money += value

func _on_gun_ammo_count_changed(ammo_count: Variant) -> void:
	gun_ammo_count_changed.emit(ammo_count)

func _on_gun_finished_reloading() -> void:
	gun_finished_reloading.emit()

func _on_gun_reloading_gun() -> void:
	gun_reloading_gun.emit()
