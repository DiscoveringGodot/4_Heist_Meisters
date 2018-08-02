extends Node

var text
var message_number = 0

onready var GUI = $TutorialGui/Popup
onready var message = $TutorialGui/Popup/NinePatchRect/CenterContainer/Label

func _ready():
	add_to_group("interface")
	load_json()
	GUI.show()
	gui_transition()


func load_json():
	var file = File.new()
	file.open(global.tutorial_text, file.READ)
	var content = file.get_as_text()
	text = parse_json(content)
	file.close()


func gui_transition():
	$TutorialGui/AnimationPlayer.play("message_change")
	message.text = text[str(message_number)]
	$TutorialGui/AudioStreamPlayer.play()
	move_marker()
	message_number +=1


func move_marker():
	var marker = $ObjectiveMarkers.get_child(0)
	$ObjectiveMarkers.remove_child(marker)
	$ObjectivePointer.position = marker.position


func _on_MovementComplete_body_entered(body):
	gui_transition()


func _on_InteractionComplete_body_entered(body):
	gui_transition()


func _on_NightvisionComplete_body_entered(body):
	get_tree().call_group("interface", "set_night_vision_off")
	gui_transition()


func set_night_vision_off():
	GUI.show()


func set_night_vision_on():
	GUI.hide()

