extends Panel

@export var is_dialogue = false

var d_index = 0 # Dialogue index
var t_visible = 0 # Text visibility

var c = 0

var spd = 0

var dialogue: Array

func _process(delta):
	self.visible = is_dialogue
	$Label.visible_characters = t_visible
	
	if is_dialogue:
		if c % spd == 0:
			if t_visible != len($Label.text):
				t_visible += 1
		c += 1
		if c == 60: c = 0
	
func show_dialogue(_dialogue, _spd):
	dialogue = _dialogue
	get_tree().paused = true
	$Label.text = dialogue[d_index]
	is_dialogue = true
	spd = _spd
	
func hide_dialogue():
	is_dialogue = false
	d_index = 0
	get_tree().paused = false

func next_dialogue():
	t_visible = 0
	if d_index == dialogue.size()-1:
		hide_dialogue()
	else:
		d_index += 1
		$Label.text = dialogue[d_index]
