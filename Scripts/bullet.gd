extends Node2D

# Amount of damage the bullet deals to hit targets
var damage: int = 1
# How many enemies the bullet damage before getting destroyed
var pass_through: int = 0

# How many seconds the bullet will live if it does not hit anything
var bullet_age: float = 5

# Bullet travel speed
var bullet_speed: float = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Reduce bullet age and check if it needs to be destroyed
	bullet_age -= delta
	
	if bullet_age < 0 || pass_through < 0:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.TakeDamage(damage)
	pass_through -= 1
