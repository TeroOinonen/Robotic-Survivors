extends Node2D

var goto_target
var coin_speed: float = 80
var coin_value: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if goto_target != null:
		var move_dir: Vector2 = goto_target.position - position
		position +=  move_dir.normalized() * coin_speed * delta

func get_collected(target):
	goto_target = target


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.add_coin(coin_value)
