extends Node

var score = 0
var health = 100

@onready var score_board: Label = $ScoreBoard

func add_score():
	Global.score += 1
	print(Global.score)
	score_board.text = "Score: " + str(Global.score) + " coins."
	
func remove_score():
	Global.score -= 1
	print(score)

func dehealth():
	Global.health -= 20
	print("Health: ", Global.health)
	
