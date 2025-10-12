extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
@onready var pirate: AnimatedSprite2D = $"../../pirate"
@onready var pirate_reminder: Label = $"../pirate_reminder"


func _ready() -> void:
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	pirate_reminder.queue_free()

func _on_dialogue_ended(_resource: DialogueResource) -> void:
	if Global.lv4_pumpkindisappeared == 0:
		pass
	else:
		pirate.queue_free()
		print("Pirate disappeared")
		Global.scoremultiplier = 2
		Global.multiplieruses = 20
		Global.health = 100
