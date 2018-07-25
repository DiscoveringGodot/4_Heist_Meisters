extends "res://Scripts/Character.gd"

var motion = Vector2()
export var disguises = 3 # how many times can you disguise yourself?
export var disguised_slowdown = 0.25 # how fast do you move when disguised?
export var disguise_duration = 5 # how many seconds does a disguise last?

var disguised = false
var velocity_multiplier = 1
var night_vision = false

func _ready():
	global.player = self
	reveal()
	$Timer.wait_time = disguise_duration


func _process(delta):
	update_motion(delta)
	move_and_slide(motion * velocity_multiplier)
	if disguised:
		$Label.text =  str($Timer.time_left).pad_decimals(2)
		$Label.rect_rotation = (0 - rotation_degrees)


func reveal():
	collision_layer = 1
	$Sprite.texture = load(global.player_sprite)
	$LightOccluder2D.occluder = load(global.player_occlusion)
	$LightOccluder2D/Light2D.texture = load(global.player_sprite)
	$Label.visible = false
	velocity_multiplier = 1
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
	velocity_multiplier = disguised_slowdown
	disguised = true
	refresh_disguise_display()


func refresh_disguise_display():
	get_tree().call_group("disguise_display", "refresh", disguises)


func update_motion(delta):
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		motion.y = clamp(motion.y + SPEED, 0, MAX_SPEED)
	elif Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		motion.y = clamp(motion.y - SPEED, -MAX_SPEED, 0)
	else:
		motion.y = lerp(motion.y, 0, FRICTION)
		
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = clamp(motion.x + SPEED, 0, MAX_SPEED)
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = clamp(motion.x - SPEED, -MAX_SPEED, 0)
	else:
		motion.x = lerp(motion.x, 0, FRICTION)

		
func _input(event):
	if Input.is_action_just_pressed("ui_use"):
		toggle_disguise(event)

	if Input.is_action_just_pressed("ui_select"):
		toggle_night_vision()


func toggle_disguise():
	if not disguised and disguises > 0:
		disguise()
	else:
		reveal()

		
func toggle_night_vision():
	if night_vision:
		get_tree().call_group("npc", "set_night_vision_off")
		get_tree().call_group("interface", "set_night_vision_off")
		night_vision = false
	else:
		get_tree().call_group("npc", "set_night_vision_on")
		get_tree().call_group("interface", "set_night_vision_on")
		night_vision = true


func collect_briefcase():
	var loot  = Node.new()
	loot.set_name("briefcase")
	add_child(loot)
	get_tree().call_group("interface", "add_loot", "briefcase")

