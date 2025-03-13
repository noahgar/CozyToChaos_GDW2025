extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/TestScene.tsnc")

func _on_credits_pressed() -> void:
	print("Credits pressed")

func _on_exit_pressed() -> void:
	get_tree().quit()
