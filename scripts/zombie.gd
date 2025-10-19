extends CharacterBody2D

const SPEED = 30
@onready var timer: Timer = $minushealthzone/Timer

var direction = 1
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# The old Area2D signal handler has been removed because the fireball handles the collision.

func _process(delta: float) -> void:
	# --- Movement logic ---
	if ray_cast_left.is_colliding():
		direction = -1
		animated_sprite_2d.animation = "left"
	if ray_cast_right.is_colliding():
		direction = 1
		animated_sprite_2d.animation = "right"
	
	# Simple movement for a non-physics-simulated enemy
	position.x += direction * SPEED * delta
	
	# If you want the Zombie to use CharacterBody2D movement:
	# velocity.x = direction * SPEED
	# move_and_slide() 

func _on_minushealthzone_body_entered(body: CharacterBody2D) -> void:
	# This function handles the Player touching the minushealthzone (Area2D)
	Global.health -= 50
	if Global.health == 0:
			Engine.time_scale = 0.5
			# NOTE: This line might need updating depending on your player scene structure:
			body.get_node("CollisionShape2D").queue_free()
			timer.start()
			Global.health = 100
	else:
		print("Health: ", Global.health)

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	Global.reset_for_die()
	get_tree().reload_current_scene()
