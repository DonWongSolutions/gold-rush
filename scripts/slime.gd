extends Node2D

const SPEED = 60
@onready var timer: Timer = $minushealthzone/Timer

var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_left.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_right.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += direction * SPEED * delta

func _on_minushealthzone_body_entered(body: CharacterBody2D) -> void:
	Global.health -= 20
	if Global.health == 0:
			Engine.time_scale = 0.5
			body.get_node("CollisionShape2D").queue_free()
			timer.start()
			Global.health = 100
	else:
		print("Health: ", Global.health)

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	Global.attempts += 1
	Global.score = 0
	Global.mission = "No Mission in Progress"
	print("Player Died, Global Attempts: " + str(Global.attempts))
	get_tree().reload_current_scene()
