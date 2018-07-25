extends ItemList

func _ready():
	global.disguise_container = self


func refresh(number_disguises):
	clear()
	for i in range(number_disguises):
		add_icon_item(load(global.box_sprite), false)