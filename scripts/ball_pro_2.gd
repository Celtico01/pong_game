extends Area2D

@onready var ray_cast_down: RayCast2D = $RayCast_Down
@onready var ray_cast_left: RayCast2D = $RayCast_Left
@onready var ray_cast_up: RayCast2D = $RayCast_Up
@onready var ray_cast_right: RayCast2D = $RayCast_Right
@onready var game_manager: Node = %GameManager
@onready var h_player: AudioStreamPlayer2D = $"H-Player"
@onready var h_wall: AudioStreamPlayer2D = $"H-Wall"
@onready var point: AudioStreamPlayer2D = $Point


var SPEED = 80
var limite_h_l = -85
var limite_h_r = 85
var is_hiden = false

var direcao_h
var direcao_v
var rand_D_V = 0

func _ready() -> void:
	var randX = randi_range(-100, 99)
	var randY = randi_range(-100, 99)
	
	direcao_h = 1 if randX >= 0 else -1
	direcao_v = -1 if randY >= 0 else 1

func _process(delta: float) -> void:
	if position.x < limite_h_l and not is_hiden:
		visible = false
		is_hiden = true
		game_manager.add_point(2)
		point.play()
		await get_tree().create_timer(1.0).timeout
		visible = true
		position.x = 0
		position.y = 0
		is_hiden = false

	if position.x > limite_h_r and not is_hiden:
		visible = false
		#evita que executa varias vezes
		is_hiden = true
		#adicioanr ponto no gameManager
		game_manager.add_point(1)
		#toca o som de ponto
		point.play()
		#espera um segundo para recomeçar
		await get_tree().create_timer(1.0).timeout
		visible = true
		position.x = 0
		position.y = 0
		is_hiden = false

	if is_hiden:
		SPEED = 80
		rand_D_V = randf_range(0.0, 0.4)
		
	if ray_cast_down.is_colliding():
		h_wall.play()
		direcao_v = -1
		
	if ray_cast_up.is_colliding():
		h_wall.play()
		direcao_v = 1
		
	if ray_cast_left.is_colliding():
		h_player.play()
		direcao_h = 1
		SPEED += 5
		
	if ray_cast_right.is_colliding():
		h_player.play()
		direcao_h = -1
		SPEED += 5
	
	position.x += direcao_h * SPEED * delta 
	position.y += (direcao_v + rand_D_V) * SPEED * delta
