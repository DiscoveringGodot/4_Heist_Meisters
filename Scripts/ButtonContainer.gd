extends GridContainer

func _ready():
	for button in get_tree().get_nodes_in_group("button"):
		button.connect("pressed", get_node("../../.."), "_on_Button_pressed", [button.text])