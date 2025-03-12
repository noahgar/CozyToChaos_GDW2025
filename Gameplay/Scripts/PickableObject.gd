class_name PickableObject extends Node3D

var defaultLocation:Vector3
var startingTransform:Transform3D
var isPickedUp:bool
var startingParent
var BaseRigidBody:RigidBody3D

func _ready() -> void:
	for child in get_children():
		if child is RigidBody3D:
			BaseRigidBody = child
	if BaseRigidBody:
		BaseRigidBody.input_event.connect(_on_input_event)
	startingTransform = self.global_transform
	startingParent = self.get_parent_node_3d()
	
func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if !isPickedUp:
		if event is InputEventMouseButton:
			if event.button_mask&(MOUSE_BUTTON_MASK_LEFT):
				var root:RootSceneScript = get_tree().root.get_child(0)
				if root.birdInventory.CurrentlyHolding:
					if root.isOutside:
						root.birdInventory.putObjectBack()
					else:
						root.birdInventory.layDownObjectAtPosition(event_position)
				else:
					self.reparent(root.birdInventory)
					isPickedUp = true
					root.birdInventory.pickUpObject(self)

func putMyselfBack():
	self.reparent(startingParent)
	self.global_transform = startingTransform.translated(Vector3(0,1,0))
	BaseRigidBody.global_transform = startingTransform.translated(Vector3(0,1,0))
	BaseRigidBody.freeze = false
	isPickedUp = false
	
func layMyselfDownAtPosition(targetPosition:Vector3):
	var root:RootSceneScript = get_tree().root.get_child(0)
	if !root.isOutside:
		self.reparent(root.BirdHouse)
	self.global_transform = startingTransform
	BaseRigidBody.global_transform = startingTransform
	self.global_position = targetPosition + Vector3(0,1,0)
	BaseRigidBody.global_position = targetPosition + Vector3(0,1,0)
	BaseRigidBody.freeze = false
	isPickedUp = false
