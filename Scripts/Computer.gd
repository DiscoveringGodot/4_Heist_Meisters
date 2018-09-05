extends Area2D

var can_click = false
var combination

export var combination_length = 4


func _ready():
	$Light2D.enabled = false
	generate_combination()


func generate_combination():
	var combination_generator = get_tree().get_root().find_node("CombinationGenerator", true, false)
	combination = combination_generator.generate_combination(combination_length)
	set_popup_text()


func _on_Computer_body_entered(body):
	can_click = true


func _on_Computer_body_exited(body):
	can_click = false
	$Light2D.enabled = false
	$CanvasLayer/ComputerPopup.hide()


func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/ComputerPopup.popup_centered()
		$Light2D.enabled = true


func set_popup_text():
	$CanvasLayer/ComputerPopup.set_text(combination)









