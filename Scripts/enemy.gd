extends Area2D

signal got_killed

# Number of hits it takes for the enemy to die
@export var hit_points: int = 1

const move_speed: float = 40

var target_object

@onready var coin_template = preload("res://Scenes/Items/coin.tscn")
@onready var damage_flash: ColorRect = $AnimatedSprite2D/DamageFlash

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target_object == null:
		return
	
	var direction = target_object.global_position - global_position
	
	direction = direction.normalized()
	
	global_position += direction * move_speed * delta
	
func take_damage(amount: int):
	hit_points -= amount
	print("Ouch!")
	damage_flash.flash()
	
	if hit_points < 1:
		get_destroyed()

func get_destroyed():
	print("Enemy died")
	got_killed.emit()
	
	if randf() > 0.7 :
		var new_coin = coin_template.instantiate()
		new_coin.set_coin_value(1)
	
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.take_damage(1)
	print("Enemy dealt damage")
	get_destroyed()
