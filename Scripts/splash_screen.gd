extends CanvasLayer

var button_action

func _on_StartButton_button_down():
	button_action = get_tree().change_scene(global.level1)
	do_action()


func _on_TutorialButton_pressed():
	button_action = get_tree().change_scene(global.tutorial1)


func _on_QuitButton_button_down():
	button_action = get_tree().quit()
	do_action()


func do_action():
	button_action
