extends Node2D

@onready var pause_menu_ui: Control = $CanvasLayer/PauseMenuUI
@onready var death_sound: AudioStreamPlayer = $DeathSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pause_menu_ui.hide()
	$Player/EnemySpawn.new_enemy_spawned.connect($CanvasLayer/HudUI._on_enemy_spawned)
	$Player/EnemySpawn.enemy_died.connect($CanvasLayer/HudUI._on_enemy_died)
	$Player/EnemySpawn.enemy_died.connect(enemy_death_sound)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("escape") && get_tree().paused == false:
		pause_menu_ui.show()
		get_tree().paused = true


func _on_player_game_over() -> void:
	pause_menu_ui.death_mode()
	pause_menu_ui.show()
	get_tree().paused = true

func enemy_death_sound():
	death_sound.play()
