extends Control

onready var scoreText = get_node("ColorRect/ScoreText")

func set_score_text(score):
	scoreText.text = str(score```)
