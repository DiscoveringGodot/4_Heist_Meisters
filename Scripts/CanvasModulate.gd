extends CanvasModulate

const DARK = Color("030324")
const NIGHTVISION = Color("28c828")

func _ready():
	global.canvas_modulate = self
	color = DARK

func set_night_vision_on():
	$AudioStreamPlayer.play()
	color = NIGHTVISION

func set_night_vision_off():  # to avoid boolean parameters
	$AudioStreamPlayer.play()
	color = DARK
