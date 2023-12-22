extends Node2D

# Amount of damage the bullet deals to hit targets
var damage: int = 1
# How many enemies the bullet damage before getting destroyed
var pass_through: int = 0

# How many seconds the bullet will live if it does not hit anything
var bullet_age: float = 5

# Bullet travel speed
var bullet_speed: float = 120

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# destroy bullet if age exceeded or hit enough of targets
	if bullet_age < 0 || pass_through < 0:
		queue_free()
	
	# Move bullet forward
	global_position -= transform.y * bullet_speed * delta
	
	# Reduce bullet age
	bullet_age -= delta

func _on_area_2d_area_entered(area: Area2D) -> void:
	area.take_damage(damage)
	pass_through -= 1
