	# Global.gd
extends Node

var score = 0
var attempts = 0
var health = 100
var scoremultiplier = 1
var multiplieruses = 0
var lv4_pumpkindisappeared = 0
var mission = "No Mission in Progress"
var missionsuccess = 0
var roundcount = 100
var tokens = 0
var progress = 0
var bypass = 0

func reset_for_die():
	score = 0
	attempts += 1
	health = 100
	scoremultiplier = 1
	multiplieruses = 0
	lv4_pumpkindisappeared = 0
	mission = "No Mission in Progress"
	missionsuccess = 0
	print("Player Dead. Attempts: " + str(attempts) + " Tokens: " + str(tokens) + " Progress: Level " + str(progress))
