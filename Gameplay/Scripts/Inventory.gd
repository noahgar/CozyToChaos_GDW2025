class_name inventory extends Node3D

var CurrentlyHolding:PickableObject

func _ready():
	pass
	
func pickUpObject(object:PickableObject):
	if CurrentlyHolding:
		CurrentlyHolding.putMyselfBack()
	
	CurrentlyHolding = object

func layDownObjectAtPosition(position:Vector3):
	if CurrentlyHolding:
		CurrentlyHolding.layMyselfDownAtPosition(position)
	
	CurrentlyHolding = null

func putObjectBack():
	if CurrentlyHolding:
		CurrentlyHolding.putMyselfBack()
	
	CurrentlyHolding = null

func _process(delta: float) -> void:
	if CurrentlyHolding:
		CurrentlyHolding.global_position = $"../PickableObjectSlot".global_position
		CurrentlyHolding.global_rotation =  $"../PickableObjectSlot".global_rotation
