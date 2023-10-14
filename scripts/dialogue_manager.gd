extends Panel

@export var is_dialogue = false

var d_index = 0 # Dialogue index
var t_visible = 0 # Text visibility

var c = 0

var spd = 0

var dialogue: Array

var choices = []
var allow_choice = false
var choice = 0

func _process(_delta):
	self.visible = is_dialogue
	$Label.visible_characters = t_visible
	
	if is_dialogue:
		if c % spd == 0:
			if t_visible != len($Label.text):
				t_visible += 1
			else:
				if choices != []:
					allow_choice = true
		c += 1
		if c == 60: c = 0
		
	if allow_choice:
		var l = len(choices)
		if l >= 0:
			$Choice1.visible = true
			$Choice1/Label.text = choices[0]
		if l >= 1:
			$Choice2.visible = true
			$Choice1/Label.text = choices[1]
		if l >= 2:
			$Choice3.visible = true
			$Choice1/Label.text = choices[2]
		if l == 3:
			$Choice4.visible = true
			$Choice1/Label.text = choices[3]
		
		if Input.is_key_pressed(KEY_LEFT):
			if choice == 0: choice = l
			else: choice -= 1
		if Input.is_key_pressed(KEY_RIGHT):
			if choice == l: choice = 0
			else: choice += 1
			
		var a: Panel	
		if choice == 0:
			a = $Choice1
		if choice == 1:
			a = $Choice2
		if choice == 2:
			a = $Choice3
		if choice == 3:
			a = $Choice4
		a.get_child(0).uppercase = true
	else:
		$Choice1.visible = false
		$Choice2.visible = false
		$Choice3.visible = false
		$Choice4.visible = false
	
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
		if typeof(dialogue[d_index]) == TYPE_INT:
			d_index += 1
			for n in range(0, dialogue[d_index-1]):
				print("added")
				choices.append(dialogue[d_index])
				d_index += 1
		else:
			$Label.text = dialogue[d_index]
