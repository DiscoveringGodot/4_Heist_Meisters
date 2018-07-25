extends Popup

onready var door = (get_parent().get_parent())
onready var display = $VSplitContainer/CenterContainer/Display
onready var light = $VSplitContainer/CenterContainer2/GridContainer/Light
var guess =[]
func _ready():
	reset_lock()

func enter(button):
	$AudioStreamPlayer.stream = load(global.tone_1)
	guess.append(button)
	$AudioStreamPlayer.play()
	update_display()


func update_display():
	display.bbcode_text ="[center]" + PoolStringArray(guess).join("") + "[/center]"
	if guess.size() == door.combination.size():
		check_guess()


func check_guess():
	if guess == door.combination:
		$Timer.start()
		light.texture = load(global.green_light)
	else:
		reset_lock()


func reset_lock():
	light.texture = load(global.red_light)
	guess = []
	display.bbcode_text = ""


func _on_Button1_pressed():
	enter(1)


func _on_Button2_pressed():
	enter(2)


func _on_Button3_pressed():
	enter(3)


func _on_Button4_pressed():
	enter(4)


func _on_Button5_pressed():
	enter(5)


func _on_Button6_pressed():
	enter(6)


func _on_Button7_pressed():
	enter(7)


func _on_Button8_pressed():
	enter(8)


func _on_Button9_pressed():
	enter(9)


func _on_Button0_pressed():
	enter(0)


func _on_Enter_pressed():
	check_guess()


func _on_Timer_timeout():
	$AudioStreamPlayer.stream = load(global.tone_2)
	$AudioStreamPlayer.play()
	door.open("")
