extends Node

@onready var current_scene = get_tree().get_root().get_child(1)
@onready var player = get_tree().get_root().get_child(1).get_node("Player")

func opposite(dir):
	if dir == "up":
		return "down"
	elif dir == "down":
		return "up"
	elif dir == "left":
		return "right"
	elif dir == "right":
		return "left"
