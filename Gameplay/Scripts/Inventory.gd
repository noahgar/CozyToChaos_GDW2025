class_name inventory extends Node3D

var CurrentlyHolding:PickableObject

func _ready():
	pass
	
func pickUpObject(object:PickableObject):
	if CurrentlyHolding:
		CurrentlyHolding.putMyselfBack()
	var root:RootSceneScript = get_tree().root.get_child(0)
	if root.currentStep == 1:
		root.proceedToStep(2)
	CurrentlyHolding = object

func layDownObjectAtPosition(position:Vector3):
	if CurrentlyHolding:
		CurrentlyHolding.layMyselfDownAtPosition(position)
	var root:RootSceneScript = get_tree().root.get_child(0)
	if root.currentStep == 3:
		root.proceedToStep(4)
	CurrentlyHolding = null

func putObjectBack():
	if CurrentlyHolding:
		CurrentlyHolding.putMyselfBack()
	
	CurrentlyHolding = null

func _process(delta: float) -> void:
	if CurrentlyHolding:
		CurrentlyHolding.global_position = $PickableObjectSlot.global_position
		CurrentlyHolding.BaseRigidBody.global_position = $"PickableObjectSlot".global_position
		CurrentlyHolding.BaseRigidBody.freeze = true
		CurrentlyHolding.global_rotation =  $"PickableObjectSlot".global_rotation
