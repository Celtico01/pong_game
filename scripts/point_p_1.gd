extends Area2D

@onready var game_manager: Node = %GameManager
@onready var ball_pro_2: Node2D = %ball_pro_2
@onready var timer: Timer = $Timer
@onready var ray_cast_2d: RayCast2D = $RayCast2D

var body

func _process(delta: float) -> void:
	if ray_cast_2d.is_colliding():
		print('bola colidiu com a zona de ponto do p1')
		ball_pro_2.visible = false
		timer.start()

func _on_timer_timeout() -> void:
	print('deu bom!')
	ball_pro_2.position.x = 0
	ball_pro_2.position.y = 0
