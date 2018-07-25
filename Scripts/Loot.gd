extends Sprite


func _on_Area2D_body_entered(body):
	global.player.collect_briefcase()
