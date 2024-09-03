extends Control

@onready var voltar: Button = $VBoxContainer/Voltar
@onready var reiniciar: Button = $VBoxContainer/Reiniciar
@onready var menu_inicial: Button = $VBoxContainer/Menu_inicial
@onready var sair: Button = $VBoxContainer/Sair

func _ready() -> void:
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS
	voltar.disabled = true
	reiniciar.disabled = true
	menu_inicial.disabled = true
	sair.disabled = true

func _process(delta: float) -> void:
	if Input.is_action_pressed("Pause"):
		visible = true
		voltar.disabled = false
		reiniciar.disabled = false
		menu_inicial.disabled = false
		sair.disabled = false
		get_tree().paused = true

func _on_sair_pressed() -> void:
	get_tree().paused = false
	get_tree().quit()

func _on_menu_inicial_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://UI/tela_inicial.tscn")

func _on_reiniciar_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_voltar_pressed() -> void:
	get_tree().paused = false
	visible = false
	voltar.disabled = false
	reiniciar.disabled = false
	menu_inicial.disabled = false
	sair.disabled = false
