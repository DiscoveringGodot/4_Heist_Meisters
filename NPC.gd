extends KinematicBody2D

var motion = Vector2()

var detection_distance = 250
onready var Player = get_parent().get_node("Player")
var in_range = false
var npc_sees_player = false
var npc_to_player 
var hit_pos

func _ready():
	
	$Sprite.modulate = Color(1,1,1,1)

func _physics_process(delta):
		check_fov(delta)
		update()

func check_fov(delta):
	var x_comp = cos(deg2rad(rotation_degrees))
	var y_comp = sin(deg2rad(rotation_degrees))
	var npc_facing = Vector2(x_comp, y_comp)
	npc_to_player = (Player.position - position).normalized()

	if (npc_to_player).dot(npc_facing) >0.5:
		check_los(delta)
	else:
		$Sprite.modulate = Color (1,1,1,1)
		npc_sees_player = false
	
func check_los(delta):
	var space = get_world_2d().direct_space_state
	var result = space.intersect_ray(position, Player.position, 
			[self], collision_mask)
	if result:
		if result.collider == Player:
			$Sprite.modulate = Color(1,.25,.25,1)
			npc_sees_player = true
			hit_pos = result.position
#			rotation = (Player.position - position).angle()
		else:
			$Sprite.modulate = Color (1,1,1,1)
			npc_sees_player = false
	
func _draw():
	if npc_sees_player:
		draw_line(Vector2(), (hit_pos - position).rotated(-rotation),Color (1,1,1,1), 1)
	else:
		draw_line(Vector2(), Vector2(),Color (1,1,1,0), 1)
#		if collider == Player:
#			$Sprite.modulate = Color(1,.25,.25,1)
#	else:
#		npc_sees_player = false
#			$Sprite.modulate = Color(1,1,1,1)

#func move(delta):
#	motion = (PlayerLoc - MyLoc) * delta 
#	move_and_collide(motion)