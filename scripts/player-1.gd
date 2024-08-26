extends CharacterBody2D

var SPEED = -230

func _physics_process(delta):
	if Input.is_action_pressed('move_up_p1'):
		velocity.y = SPEED
	elif Input.is_action_pressed('move_down_p1'):
		velocity.y = -SPEED
	else:
		velocity.y = 0
	
	move_and_slide()
