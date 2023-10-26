extends Node2D

## Delay for firing the gun
@export_range(0.1, 2.0) var fire_delay: float = 1.5

## Coefficient for affecting fire delay, lower for faster firing
@export_range(0.1, 2.0) var fire_coefficient: float = 1

# Preload the bullet scene that gun will fire
@onready var bullet = preload("res://Scenes/Items/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
