extends "res://Scripts/Door.gd"

onready var lock = $CanvasLayer/Numberpad_lock
var combination 


func open(body):
	animation.play("Open")
	lock.reset_lock()
	lock.hide()


func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) && can_click:
		lock.popup_centered()


func _on_Computer_combination(numbers, id):
	combination = numbers
	set_label(id)


func set_label(id):
	$Label.text = str(id)
	$Label.visible = false
	$Label.rect_rotation = (0 -rotation_degrees)


func _on_Door_body_exited(body):
	lock.reset_lock()
	lock.hide()


func set_night_vision_on():
	$Label.visible = true


func set_night_vision_off():  # TODO consider naming convention for these group "messages"
	$Label.visible = false