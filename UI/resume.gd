extends Button


func _on_pressed() -> void:
	$"../..".visible = false
	$"../..".mouse_filter = MOUSE_FILTER_IGNORE
	var root:RootSceneScript = get_tree().root.get_child(0)
	root.timer.paused = false
