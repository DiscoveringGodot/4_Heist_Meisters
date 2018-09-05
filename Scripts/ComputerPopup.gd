extends Popup

func set_text(combination):
	$RichTextLabel.bbcode_text = ("Will you stop forgetting your access code?  I've set it to " 
			+ PoolStringArray(combination).join("") + ", but this is the last time!")