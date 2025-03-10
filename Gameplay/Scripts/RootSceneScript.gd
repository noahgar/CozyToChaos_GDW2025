class_name RootSceneScript extends Node3D

var birdInventory:inventory
var isOutside:bool

func _ready() -> void:
	$Garden01.visible = false
	$BirdHouse.visible = true
	birdInventory = $CameraHUD/Bird
	isOutside = false

func goToBirdHouse():
	$Garden01.visible = false
	$BirdHouse.visible = true
	isOutside = false


func goToGarden():
	$Garden01.visible = true
	$BirdHouse.visible = false
	isOutside = true
