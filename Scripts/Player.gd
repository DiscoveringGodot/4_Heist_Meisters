extends "res://Scripts/Character.gd"

var motion =Vector2()
var vision_change_on_cooldown = false

enum vision_mode {DARK, NIGHTVISION}

func _ready():
	Global.Player = self
	vision_mode = DARK


func _process(delta):
	update_motion(delta)
	move_and_slide(motion)


func update_motion(delta):
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		motion.y = clamp((motion.y - SPEED), -MAX_SPEED, 0)
	elif Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		motion.y = clamp((motion.y + SPEED), 0, MAX_SPEED)
	else:
		motion.y = lerp(motion.y, 0, FRICTION)
	
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = clamp((motion.x - SPEED), -MAX_SPEED, 0)
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = clamp((motion.x + SPEED), 0, MAX_SPEED)
	else:
		motion.x = lerp(motion.x, 0, FRICTION)


func _input(event):
	if Input.is_action_just_pressed("ui_vision_mode_change") and not vision_change_on_cooldown:
		cycle_vision_mode()
		vision_change_on_cooldown = true
		$VisionModeTimer.start()

func cycle_vision_mode():
	if vision_mode == DARK:
		get_tree().call_group("interface", "NightVision_mode")
		vision_mode = NIGHTVISION
	elif vision_mode == NIGHTVISION:
		get_tree().call_group("interface", "DarkVision_mode")
		vision_mode = DARK 


func _on_VisionModeTimer_timeout():
	vision_change_on_cooldown = false
