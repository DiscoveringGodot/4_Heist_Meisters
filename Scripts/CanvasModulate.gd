extends CanvasModulate

const DARK = Color("030324")
const NIGHTVISION = Color("28c828")

func _ready():
	global.canvas_modulate = self
	color = DARK

func vision_mode_change(night_vision):
	$AudioStreamPlayer.play()
	if night_vision:
		color = NIGHTVISION
	else:
		color = DARK
