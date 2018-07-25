extends "res://Scripts/Character.gd"

var motion = Vector2()
export var disguises = 3 # how many times can you disguise yourself?
export var disguised_velocity = 0.33 # how fast do you move when disguised?
export var disguise_duration = 5 # how many seconds does a disguise last?

var disguised = false
var velocity = 1
var night_vision = false

signal vision_mode_change

func _ready():
	global.player = self
	reveal()
	$Timer.wait_time = disguise_duration


func _process(delta):
	update_motion(delta)
	move_and_slide(motion * velocity)
	if disguised:
		$Label.text =  str($Timer.time_left).pad_decimals(2)
		$Label.rect_rotation = (0 -rotation_degrees)

func reveal():
	collision_layer = 1
	$Sprite.texture = load(global.player_sprite)
	$LightOccluder2D.occluder = load(global.player_occlusion)
	$LightOccluder2D/Light2D.texture = load(global.player_sprite)
	$Label.visible = false
	velocity = 1
	disguised = false
	refresh_disguise_display()


func disguise():
	disguises -= 1
	collision_layer = 4
	$Sprite.texture = load(global.box_sprite)
	$LightOccluder2D.occluder = load(global.box_occluder)
	$LightOccluder2D/Light2D.texture = load(global.box_sprite)
	$Label.visible = true
	$Timer.start()
	velocity = 0.25
	disguised = true
	refresh_disguise_display()


func refresh_disguise_display():
	get_tree().call_group("disguise_display", "refresh", disguises)


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

func _input(event):
	if Input.is_action_just_pressed("ui_use"):
		if  not disguised and disguises > 0:
			disguise()
		else:
			reveal()
	
	if Input.is_action_just_pressed("ui_select"):
		if night_vision:
			night_vision = false
		else:
			night_vision = true

		get_tree().call_group("npc", "vision_mode_change", night_vision)
		get_tree().call_group("interface", "vision_mode_change", night_vision)
		

func collect_briefcase():
	var loot  = Node.new()
	loot.set_name("briefcase")
	add_child(loot)
	get_tree().call_group("interface", "add_loot", "briefcase")

