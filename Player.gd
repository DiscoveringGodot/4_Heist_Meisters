extends KinematicBody2D

#variables
export var accel = 10
export var friction = .1
var motion = Vector2()
export var max_speed = 1
var torch = false



func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var mpos = get_global_mouse_position()
	look_at(mpos)
	
	if Input.is_action_pressed("ui_up"):
		motion.y -= accel * delta
		clamp (motion.y, -max_speed, 0)
	elif Input.is_action_pressed("ui_down"):
		motion.y += accel * delta
		clamp (motion.y, 0, max_speed)
	else:
		motion.y = lerp(motion.y, 0, friction)

	if Input.is_action_pressed("ui_left"):
		motion.x -= accel * delta
		clamp (motion.x, -max_speed, 0)
	elif Input.is_action_pressed("ui_right"):
		motion.x += accel * delta
		clamp (motion.x, 0, max_speed)
	else:
		motion.x = lerp(motion.x, 0, friction)

	if Input.is_action_just_pressed("torch"):
		if torch == false:
			$Light2D.enabled = true
			torch = true
		else:
			$Light2D.enabled = false
			torch = false
	
	
	move_and_collide(motion)
	
	
	
	
	
	
	
	
	