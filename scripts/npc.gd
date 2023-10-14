extends CharacterBody2D

@export var player: CharacterBody2D

@export var direction = "down"

@export var d_spd = 2

@export var dialogue = [
	"Sup.",
	"How you doin?"
]

func doAction():
	direction = Global.opposite(player.direction)
	player.trigger_dialogue(dialogue, d_spd)

func _process(_delta):
	if direction == "up":
		$AnimationPlayer.play("idle_up")
	if direction == "down":
		$AnimationPlayer.play("idle_down")
	if direction == "left":
		$AnimationPlayer.play("idle_left")
	if direction == "right":
		$AnimationPlayer.play("idle_right")
