class_name gardenScript extends Node3D

var doorStaticBody3D:StaticBody3D

func _ready() -> void:
	doorStaticBody3D = $DoorIntoGarden.get_child(0)
	doorStaticBody3D.visible = false

func activateDoor(active:bool):
	doorStaticBody3D.visible = active
