class_name cameraRotation extends Node3D

var cameraTargetRotation:float = 45
var currentRealRotation:float = 0

@export var birdPositionIndoor:Vector3 = Vector3(31,-35,104)
@export var birdPositionOutdoor:Vector3 = Vector3(27,-38,104)

@export var cameraSizeIndoor:float = 10
@export var cameraSizeOutdoor:float = 15

@export var cameraRotationDownIndoor:float = -15
@export var cameraRotationDownOutdoor:float = -45

@export var cameraPivotDownwardsTransformInside:float = 2
@export var cameraPivotDownwardsTransformOutside:float = -2.5

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
		$Pivot.rotation_degrees = Vector3(cameraRotationDownOutdoor,0,0)
		$Pivot.position = Vector3(0,cameraPivotDownwardsTransformOutside,0)
		$Pivot/Camera3D.size = cameraSizeOutdoor
		$Pivot/Bird.position = birdPositionOutdoor
	else:
		$Pivot.rotation_degrees = Vector3(cameraRotationDownIndoor,0,0)
		$Pivot.position = Vector3(0,cameraPivotDownwardsTransformInside,0)
		$Pivot/Camera3D.size = cameraSizeIndoor
		$Pivot/Bird.position = birdPositionIndoor
