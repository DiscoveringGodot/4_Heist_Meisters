extends ItemList

func _ready():
	global.disguise_container = self

func refresh(number_disguises):
	clear()
	var items = 0
	while items < number_disguises:
		add_icon_item(load(global.box_sprite), false)
		items +=1