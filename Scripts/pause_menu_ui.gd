extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func death_mode() -> void:
	$MenuLabel.text = "Game Over"
	$ResumeGameButton.hide()

func _on_resume_game_button_pressed() -> void:
	get_tree().paused = false
	hide()

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/game_view.tscn")

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/UI/main_menu_ui.tscn")
