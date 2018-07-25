extends Container


func _on_AgainButton_pressed():
	get_tree().change_scene(global.level1)

	
func _on_QuitButton_pressed():
	get_tree().quit()
