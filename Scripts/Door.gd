extends Area2D

export var can_click = false
onready var animation = $CollisionShape2D/AnimationPlayer


func _on_Player_use():
	if can_click:
		open()


func _on_Door_body_exited(body):
	can_click = false


func _on_Door_body_entered(body):
	if not body.name == "Player"  && not animation.is_playing():
		open(null)
	else:
		can_click = true


func open(value):
	animation.play("Open")


func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) && can_click:
		open(null)
