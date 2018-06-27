extends CanvasModulate

const DARK = Color("030324")
const NIGHTVISION = Color("28c828")

func _ready():
	color = DARK

func vision_mode_change(night_vision):
	if night_vision:
		color = NIGHTVISION
	else:
		color = DARK
