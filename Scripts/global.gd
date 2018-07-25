extends Node

#nodes - automatically set
var player
var suspicion_meter
var canvas_modulate
var disguise_container


#sprite paths - MUST be set MANUALLY
var player_sprite = "res://GFX/PNG/Hitman 1/hitman1_stand.png"
var player_occlusion = "res://Scenes/Occlusion/CharacterOcclusion.tres"
var box_sprite = "res://GFX/PNG/Tiles/tile_129.png"
var box_occluder = "res://Scenes/Occlusion/Box.Occlusion.tres"
var green_light = "res://GFX/Interface/PNG/dotGreen.png"
var red_light = "res://GFX/Interface/PNG/dotRed.png"
var briefcase_sprite = "res://GFX/Loot/suitcase.png"

#SFX paths - MUST be set MANUALLY
var tone_1 = "res://SFX/twoTone1.ogg"
var tone_2 = "res://SFX/threeTone1.ogg"

#Scene paths - MUST be set MANUALLY
var GameLost = "res://Scenes/GameLost.tscn"
var GameWon = "res://Scenes/GameWon.tscn"
var level1 = "res://Scenes/Level1.tscn"