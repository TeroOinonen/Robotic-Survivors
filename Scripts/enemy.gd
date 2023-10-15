extends Area2D

const move_speed: float = 40

var target_location: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = target_location - global_position
	
	direction = direction.normalized()
	
	global_position += direction * move_speed * delta
	
