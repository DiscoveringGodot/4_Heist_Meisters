extends "res://Scripts/Character.gd"

var motion = Vector2()
var disguised = false
var velocity = 1
signal vision_mode_change

func _ready():
	connect("vision_mode_change", get_node("/root/Level1/CanvasModulate"), "vision_mode_change")
	reveal()
	
func _process(delta):
	update_motion(delta)
	move_and_slide(motion * velocity)

func reveal():
	collision_layer = 1
	$Sprite.texture = load("res://GFX/PNG/Hitman 1/hitman1_stand.png")
	$LightOccluder2D.occluder = load("res://Scenes/CharacterOcclusion.tres")
	velocity = 1
	disguised = false


func disguise():
	collision_layer = 4
	$Sprite.texture = load("res://GFX/PNG/Tiles/tile_129.png")
	$LightOccluder2D.occluder = load("res://Scenes/Box.Occlusion.tres")
	velocity = 0.25
	disguised = true


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
		if disguised:
			reveal()
		else:
			disguise()
	
	if Input.is_action_just_pressed("ui_select"):
		if night_vision:
			night_vision = false
		else:
			night_vision = true

		emit_signal("vision_mode_change", night_vision)
		get_tree().call_group("npc", "vision_mode_change")
		
