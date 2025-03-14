class_name RootSceneScript extends Node3D

@export var birdFlap:AudioStreamPlayer
var birdInventory:inventory
@export var camera:cameraRotation
@export var BirdHouse:birdHouseScript
@export var Garden:gardenScript
@export var hudScript:HudScript
@export var lighting:EnvironmentController
var isOutside:bool
var currentDay:int = 1
var currentStep:int = 0

func _ready() -> void:
	birdInventory = $CameraHUD/Pivot/Bird
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
	if birdFlap != null: birdFlap.play()

func goToGarden():
	Garden.visible = true
	BirdHouse.visible = false
	isOutside = true
	camera.changeScene(true)
	proceedToStep(1)
	if birdFlap != null: birdFlap.play()  

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
			Garden.dayProgressManager.incrementDay()
			proceedToStep(0)
