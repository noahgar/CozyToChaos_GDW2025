extends PhysicsBody3D

func _ready() -> void:
	self.input_event.connect(_on_input_event)
	
func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_mask&(MOUSE_BUTTON_MASK_LEFT):
			var root:RootSceneScript = get_tree().root.get_child(0)
			root.goToBirdHouse()
