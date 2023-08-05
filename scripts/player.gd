extends CharacterBody2D

const SPEED = 1
const RUN = 1

var direction = "down"
var moving = false

func _process(delta):
	var m = SPEED
	moving = false
	
	if Input.is_key_pressed(KEY_X) or Input.is_key_pressed(KEY_SHIFT):
		m += RUN
		
	$AnimationPlayer.speed_scale = m+.2
	
	if Input.is_key_pressed(KEY_UP):
		position.y -= m
		direction = "up"
		moving = true
	if Input.is_key_pressed(KEY_DOWN):
		position.y += m
		direction = "down"
		moving = true
	if Input.is_key_pressed(KEY_LEFT):
		position.x -= m
		direction = "left"
		moving = true
	if Input.is_key_pressed(KEY_RIGHT):
		position.x += m
		direction = "right"
		moving = true
	
	if moving:
		if direction == "up":
			$AnimationPlayer.play("walk_up")
		if direction == "down":
			$AnimationPlayer.play("walk_down")
		if direction == "left":
			$AnimationPlayer.play("walk_left")
		if direction == "right":
			$AnimationPlayer.play("walk_right")
	else:
		if direction == "up":
			$AnimationPlayer.play("idle_up")
		if direction == "down":
			$AnimationPlayer.play("idle_down")
		if direction == "left":
			$AnimationPlayer.play("idle_left")
		if direction == "right":
			$AnimationPlayer.play("idle_right")
		
