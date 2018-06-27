extends "res://Scripts/Character.gd"

onready var Player = get_node("/root/Level1/Player")
onready var light = $Light2D

const DETECTION_DISTANCE = 340
const FOV_TOLERANCE = 22
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
	else:
		return false
#	var hit_pos = result.global_position


func player_in_fov():
	var npc_facing_direction = Vector2(1,0).rotated(global_rotation)
	var direction_to_player = (Player.position - global_position).normalized()

	if abs(direction_to_player.angle_to(npc_facing_direction)) < deg2rad(FOV_TOLERANCE):
		return true
	else:
		return false


func vision_mode_change():
	if night_vision:
		light.enabled = false
	else:
		light.enabled = true


#func _draw():
#	if check_los():
#		draw_line(Vector2(), (hit_pos - global_position).rotated(-global_rotation),WHITE, 1)
#	else:
#		draw_line(Vector2(), Vector2(),Color (1,1,1,0), 1)