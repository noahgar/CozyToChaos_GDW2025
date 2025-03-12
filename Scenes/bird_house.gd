class_name birdHouseScript extends Node3D

func _ready() -> void:
	wallVisibilityBasedOnCamera(45)

func wallVisibilityBasedOnCamera(targetDegrees:float):
	print_debug(targetDegrees)
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
