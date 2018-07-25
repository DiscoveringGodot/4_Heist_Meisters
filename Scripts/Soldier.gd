extends "res://Scripts/DetectPlayer.gd"

var motion = Vector2()
var possible_destinations = []
var path = []
var destination = Vector2()
onready var navigation = get_node("/root/Level1/Navigation2D")

func _ready():
	possible_destinations = navigation.get_children()
	possible_destinations.pop_back()
	make_path()


func _physics_process(delta):
	navigate()


func make_path():
	randomize()
	var next_destination = possible_destinations[randi() % possible_destinations.size()]
	path = navigation.get_simple_path(position, next_destination.get_global_position(), false)
	
func update_path():
	if path.size() == 1:
		if  $Timer.is_stopped():
			$Timer.start()
	else: 
		path.remove(0)


func navigate():
	var distance = position.distance_to(path[0])
	destination = path[0]
	if distance > 5:
		move()
	else:
		update_path()

func move():
	look_at(destination)
	motion = (destination-position).normalized() * (MAX_SPEED /2)
	if is_on_wall():
		make_path()
	move_and_slide(motion)


func timeout():
		make_path()