extends "res://Scripts/Character.gd"

var detection_distance = 360
onready var Player = get_node("/root/Level1/Player")
onready var sprite = $Sprite
var in_range = false
var npc_sees_player = false
var npc_to_player 
var hit_pos
var me = self


func _ready():
	sprite.modulate = Color(1,1,1,1)


func _physics_process(delta):
		check_fov(delta)
		update()


func check_fov(delta):
	var x_comp = cos(deg2rad(rotation_degrees))
	var y_comp = sin(deg2rad(rotation_degrees))
	var npc_facing = Vector2(x_comp, y_comp)
	npc_to_player = (Player.position - me.position).normalized()

	if (npc_to_player).dot(npc_facing) >0.95:
		check_los(delta)
	else:
		sprite.modulate = Color (1,1,1,1)
		npc_sees_player = false


func check_los(delta):
	var space = get_world_2d().direct_space_state
	var result = space.intersect_ray(me.position, Player.position, [me], collision_mask)
	if result:
		if result.collider == Player && Player.position.distance_to(me.position) < detection_distance:
			sprite.modulate = Color(1,.25,.25,1)
			npc_sees_player = true
			hit_pos = result.position
		else:
			sprite.modulate = Color (1,1,1,1)
			npc_sees_player = false


func _draw():
	if npc_sees_player:
		draw_line(Vector2(), (hit_pos - me.position).rotated(-rotation),Color (1,1,1,1), 1)
	else:
		draw_line(Vector2(), Vector2(),Color (1,1,1,0), 1)