extends Popup


onready var display = $VSplitContainer/DisplayContainer/Display
onready var light = $VSplitContainer/ButtonContainer/ButtonGrid/Light

var combination = []
var guess = []

signal combination_correct

func _ready():
	connect_buttons()
	reset_lock()

func connect_buttons():
	for child in $VSplitContainer/ButtonContainer/ButtonGrid.get_children():
		if child is Button:
			child.connect("pressed", self, "_on_Button_pressed", [child.text])

func _on_Button_pressed(button):
	if button == "Ok":
		check_guess()
	else:
		enter(int(button))


func check_guess():
	if guess == combination:
		$AudioStreamPlayer.stream = load("res://SFX/threeTone1.ogg")
		$AudioStreamPlayer.play()
		light.texture = load(Global.green_light)
		$Timer.start()
	else:
		reset_lock()


func enter(button):
	$AudioStreamPlayer.stream = load("res://SFX/twoTone1.ogg")
	$AudioStreamPlayer.play()
	guess.append(button)
	update_display()
	
	
func reset_lock():
	light.texture = load(Global.red_light)
	display.clear()
	guess.clear()
	
	
func update_display():
	display.bbcode_text = "[center]" + PoolStringArray(guess).join("") + "[/center]"
	if guess.size() == combination.size():
		check_guess()


func _on_Timer_timeout():
	emit_signal("combination_correct")
	hide()
	reset_lock()
