extends "res://Scripts/Character.gd"

export var disguises = 3 # How many disguises you start with
export var disguise_duration = 5 # How long a disguise can last
export var disguise_slowdown = 0.25

var motion =Vector2()
var vision_change_on_cooldown = false

var disguised = false
var velocity_multiplier = 1

enum vision_mode {DARK, NIGHTVISION}

func _ready():
	Global.Player = self
	vision_mode = DARK
	$Timer.wait_time = disguise_duration
	update_disguise_display()
	reveal()


func _process(delta):
	update_motion(delta)
	move_and_slide(motion * velocity_multiplier)
	if disguised:
		$Label.rect_rotation = -rotation_degrees
		$Label.text = str($Timer.time_left).pad_decimals(2)


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
	if Input.is_action_just_pressed("toggle_disguise"):
		toggle_disguise()

func cycle_vision_mode():
	if vision_mode == DARK:
		get_tree().call_group("interface", "NightVision_mode")
		vision_mode = NIGHTVISION
	elif vision_mode == NIGHTVISION:
		get_tree().call_group("interface", "DarkVision_mode")
		vision_mode = DARK 


func _on_VisionModeTimer_timeout():
	vision_change_on_cooldown = false


func toggle_disguise():
	if disguised:
		reveal()
	elif disguises >0:
		disguise()


func reveal():
	$Label.visible = false
	$Sprite.texture = load(Global.player_sprite)
	$Light2D.texture =  load(Global.player_sprite)
	$LightOccluder2D.occluder = load(Global.player_occluder)
	collision_layer = 1
	
	velocity_multiplier = 1
	
	disguised = false


func disguise():
	$Label.visible = true
	$Sprite.texture = load(Global.box_sprite)
	$Light2D.texture = load(Global.box_sprite)
	$LightOccluder2D.occluder = load(Global.box_occluder)
	collision_layer = 16
	
	velocity_multiplier = disguise_slowdown
	$Timer.start()
	
	disguises -=1
	update_disguise_display()
	disguised = true

func update_disguise_display():
	get_tree().call_group("DisguiseDisplay", "update_disguises", disguises)


func collect_briefcase():
	var loot = Node.new()
	loot.set_name("briefcase")
	add_child(loot)
	get_tree().call_group("interface", "collect_loot")





