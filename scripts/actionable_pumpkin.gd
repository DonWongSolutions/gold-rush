extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
@onready var pumpkin: AnimatedSprite2D = $"../../pumpkin"
@onready var dark_mode_bg: TileMap = $"../../StaticBody2D/LightMode BG"
@onready var right_boarder: StaticBody2D = $"../../RightBoarder"
@onready var pumpkin_reminder: Label = $"../pumpkin_reminder"


func _ready() -> void:
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	pumpkin_reminder.queue_free()

func _on_dialogue_ended(_resource: DialogueResource) -> void:
	pumpkin.queue_free()
	dark_mode_bg.z_index = -2
	right_boarder.queue_free()
	Global.lv4_pumpkindisappeared = 1
	Global.mission = "Collect 75 Coins"
