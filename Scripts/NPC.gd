extends "res://Scripts/Character.gd"

var detection_distance = 360
onready var Player = get_node("/root/Level1/Player")
onready var light = $Light2D
var in_range = false
var npc_sees_player = false
var npc_to_player 
var hit_pos

const RED = Color(1,.25,.25,1)
const WHITE = Color(1,1,1,1)


func _ready():
	light.color = WHITE

func _physics_process(delta):
		check_fov(delta)
		update()


func check_fov(delta):
	var x_comp = cos(deg2rad(global_rotation_degrees))
	var y_comp = sin(deg2rad(global_rotation_degrees))
	var npc_facing = Vector2(x_comp, y_comp)
	npc_to_player = (Player.position - global_position).normalized()

	if (npc_to_player).dot(npc_facing) >0.95:
		check_los()
	else:
		light.color = WHITE
		npc_sees_player = false


func check_los():
	var space = get_world_2d().direct_space_state
	var result = space.intersect_ray(global_position, Player.global_position, [self], collision_mask)
	if result:
		var player_within_range = Player.global_position.distance_to(global_position) < detection_distance
		if result.collider == Player && player_within_range:
			light.color = RED
			return true
#			hit_pos = result.position
		else:
			light.color = WHITE
			return false


#func _draw():
#	if check_los():
#		draw_line(Vector2(), (hit_pos - global_position).rotated(-global_rotation),WHITE, 1)
#	else:
#		draw_line(Vector2(), Vector2(),Color (1,1,1,0), 1)