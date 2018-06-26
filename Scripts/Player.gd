extends "res://Scripts/Character.gd"

var motion = Vector2()

func _process(delta):
	update_motion(delta)
	update_actions()
	move_and_slide(motion)

func update_motion(delta):
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("ui_down") && not Input.is_action_pressed("ui_up"):
		motion.y += SPEED 
		if motion.y > MAX_SPEED:
			motion.y = MAX_SPEED
	elif Input.is_action_pressed("ui_up") && not Input.is_action_pressed("ui_down"):
		motion.y -= SPEED 
		if motion.y < -MAX_SPEED:
			motion.y = -MAX_SPEED
	else:
		motion.y = lerp(motion.y, 0, FRICTION)
		
	if Input.is_action_pressed("ui_right") && not Input.is_action_pressed("ui_left"):
		motion.x += SPEED
		if motion.x > MAX_SPEED:
			motion.x = MAX_SPEED
	elif Input.is_action_pressed("ui_left") && not Input.is_action_pressed("ui_right"):
		motion.x -= SPEED
		if motion.x < -MAX_SPEED:
			motion.x = -MAX_SPEED
	else:
		motion.x = lerp(motion.x, 0, FRICTION)

func update_actions():
	if Input.is_action_just_pressed("ui_select"):
		if $Light2D.enabled == true:
			$Light2D.enabled = false
		else:
			$Light2D.enabled = true
