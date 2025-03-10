extends Node3D

var cameraTargetRotation:float = 45
var currentRealRotation:float = 0

func _ready():
	pass
	
func _input(event):
	
	if event is InputEventMouseButton:
		if event.is_released():
			currentRealRotation = 0
	
	if event is InputEventMouseMotion:
		if event.button_mask&(MOUSE_BUTTON_MASK_MIDDLE+MOUSE_BUTTON_MASK_RIGHT):
			currentRealRotation = currentRealRotation + event.relative.x * -0.3
			if currentRealRotation > 90:
				currentRealRotation = 0
				cameraTargetRotation += 90
			elif currentRealRotation < -90:
				currentRealRotation = 0
				cameraTargetRotation -= 90


func _process(delta):
	self.rotation_degrees = self.rotation_degrees.lerp(Vector3(0,cameraTargetRotation+currentRealRotation*0.2,0), 3*delta)
