class_name DayChanger
extends Node3D

@export_range(0,1) var weather:float = 0
@export var makeVisibleArray:Array[Node3D]
@export var makeInvisibleArray:Array[Node3D]

func setDayActive():
	if get_tree().root.get_child(0) is RootSceneScript:
		var root:RootSceneScript = get_tree().root.get_child(0)
		if root.lighting != null:
			root.lighting.badWeather = weather
	
	for node in makeVisibleArray:
		if node:
			node.visible = true
	for node in makeInvisibleArray:
		if node:
			node.visible = false

func setDayInactive():
	for node in makeVisibleArray:
		if node:
			node.visible = false
