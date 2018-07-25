extends Popup


# TODO export to editor as single line or array to randomise

func set_text(combination):
	$RichTextLabel.bbcode_text = ("Will you please stop forgetting your entry code?!  I've reset it to " + PoolStringArray(combination).join("") + ".  This is the last time!")
	

