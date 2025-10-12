extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	Global.attempts += 1
	Global.score = 0
	Global.health = 100
	Global.mission = "No Mission in Progress"
	print("Player Died, Global Attempts: " + str(Global.attempts))
	get_tree().reload_current_scene()
