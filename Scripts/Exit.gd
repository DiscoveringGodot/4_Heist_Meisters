extends ColorRect



func _on_Area2D_body_entered(body):
	if body.has_node("briefcase"):
		print("you have a briefcase")
