class_name BirdAnimation extends Node3D

@export var regularTex:Texture2D
@export var tiredTex:Texture2D
@export var birdMesh:MeshInstance3D
@export var animator:AnimationTree

var material:Material

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	material = birdMesh.mesh.surface_get_material(0)
	setIdle()

func _process(delta: float) -> void:
	var skeleton:Skeleton3D = $"../Rig/Skeleton3D"
	var bone_id = skeleton.find_bone("Bone.004")
	var local_bone_transform = skeleton.get_bone_global_pose(bone_id).translated(Vector3(-0.15,0,0))
	var global_bone_pos = skeleton.to_global(local_bone_transform.origin)
	$"../PickableObjectSlot".global_position = global_bone_pos

func setIdle():
	material.set_shader_parameter("MainTexture", regularTex)
	animator.set("parameters/Tired/blend_amount", 0)
	
func setTired():
	material.set_shader_parameter("MainTexture", tiredTex)
	animator.set("parameters/Tired/blend_amount", 1)


func pick():
	animator.set("parameters/Pick/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
