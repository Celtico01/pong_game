extends Control

func _on_fechar_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/tela_inicial.tscn")
