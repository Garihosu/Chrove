extends Panel

var paused = false

func _ready():
	visible = false

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		if paused:
			unpause()
		else:
			pause()
			
func pause():
	visible = true
	get_tree().paused = true
	print("paused")
	paused = true
	
func unpause():
	visible = false
	get_tree().paused = false
	print("unpaused")
	paused = false
