extends Node

var suspicion = 0
var max_suspicion = 100
var suspicion_step = 1.5   # how much will suspicion rise by every tick TODO frame rate independant
var suspicion_degrade_step = 0.23  # how much will suspicion degrade by every tick

func _process(delta):
	degrade_suspicion()
	global.suspicion_meter.value = suspicion
	handle_game_loss()
	

func player_seen():
	suspicion += suspicion_step


func degrade_suspicion():
	if not suspicion <= 0:  # in case misses 0
		suspicion -= suspicion_degrade_step


func handle_game_loss():
	if suspicion > max_suspicion:
		get_tree().change_scene(global.GameLost)