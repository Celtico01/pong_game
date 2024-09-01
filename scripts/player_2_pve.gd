extends CharacterBody2D

var SPEED = 190 # Valor ajustado para SPEED
@onready var ball_pro_2: Area2D = %ball_pro_2

func _physics_process(delta: float) -> void:
	velocity.y = 0
	
	if ball_pro_2.position[1] > position[1] and (ball_pro_2.position[0] > 21 or ball_pro_2.position[0] < -35):
		velocity.y = SPEED
	elif (ball_pro_2.position[1]) < position[1] and (ball_pro_2.position[0] > 21 or ball_pro_2.position[0] < -35):
		velocity.y = -SPEED 
		
	move_and_slide()
