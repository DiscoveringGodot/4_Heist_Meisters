extends "res://Scripts/Character.gd"

onready var Player = get_node("/root/Level1/Player")
onready var light = $Light2D

const DETECTION_DISTANCE = 360
const FOV_TOLERANCE = 0.95
const RED = Color(1,.25,.25,1)
const WHITE = Color(1,1,1,1)



func _process(delta):
	if player_in_fov() && player_in_los():
		light.color = RED
	else:
		light.color = WHITE

func player_in_los():
	var space = get_world_2d().direct_space_state
	var result = space.intersect_ray(global_position, Player.global_position, [self], collision_mask)
	if not result : return false
	
	var distance_to_player = Player.global_position.distance_to(global_position) 
	var player_within_range = distance_to_player < DETECTION_DISTANCE
	if result.collider == Player && player_within_range:
		return true
#			hit_pos = result.position
	else:
		return false

func player_in_fov():
	var x_comp = cos(deg2rad(global_rotation_degrees))
	var y_comp = sin(deg2rad(global_rotation_degrees))
	var npc_facing = Vector2(x_comp, y_comp)

	var npc_to_player = (Player.position - global_position).normalized()

	if (npc_to_player).dot(npc_facing) > FOV_TOLERANCE:
		return true
	else:
		return false

#func _draw():
#	if check_los():
#		draw_line(Vector2(), (hit_pos - global_position).rotated(-global_rotation),WHITE, 1)
#	else:
#		draw_line(Vector2(), Vector2(),Color (1,1,1,0), 1)