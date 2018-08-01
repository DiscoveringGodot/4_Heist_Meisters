extends CanvasLayer


func _on_StartButton_button_down():
	get_tree().change_scene(global.level1)


func _on_QuitButton_button_down():
	get_tree().quit()
