extends Button

func ReturnToMenu_on_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/MainMenu.tscn")
