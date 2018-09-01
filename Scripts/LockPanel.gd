extends Popup

onready var display = $VSplitContainer/CenterContainer/Display
onready var light = $VSplitContainer/CenterContainer2/GridContainer/Light

var guess =[]
var combination = []

signal combination_correct

func _ready():
	connect_buttons()
	reset_lock()


func enter(button):
	$AudioStreamPlayer.stream = load(global.tone_1)
	guess.append(button)
	$AudioStreamPlayer.play()
	update_display()


func update_display():
	display.bbcode_text ="[center]" + PoolStringArray(guess).join("") + "[/center]"
	if guess.size() == combination.size():
		check_guess()


func check_guess():
	if guess == combination:
		$Timer.start()
		light.texture = load(global.green_light)
	else:
		reset_lock()


func reset_lock():
	light.texture = load(global.red_light)
	guess = []
	display.bbcode_text = ""

func connect_buttons():
	for button in $VSplitContainer/CenterContainer2/GridContainer.get_children():
		if button is Button:
			button.connect("pressed", self, "_on_Button_pressed", [button.text])


func _on_Button_pressed(button):
	if button == "Ok":
		check_guess()
	else:
		enter(int(button))


func _on_Timer_timeout():
	$AudioStreamPlayer.stream = load(global.tone_2)
	$AudioStreamPlayer.play()
	emit_signal("combination_correct")
