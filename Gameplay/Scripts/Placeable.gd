extends Node3D

var BaseStaticBody:StaticBody3D

func _ready() -> void:
	for child in get_child(0).get_children():
		if child is StaticBody3D:
			BaseStaticBody = child
	if BaseStaticBody:
		BaseStaticBody.input_event.connect(_on_input_event)
	
func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_mask&(MOUSE_BUTTON_MASK_LEFT):
			var root:RootSceneScript = get_tree().root.get_child(0)
			if root.isOutside:
				root.birdInventory.putObjectBack()
			else:
				root.birdInventory.layDownObjectAtPosition(event_position)
