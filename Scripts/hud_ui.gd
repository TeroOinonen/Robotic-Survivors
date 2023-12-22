extends Control

@onready var hit_point_count: Label = $HitPointCount
@onready var enemy_count: Label = $EnemyCount
@onready var reloading_label: Label = $ReloadingLabel
@onready var ammo_count: Label = $AmmoCount

var enemyCount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_player_hit_point_count_changed(new_count: int) -> void:
	hit_point_count.text = "HitPoints: " + str(new_count)
	
func _on_enemy_spawned() -> void:
	enemyCount += 1
	enemy_count.text = "Enemies: " + str(enemyCount)

func _on_enemy_died() -> void:
	enemyCount -= 1
	enemy_count.text = "Enemies: " + str(enemyCount)

func _on_ammo_count_changed(new_count: int) -> void:
	ammo_count.text = "Ammo: " + str(new_count)

func _on_player_gun_finished_reloading() -> void:
	reloading_label.hide()

func _on_player_gun_reloading_gun() -> void:
	reloading_label.show()
