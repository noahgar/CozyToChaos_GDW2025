class_name DayChanger
extends Node3D

@export var makeVisibleArray:Array[Node3D]
@export var makeInvisibleArray:Array[Node3D]


func setDayActive():
	for node in makeVisibleArray:
		node.visible = true
	for node in makeInvisibleArray:
		node.visible = false

func setDayInactive():
	for node in makeVisibleArray:
		node.visible = false
