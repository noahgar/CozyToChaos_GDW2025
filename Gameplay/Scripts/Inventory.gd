class_name inventory extends Node3D

var CurrentlyHolding:PickableObject
var BirdAnim:BirdAnimation

func _ready():
	BirdAnim = $BirdController
	
func pickUpObject(object:PickableObject):
	if CurrentlyHolding:
		CurrentlyHolding.putMyselfBack()
	var root:RootSceneScript = get_tree().root.get_child(0)
	if root.currentStep == 1:
		root.proceedToStep(2)
	CurrentlyHolding = object
	
	if BirdAnim != null: BirdAnim.pick()

func layDownObjectAtPosition(positionToLayDown:Vector3):
	if CurrentlyHolding:
		CurrentlyHolding.layMyselfDownAtPosition(positionToLayDown)
	var root:RootSceneScript = get_tree().root.get_child(0)
	if root.currentStep == 3:
		root.proceedToStep(4)
	CurrentlyHolding = null
	
	if BirdAnim != null: BirdAnim.pick()

func putObjectBack():
	if CurrentlyHolding:
		CurrentlyHolding.putMyselfBack()
	CurrentlyHolding = null
	
	if BirdAnim != null: BirdAnim.pick()

func _process(_delta: float) -> void:
	if CurrentlyHolding:
		CurrentlyHolding.global_position = $PickableObjectSlot.global_position
		CurrentlyHolding.BaseRigidBody.global_position = $"PickableObjectSlot".global_position
		CurrentlyHolding.BaseRigidBody.freeze = true
		CurrentlyHolding.global_rotation =  $"PickableObjectSlot".global_rotation
