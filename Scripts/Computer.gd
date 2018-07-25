extends Area2D

var can_use = false
signal combination
var combination

export var id = "1"
export var combination_length = 4
onready var terminal = $CanvasLayer/Popup


func _ready():
	$Light2D.enabled = false
	get_combination()
	emit_signal("combination", combination, id)
	display_id()
	$Label.visible = false	


func display_id():
	terminal.set_text(combination)
	$Label.text = str(id)
	$Label.rect_rotation = (0 -rotation_degrees)


func get_combination():
	var combination_generator = get_node("/root/Level1/Combination")
	combination =combination_generator.generate_combination(combination_length)


func _on_Computer_body_entered(body):
	can_use = true


func _on_Computer_body_exited(body):
	can_use = false
	$Light2D.enabled = false
	terminal.hide()


func _on_Computer_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) && can_use:
		$Light2D.enabled = true
		terminal.popup_centered()


func vision_mode_change(vision_mode):
	if vision_mode:
		$Label.visible = true
	else:
		$Label.visible = false