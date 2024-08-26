extends RigidBody2D

var velX : float
var velY : float

# REDO all the logic here

# Called when the node enters the scene tree for the first time.
func _ready():
	#print('reiniciou!!!!!!')
	#visible = true
	var startYposition = randi_range(-20, 20)
	position = Vector2(0, startYposition)
	
	var randX = randi_range(-100, 99)
	var randY = randi_range(-100, 99)
	velX = 80 if randX >= 0 else -80
	velY = 80 if randY >= 0 else -80
	#print('velocidade: ', velX, velY)
	# para a bola não perder velocidade
	linear_damp = 0
	angular_damp = 0
	# desabilitar gravidade
	gravity_scale = 0
	# setar velocidade
	set_axis_velocity(Vector2(velX, velY))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	#print('colisão detectada')
	print('velocidade: ', velX, velY)
	#print('gravity: ', gravity_scale)
	#print('linear_d: ', linear_damp)
	print(body)
	
	if is_instance_of(body, CharacterBody2D):
		print('Colidiu com o player')
		if velX < 0:
			velX -= 10
		else:
			velX += 10
		
		if velY < 0:
			velY -=10
		else:
			velY += 10
		
		velX = -velX
		velY = velY
		
		print('velocidade 2: ', velX, velY)
		
	else:
		velX = velX
		velY = -velY
	
	set_axis_velocity(Vector2(velX, velY))
	print('velocidade: ', velX, velY)


	
