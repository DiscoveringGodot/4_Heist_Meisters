extends Node

var suspicion = 0
var max_suspicion = 100
var suspicion_step = 3 # how much will suspicion rise by every tick
var suspicion_degrade_step = 0.25 # how much will suspicion degrade by every tick

func _process(delta):
	degrade_suspicion()
	global.suspicion_meter.value = suspicion
	check_game_lost()
	

func player_seen():
	suspicion += suspicion_step


func degrade_suspicion():
	if not suspicion == 0:
		suspicion -= suspicion_degrade_step

func check_game_lost():
	if suspicion > max_suspicion:
		global.canvas_modulate.color = Color(1,1,1,1)
		get_tree().change_scene(global.GameLost)