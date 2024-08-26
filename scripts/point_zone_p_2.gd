extends Area2D

@onready var timer = $Timer
@onready var game_manager: Node = %GameManager


func _on_body_entered(body):
	timer.start()

	


func _on_timer_timeout():
	print('timer_funcionando') # implementar logica de pontuação e restart
	print('+ 1 point to P2')
	#game_manager.add_point(2)
