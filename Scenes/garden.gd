class_name gardenScript extends Node3D

@export var DoorIntoGarden:Node3D
var doorStaticBody3D:StaticBody3D

func _ready() -> void:
	doorStaticBody3D = DoorIntoGarden.get_child(0)
