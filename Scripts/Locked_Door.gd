extends "res://Scripts/Door.gd"

onready var lock = $CanvasLayer/Numberpad_lock
var combination 


func open(body):
	animation.play("Open")
	lock.reset_lock()
	lock.hide()


func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) && can_open:
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


func vision_mode_change(vision_mode):
	if vision_mode:
		$Label.visible = true
	else:
		$Label.visible = false

