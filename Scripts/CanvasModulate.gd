extends CanvasModulate

const DARK = Color("030324")
const NIGHTVISION = Color("28c828")

func _ready():
	global.canvas_modulate = self
	color = DARK
	add_to_group("interface")

func set_night_vision_on():
	$AudioStreamPlayer.stream = load(global.nightvision_on_sfx)
	$AudioStreamPlayer.play()
	color = NIGHTVISION

func set_night_vision_off():  # to avoid boolean parameters which means func does two things
	$AudioStreamPlayer.stream = load(global.nightvision_off_sfx)
	$AudioStreamPlayer.play() 
	color = DARK

# signed-off