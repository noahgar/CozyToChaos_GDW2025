extends Button


func _on_pressed() -> void:
	$"../../PauseMenu".visible = true
	$"../../PauseMenu".mouse_filter = MOUSE_FILTER_STOP
	var root:RootSceneScript = get_tree().root.get_child(0)
	root.timer.paused = true
