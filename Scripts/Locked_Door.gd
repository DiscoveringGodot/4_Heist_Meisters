extends "res://Scripts/Door.gd"

onready var lock = $CanvasLayer/Numberpad_lock
var combination 

func open():
	animation.play("Open")
	lock.reset_lock()
	lock.hide()


func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) && can_open:
		lock.popup_centered()


func _on_Computer_combination(numbers):
	combination = numbers
	
func _on_Door_body_exited(body):
	lock.reset_lock()
	lock.hide()