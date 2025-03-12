class_name RootSceneScript extends Node3D

var birdInventory:inventory
var camera:cameraRotation
var BirdHouse:birdHouseScript
var Garden:gardenScript
var hudScript:HudScript
var isOutside:bool
var currentDay:int = 1
var currentStep:int = 0

func _ready() -> void:
	Garden = $Garden01
	BirdHouse = $BirdHouse
	birdInventory = $CameraHUD/Pivot/Bird
	camera = $CameraHUD
	hudScript = $Hud
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
			pass
		1: #day (garden)
			hudScript.playSunUpAnim()
		2: #picked up object (garden)
			pass
		3: #evening (house)
			hudScript.playSunDownAnim()
		4: #placed object (house)
			pass
		5: #night (sleeping transition)
			hudScript.playNightAnim()
			proceedToStep(0)
