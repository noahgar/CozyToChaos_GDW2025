class_name DayChanger
extends Node3D

@export var makeVisibleArray:Array[Node3D]
@export var makeInvisibleArray:Array[Node3D]


func setDayActive():
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
