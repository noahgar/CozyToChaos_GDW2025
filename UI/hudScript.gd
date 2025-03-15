class_name HudScript extends Control

var hoveredObjects:Array

func _ready() -> void:
	$SunDown/CenterContainer/Control/SunDown.animation_finished.connect(finishedPlayingAnim)
	$SunUp/CenterContainer/Control/SunUp.animation_finished.connect(finishedPlayingAnim)
	$Night/CenterContainer/Control/Night.animation_finished.connect(finishedPlayingAnim)
	$SunDown/CenterContainer/Control/SunDown.set_frame_and_progress(0,0)
	$SunUp/CenterContainer/Control/SunUp.set_frame_and_progress(0,0)
	$Night/CenterContainer/Control/Night.set_frame_and_progress(0,0)

func _process(_delta: float) -> void:
	$RichTextLabel.set_position(lerp($RichTextLabel.position,get_local_mouse_position()-Vector2($RichTextLabel.size.x/2,$RichTextLabel.size.y+20),0.2),false)

func setClock(time:float):
	$Control/Pfeil.rotation_degrees = -(time*120-60)

func playNightAnim():
	$Night.visible = true
	$Night/CenterContainer/Control/Night.play()

func playSunUpAnim():
	$SunUp.visible = true
	$SunUp/CenterContainer/Control/SunUp.play()

func playSunDownAnim():
	$SunDown.visible = true
	$SunDown/CenterContainer/Control/SunDown.play()


func finishedPlayingAnim():
	$Night.visible = false
	$SunUp.visible = false
	$SunDown.visible = false
	$SunDown/CenterContainer/Control/SunDown.set_frame_and_progress(0,0)
	$SunUp/CenterContainer/Control/SunUp.set_frame_and_progress(0,0)
	$Night/CenterContainer/Control/Night.set_frame_and_progress(0,0)


func addToHoveredArray(object):
	if !hoveredObjects.has(object):
		hoveredObjects.append(object)
	decideTooltipText()

func removeFromHoveredArray(object):
	if hoveredObjects.has(object):
		hoveredObjects.erase(object)
	decideTooltipText()


func decideTooltipText():
	var root:RootSceneScript = get_tree().root.get_child(0)
	
	var mostImportantObject
	for object in hoveredObjects:
		if object is PickableObject:
			if mostImportantObject is not DoorToBirdHouse or DoorToGarden or PlaceableScript or BedScript:
				mostImportantObject = object
		elif object is PlaceableScript:
			if mostImportantObject is not DoorToBirdHouse or DoorToGarden or BedScript:
				mostImportantObject = object
		elif object is DoorToBirdHouse:
			mostImportantObject = object
		elif object is DoorToGarden:
			mostImportantObject = object
		elif object is BedScript:
			mostImportantObject = object
	
	if mostImportantObject:
		if mostImportantObject is PickableObject:
			if root.birdInventory.CurrentlyHolding:
				showAndUpdateTooltip("Put down")
			else:
				showAndUpdateTooltip("Pick up")
		elif mostImportantObject is PlaceableScript:
			if root.birdInventory.CurrentlyHolding:
				showAndUpdateTooltip("Put down")
			else:
				hideTooltip()
		elif mostImportantObject is DoorToBirdHouse:
			if root.currentStep == 2:
				if root.birdInventory.CurrentlyHolding:
					showAndUpdateTooltip("Fly home")
				else:
					showAndUpdateTooltip("Pick up object to fly home")
			else:
				showAndUpdateTooltip("Gotta pick something up")
		elif mostImportantObject is DoorToGarden:
			if root.currentStep == 0:
				if !root.birdInventory.CurrentlyHolding:
					showAndUpdateTooltip("Fly out")
				else:
					showAndUpdateTooltip("Put down object to fly out")
			else:
				showAndUpdateTooltip("Too tired to fly out")
		elif mostImportantObject is BedScript:
			if root.currentStep == 4:
				if !root.birdInventory.CurrentlyHolding:
					showAndUpdateTooltip("Sleep")
				else:
					showAndUpdateTooltip("Put down object to sleep")
			else:
				showAndUpdateTooltip("Not sleepy")
	else:
		hideTooltip()





func showAndUpdateTooltip(newText:String):
	$RichTextLabel.visible = true
	$RichTextLabel.text = newText

func hideTooltip():
	$RichTextLabel.visible = false
