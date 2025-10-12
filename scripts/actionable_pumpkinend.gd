extends Area2D

@export var dialogue_yes: DialogueResource
@export var dialogue_yes_start: String = "start"
@export var dialogue_no: DialogueResource
@export var dialogue_no_start: String = "start"
@onready var pumpkinend: AnimatedSprite2D = $".."
@onready var dark_mode_bg: TileMap = $"../../StaticBody2D/LightMode BG"
@onready var pumpkin_reminder: Label = $"../pumpkin_reminder"


func _ready() -> void:
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func action() -> void:
	if Global.score > 74:
		DialogueManager.show_example_dialogue_balloon(dialogue_yes, dialogue_yes_start)
		pumpkin_reminder.queue_free()
		Global.missionsuccess = 1
		Global.score -= 75
	else:
		DialogueManager.show_example_dialogue_balloon(dialogue_no, dialogue_no_start)
		Global.missionsuccess = -1
func _on_dialogue_ended(_resource: DialogueResource) -> void:
	if Global.missionsuccess == 1:
		pumpkinend.queue_free()
		dark_mode_bg.z_index = 1
		Global.mission = "No Mission in Progress"
	elif Global.missionsuccess == -1:
		Global.attempts += 1
		Global.score = 0
		Global.missionsuccess = 0
		Global.mission = "No Mission in Progress"
		print("Player Died, Global Attempts: " + str(Global.attempts))
		get_tree().reload_current_scene()
