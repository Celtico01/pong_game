extends Node

var score_p1 = 0
var score_p2 = 0

@onready var score_p_1: Label = $Score_p1
@onready var score_p_2: Label = $Score_p2

func add_point(player : int):
	if player == 1:
		score_p1 += 1
		score_p_1.text = str(score_p1)
	if player == 2:
		score_p2 += 1
		score_p_2.text = str(score_p2)
