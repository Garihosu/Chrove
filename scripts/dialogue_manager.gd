extends Panel

@export var is_dialogue = false

func _process(delta):
	self.visible = is_dialogue
	
func show_dialogue(text):
	get_tree().paused = true
