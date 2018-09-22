extends NinePatchRect

func _ready():
	visible = false


func collect_loot():
	visible = true
	$LootList.add_icon_item(load(Global.briefcase_sprite), false)