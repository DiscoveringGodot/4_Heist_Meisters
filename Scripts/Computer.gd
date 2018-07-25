extends Area2D

# PARAMETERS - for tuning, typically set in the editor
export var lock_group = "1"
export var combination_length = 4

# CACHE - e.g. references for readability or speed
onready var pop_up = $CanvasLayer/Popup

# STATE - private instance (member) variables
var can_use = false
var combination

# CONSTANTS

# Signals
signal combination


func _ready():
	$Light2D.enabled = false

	generate_combination()
	emit_signal("combination", combination, lock_group)  # to linked doors
	
	label_computer()
	$Label.visible = false


func generate_combination():
	var combination_generator = get_node("/root/Level1/Combination")
	combination = combination_generator.generate_combination(combination_length)


func label_computer():
	pop_up.set_text(combination)
	$Label.text = str(lock_group)
	$Label.rect_rotation = (0 -rotation_degrees)


func _on_Computer_body_entered(body):
	can_use = true


func _on_Computer_body_exited(body):
	can_use = false
	$Light2D.enabled = false
	pop_up.hide()


func _on_Computer_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_use:
		$Light2D.enabled = true
		pop_up.popup_centered()

		
# group functions called
func set_night_vision_on():
	$Label.visible = true


func set_night_vision_off():
	$Label.visible = false

# signed_off