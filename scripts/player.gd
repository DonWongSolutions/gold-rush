extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -300.0
const FIREBALL = preload("res://scenes/fireball.tscn")

@onready var actionable_finder: Area2D = $ActionableFinder
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
			

	if Input.is_action_just_pressed("action"):
		print("e detected")
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Nah not gonna add any comments bro
	# Ts so tuff
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
		
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")	
	else:
		animated_sprite_2d.play("jump")

	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	fire()
	move_and_slide()

func fire():
	if Input.is_action_just_pressed("fire"):
		if Global.roundcount > 0:
			var direction = 1 if not animated_sprite_2d.flip_h else -1
			var f = FIREBALL.instantiate()
			f.direction = direction
			get_parent().add_child(f)
			f.position.y = position.y - 10
			f.position.x = position.x + 25 * direction
			Global.roundcount -= 1
			print("Round Count: ", Global.roundcount)
		else:
			pass
