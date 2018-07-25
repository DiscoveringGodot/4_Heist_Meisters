extends Area2D

export var can_open = false
onready var animation = $CollisionShape2D/AnimationPlayer


func _on_Player_use():
	if can_open:
		var player = find_node("Player")
		open()
	else:
		pass


func _on_Door_body_exited(body):
	can_open = false


func _on_Door_body_entered(body):
	if not body.name == "Player"  && not animation.is_playing():
		open("")
	else:
		can_open = true

func open(value):
	animation.play("Open")


func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) && can_open:
		open("")
