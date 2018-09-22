extends ItemList

func _ready():
	visible = false

func collect_loot():
	add_icon_item(load(Global.briefcase_sprite), false)