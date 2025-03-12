extends Node3D

#TimeOfDay sollte ein wert zwischen 0-1 sein. Für die Rotation der Sonne bin ich mir nicht sicher, vielleicht einfach gar nicht rotieren?
#timeOfDay = 0 -> Nacht, timeOfDay = 0.5 -> Tag, timeOfDay = 1 -> Nacht
@export_range(0, 1) var timeOfDay:float

@export_category("Sun")
@export var directionalLight:DirectionalLight3D
@export var sunColor:Gradient
@export var rainySunColor:Gradient
@export var shadowOpacity:Curve

@export_category("Environment")
@export var worldEnvironment:WorldEnvironment
var envMat
@export var skyColor:Gradient
@export var horizonColor:Gradient
@export var rainySkyColor:Gradient
@export var rainyHorizonColor:Gradient

@export_category("Weather")
@export var rainVFX:GPUParticles3D
@export_range(0, 1) var rain:float
@export var windVFX:GPUParticles3D
@export_range(0, 1) var wind:float


func _ready() -> void:
	envMat = worldEnvironment.environment.sky.sky_material
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	timeOfDay = clamp(timeOfDay, 0, 1)
	
	if directionalLight != null:
		var currentSun = lerp(sunColor.sample(timeOfDay), rainySunColor.sample(timeOfDay), rain)
		var currentShadow = shadowOpacity.sample(timeOfDay) * (1 - rain)
		directionalLight.light_color = currentSun
		directionalLight.shadow_opacity = currentShadow
	
	if envMat != null:
		var currentSky = lerp(skyColor.sample(timeOfDay), rainySkyColor.sample(timeOfDay), rain)
		var currentHorizon = lerp(horizonColor.sample(timeOfDay), rainyHorizonColor.sample(timeOfDay), rain)
		envMat.set_shader_parameter("skyColor", currentSky)
		envMat.set_shader_parameter("horizonColor", currentHorizon)
	
	if rainVFX != null:
		rainVFX.amount_ratio = rain
	
	if windVFX != null:
		windVFX.amount_ratio = wind
	
