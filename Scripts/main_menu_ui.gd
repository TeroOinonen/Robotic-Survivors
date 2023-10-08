extends Control


# Start the game
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_view.tscn")


# Quit the game
func _on_quit_button_pressed() -> void:
	get_tree().quit()
