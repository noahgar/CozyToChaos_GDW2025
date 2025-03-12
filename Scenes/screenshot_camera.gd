extends Camera3D

var screenshots_count := 0

func _ready() -> void:
	DirAccess.open("C://").make_dir("screenshots")
	screenshots_count = DirAccess.open("C://screenshots").get_files().size()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):Screenshot()
	
func Screenshot():
		self.current = true
		await RenderingServer.frame_post_draw
		screenshots_count +=1
		var image := get_viewport().get_texture().get_image()
		image.save_png("C://screenshots/screenshot"+ str(screenshots_count)+".png")
	
