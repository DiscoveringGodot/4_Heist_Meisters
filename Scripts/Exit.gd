extends ColorRect


func _on_Area2D_body_entered(body):
	if body.has_node("briefcase"):
		global.canvas_modulate.hide()
		get_tree().change_scene(global.GameWon)
