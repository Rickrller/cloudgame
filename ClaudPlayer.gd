extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
const speed = 1000.0
const accel = 0.5

var input : Vector2

func get_input():
	input.x = Input.get_action_strength("PlayerMoveRight") - Input.get_action_strength("PlayerMoveLeft") 
	input.y = Input.get_action_strength("PlayerMoveDown") - Input.get_action_strength("PlayerMoveUp") 
	return input.normalized()
	
func _process(delta):
	var playerInput = get_input()
	
	velocity = lerp(velocity, playerInput * speed, delta * accel)
	
	move_and_slide()
