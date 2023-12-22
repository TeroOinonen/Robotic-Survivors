extends Path2D

signal new_enemy_spawned
signal enemy_died

@onready var spawn_timer: Timer = $SpawnTimer
@onready var spawn_point: PathFollow2D = $SpawnPoint

const enemy_template = preload("res://Scenes/Entities/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_timer.connect("_on_timeout", spawn_monster)
	spawn_timer.start()

func spawn_monster() -> void:
	var enemy = enemy_template.instantiate()
	spawn_point.progress_ratio = randf()
	add_child(enemy)
	enemy.top_level = true
	enemy.global_position = spawn_point.global_position
	enemy.target_object= get_parent()
	new_enemy_spawned.emit()
	enemy.got_killed.connect(_on_enemy_death)

func _on_enemy_death():
	enemy_died.emit()
