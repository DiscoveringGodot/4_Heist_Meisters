extends Light2D

func _ready():
	add_to_group("interface")


func set_night_vision_on():
	enabled = false


func set_night_vision_off():
	enabled = true