extends Area2D

# Number of hits it takes for the enemy to die
@export var hit_points: int = 1

const move_speed: float = 40

var target_location: Vector2

@onready var coin_template = preload("res://Scenes/Items/coin.tscn")
@onready var death_sound: AudioStreamPlayer = $DeathSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = target_location - global_position
	
	direction = direction.normalized()
	
	global_position += direction * move_speed * delta
	
func take_damage(amount: int):
	hit_points -= amount
	print("Ouch!")
	
	if hit_points < 1:
		get_destroyed()

func get_destroyed():
	print("Enemy died")
	death_sound.play()
	
	if randf() > 0.7 :
		var new_coin = coin_template.instantiate()
		new_coin.set_coin_value(1)
	
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.take_damage(1)
	print("Enemy dealt damage")
