class_name RootSceneScript extends Node3D

var birdInventory:inventory
var camera:cameraRotation
var BirdHouse:birdHouseScript
var Garden:gardenScript
var isOutside:bool
var currentDay:int = 1
var currentStep:int = 0

func _ready() -> void:
	Garden = $Garden01
	BirdHouse = $BirdHouse
	birdInventory = $CameraHUD/Pivot/Bird
	camera = $CameraHUD
	Garden.visible = false
	BirdHouse.visible = true
	isOutside = false
	camera.changeScene(false)

func goToBirdHouse():
	Garden.visible = false
	BirdHouse.visible = true
	isOutside = false
	camera.changeScene(false)
	proceedToStep(3)

func goToGarden():
	Garden.visible = true
	BirdHouse.visible = false
	isOutside = true
	camera.changeScene(true)
	proceedToStep(1)

func proceedToStep(step:int):
	currentStep = step
	match step:
		0: #morning (house)
			BirdHouse.activateDoor(true)
		1: #day (garden)
			BirdHouse.activateDoor(false)
		2: #picked up object (garden)
			Garden.activateDoor(true)
		3: #evening (house)
			Garden.activateDoor(false)
			BirdHouse.activateDoor(false)
		4: #placed object (house)
			BirdHouse.makeBedReady(true)
		5: #night (sleeping transition)
			BirdHouse.makeBedReady(false)
			proceedToStep(0)
