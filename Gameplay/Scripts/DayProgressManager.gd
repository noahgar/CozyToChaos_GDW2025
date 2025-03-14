@tool
extends Node3D
class_name DayProgressManager

var currentDay:int = 0
@export var daysArray:Array[DayChanger]

func _ready() -> void:
	currentDay = 0
	if Engine.is_editor_hint():
		# Code to execute in editor.
		toolIterateToDay(0)

	if not Engine.is_editor_hint():
		# Code to execute in game.
		iterateToDay(0)

func incrementDay():
	proceedToDay(currentDay+1)

func proceedToDay(d):
	while currentDay<d:
		currentDay += 1
		if daysArray.size() > currentDay:
			daysArray[currentDay].setDayActive()

func iterateToDay(d):
	for day in daysArray:
		day.setDayInactive()
	for i in d+1:
		if daysArray.size()>i:
			daysArray[i].setDayActive()

# this version does all the work in this script, to be able to use it in editor
func toolIterateToDay(d):
	for day in daysArray:
		setDayInactive(day.makeVisibleArray,day.makeInvisibleArray)
	for i in d+1:
		if daysArray.size()>i:
			setDayActive(daysArray[i].makeVisibleArray,daysArray[i].makeInvisibleArray)

func setDayActive(makeVisibleArray:Array[Node3D],makeInvisibleArray:Array[Node3D]):
	for node in makeVisibleArray:
		if node:
			node.visible = true
	for node in makeInvisibleArray:
		if node:
			node.visible = false

func setDayInactive(makeVisibleArray:Array[Node3D],_makeInvisibleArray:Array[Node3D]):
	for node in makeVisibleArray:
		if node:
			node.visible = false

# custom property list
func _get_property_list() -> Array:
	var propertyArray:Array
	propertyArray.append({
			name = "Current Day",
			type = TYPE_INT,
			
		})
	return propertyArray

func _get(property: StringName):
	if property == &"Current Day":
		return currentDay

func _set(property: StringName, value) -> bool:
	if property == &"Current Day":
		currentDay = value
		toolIterateToDay(value)
		return true
	return false
