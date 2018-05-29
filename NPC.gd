extends KinematicBody2D

var motion = Vector2()

var detection_distance = 250
onready var Player = get_parent().get_node("Player")
var in_range = false


func _ready():
	$Sprite.modulate = Color(1,1,1,1)

func _process(delta):

	check_los(delta)
#
#func check_distance():
#	var distance = MyLoc.distance_to(PlayerLoc)
#	if distance < detection_distance:
#		in_range = true
##		look_at(PlayerLoc)
#	else:
#		in_range = false


#func check_move(delta):
#	if in_range:
#		check_los(delta)

func check_los(delta):
	var npc_to_player = (Player.position - position).normalized()
	var x_comp = cos(deg2rad(rotation_degrees))
	var y_comp = sin(deg2rad(rotation_degrees))
	var npc_facing = Vector2(x_comp, y_comp)
#	print ("npc_to_player " , npc_to_player)
	print (npc_facing)
#	if npc_to_player.dot() >0:
#		$Sprite.modulate = Color(1,.25,.25,1)
##		move(delta)
#	else:
#		$Sprite.modulate = Color(1,1,1,1)
#
#func move(delta):
#	motion = (PlayerLoc - MyLoc) * delta 
#	move_and_collide(motion)