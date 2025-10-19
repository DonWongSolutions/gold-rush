extends CharacterBody2D

const SPEED = 400
var direction = 1

func _ready() -> void:
	velocity.x = SPEED * direction 
	
func _physics_process(delta: float) -> void:
	
	if is_on_wall():
		queue_free()
		return 

	move_and_slide()
	_perform_collision_check()
	velocity.x = SPEED * direction

func _perform_collision_check() -> void:
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var body = collision.get_collider()
		
		if body.is_in_group("enemies"):
			body.queue_free() 
			Global.score += 5
			queue_free() 
			return
