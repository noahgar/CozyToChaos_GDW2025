class_name DoorToBirdHouse extends PhysicsBody3D

func _ready() -> void:
	self.input_event.connect(_on_input_event)
	self.mouse_entered.connect(_on_mouse_entered)
	self.mouse_exited.connect(_on_mouse_exited)
	
func _on_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_mask&(MOUSE_BUTTON_MASK_LEFT):
			var root:RootSceneScript = get_tree().root.get_child(0)
			root.hudScript.removeFromHoveredArray(self)
			if root.currentStep == 2:
				root.goToBirdHouse()

func _on_mouse_entered() -> void:
	var root:RootSceneScript = get_tree().root.get_child(0)
	root.hudScript.addToHoveredArray(self)
	
func _on_mouse_exited() -> void:
	var root:RootSceneScript = get_tree().root.get_child(0)
	root.hudScript.removeFromHoveredArray(self)
