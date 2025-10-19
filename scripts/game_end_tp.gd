extends Area2D

@export var level: int = 0

func _on_body_entered(body: Node2D) -> void:
	if level > Global.progress:
		Global.progress = level
		print("Successfully Completed Level: " + str(Global.progress))
		Global.tokens += Global.score * 0.25
	get_tree().change_scene_to_file("res://scenes/levelselector.tscn")
