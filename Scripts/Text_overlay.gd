extends Label

func _ready():
	visible = false

func vision_mode_change(vision_mode):
	if vision_mode:
		visible = true
	else:
		visible = false