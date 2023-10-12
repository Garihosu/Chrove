extends CharacterBody2D

@export var direction = "down"

var dialogue = [
	"Sup.",
	"How you doin?"
]

func doAction():
	Global.trigger_dialogue(dialogue)

func _process(delta):
	if direction == "up":
		$AnimationPlayer.play("idle_up")
	if direction == "down":
		$AnimationPlayer.play("idle_down")
	if direction == "left":
		$AnimationPlayer.play("idle_left")
	if direction == "right":
		$AnimationPlayer.play("idle_right")
