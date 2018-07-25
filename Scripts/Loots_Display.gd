extends Control

func _ready():
	visible = false

func add_loot(item):
	visible = true
	$NinePatchRect/LootContainer.add_icon_item(load(global.briefcase_sprite), false)