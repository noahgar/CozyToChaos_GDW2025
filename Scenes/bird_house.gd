class_name birdHouseScript extends Node3D


var doorStaticBody3D1:StaticBody3D
var doorStaticBody3D2:StaticBody3D
var bedStaticBody3D:StaticBody3D

func _ready() -> void:
	doorStaticBody3D1 = $DoorIntoGarden.get_child(0)
	doorStaticBody3D1.visible = true
	doorStaticBody3D2 = $DoorIntoGarden2.get_child(0)
	doorStaticBody3D2.visible = true
	
	for child in $BirdHouse_Bed.get_child(0).get_children():
		if child is StaticBody3D:
			bedStaticBody3D = child
	if bedStaticBody3D:
		bedStaticBody3D.input_event.connect(_on_input_event)
		bedStaticBody3D.visible = false
	
	wallVisibilityBasedOnCamera(45)

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_mask&(MOUSE_BUTTON_MASK_LEFT):
			var root:RootSceneScript = get_tree().root.get_child(0)
			root.proceedToStep(5)


func activateDoor(active:bool):
	doorStaticBody3D1.visible = active
	doorStaticBody3D2.visible = active

func makeBedReady(active:bool):
	bedStaticBody3D.visible = active


func wallVisibilityBasedOnCamera(targetDegrees:float):
	if targetDegrees < 90:
		$"BirdHouse_Wall-F".visible = false
		$"BirdHouse_Wall-R".visible = false
		$"BirdHouse_Roof-R".visible = false
		$"BirdHouse_Wall-B".visible = true
		$"BirdHouse_Wall-L".visible = true
		$"BirdHouse_Roof-L".visible = true
		$BirdHouse_Stairs.visible = true
		$DoorIntoGarden.visible = false
	elif targetDegrees < 180:
		$"BirdHouse_Wall-F".visible = true
		$"BirdHouse_Wall-R".visible = false
		$"BirdHouse_Roof-R".visible = false
		$"BirdHouse_Wall-B".visible = false
		$"BirdHouse_Wall-L".visible = true
		$"BirdHouse_Roof-L".visible = true
		$BirdHouse_Stairs.visible = false
		$DoorIntoGarden.visible = true
	elif targetDegrees < 270:
		$"BirdHouse_Wall-F".visible = true
		$"BirdHouse_Wall-R".visible = true
		$"BirdHouse_Roof-R".visible = true
		$"BirdHouse_Wall-B".visible = false
		$"BirdHouse_Wall-L".visible = false
		$"BirdHouse_Roof-L".visible = false
		$BirdHouse_Stairs.visible = true
		$DoorIntoGarden.visible = true
	else:
		$"BirdHouse_Wall-F".visible = false
		$"BirdHouse_Wall-R".visible = true
		$"BirdHouse_Roof-R".visible = true
		$"BirdHouse_Wall-B".visible = true
		$"BirdHouse_Wall-L".visible = false
		$"BirdHouse_Roof-L".visible = false
		$BirdHouse_Stairs.visible = true
		$DoorIntoGarden.visible = false
