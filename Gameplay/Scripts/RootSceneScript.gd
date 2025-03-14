class_name RootSceneScript extends Node3D

@export var birdFlap:AudioStreamPlayer
var birdInventory:inventory
@export var camera:cameraRotation
@export var BirdHouse:birdHouseScript
@export var Garden:gardenScript
@export var hudScript:HudScript
@export var lighting:EnvironmentController
@export var timer:Timer
var isOutside:bool
var currentDay:int = 1
var currentStep:int = 0

func _ready() -> void:
	birdInventory = $CameraHUD/Pivot/Bird
	Garden.visible = false
	BirdHouse.visible = true
	isOutside = false
	camera.changeScene(false)
	timer.timeout.connect(timeRanOut)
	hudScript.setClock(0)

func _process(_delta: float) -> void:
	if !timer.is_stopped():
		var timeOfDay = 1-timer.time_left/timer.wait_time
		hudScript.setClock(timeOfDay)
		if timeOfDay<0.5:
			lighting.timeOfDay = timeOfDay
		else:
			lighting.timeOfDay = 1-timeOfDay

func timeRanOut():
	timer.stop()
	hudScript.setClock(1)
	if isOutside:
		goToBirdHouse()

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
	timer.start()

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
			timer.stop()
			lighting.timeOfDay = 0
			hudScript.setClock(0)
			Garden.dayProgressManager.incrementDay()
			proceedToStep(0)
