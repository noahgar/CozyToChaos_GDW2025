class_name PlaceableScript extends Node3D

var BaseStaticBody:StaticBody3D

func _ready() -> void:
	for child in get_child(0).get_children():
		if child is StaticBody3D:
			BaseStaticBody = child
	if BaseStaticBody:
		BaseStaticBody.input_event.connect(_on_input_event)
		BaseStaticBody.mouse_entered.connect(_on_mouse_entered)
		BaseStaticBody.mouse_exited.connect(_on_mouse_exited)
	
func _on_input_event(_camera: Node, event: InputEvent, event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_mask&(MOUSE_BUTTON_MASK_LEFT):
			var root:RootSceneScript = get_tree().root.get_child(0)
			root.hudScript.removeFromHoveredArray(self)
			if root.isOutside:
				root.birdInventory.putObjectBack()
			else:
				root.birdInventory.layDownObjectAtPosition(event_position)

func _on_mouse_entered() -> void:
	var root:RootSceneScript = get_tree().root.get_child(0)
	root.hudScript.addToHoveredArray(self)
	
func _on_mouse_exited() -> void:
	var root:RootSceneScript = get_tree().root.get_child(0)
	root.hudScript.removeFromHoveredArray(self)
