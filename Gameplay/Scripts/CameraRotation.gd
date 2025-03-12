class_name cameraRotation extends Node3D

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
				cameraTargetRotation = fmod(cameraTargetRotation,360)
				var root:RootSceneScript = get_tree().root.get_child(0)
				root.BirdHouse.wallVisibilityBasedOnCamera(cameraTargetRotation)
			elif currentRealRotation < -90:
				currentRealRotation = 0
				cameraTargetRotation -= 90
				cameraTargetRotation = fmod(cameraTargetRotation+360,360)
				var root:RootSceneScript = get_tree().root.get_child(0)
				root.BirdHouse.wallVisibilityBasedOnCamera(cameraTargetRotation)

func _process(delta):
	#self.rotation_degrees = self.rotation_degrees.lerp(Vector3(0,cameraTargetRotation+currentRealRotation*0.1,0), 5*delta)
	
	self.rotation = Vector3(0, lerp_angle(self.rotation.y, deg_to_rad(cameraTargetRotation+currentRealRotation*0.1), 5*delta), 0)

func changeScene(outside:bool):
	if outside:
		$Pivot.rotation_degrees = Vector3(-50,0,0)
	else:
		$Pivot.rotation_degrees = Vector3(-15,0,0)
