extends Control

func _on_pv_p_pressed() -> void:
	# inicia modo pvp
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_pv_e_pressed() -> void:
	# inicial modo pve
	get_tree().change_scene_to_file("res://scenes/game_pve.tscn")

	

func _on_controles_pressed() -> void:
	# inicia janela dos controles
	get_tree().change_scene_to_file("res://UI/tela_controles.tscn")


func _on_sair_pressed() -> void:
	get_tree().quit()
