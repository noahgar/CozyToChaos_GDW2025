class_name RootSceneScript extends Node3D

var birdInventory:inventory
var camera:cameraRotation
var BirdHouse
var isOutside:bool

func _ready() -> void:
	$Garden01.visible = false
	$BirdHouse.visible = true
	birdInventory = $CameraHUD/Pivot/Bird
	BirdHouse = $BirdHouse
	camera = $CameraHUD
	isOutside = false
	camera.changeScene(false)

func goToBirdHouse():
	$Garden01.visible = false
	$BirdHouse.visible = true
	isOutside = false
	camera.changeScene(false)


func goToGarden():
	$Garden01.visible = true
	$BirdHouse.visible = false
	isOutside = true
	camera.changeScene(true)
