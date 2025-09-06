extends CharacterBody2D

@export var bh : Sprite2D
@export var bh_area : Area2D

var speed := 300

func _physics_process(delta):
	blackhole_pull()
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		
		#flip player
		if direction.x > 0:
			%anim.flip_h = false
		elif direction.x < 0:
			%anim.flip_h = true
			
		#move player
		velocity = direction * speed
		
		#animate player
		if %anim.animation != "Walking":
			%anim.animation = "Walking"
	else:
		#stop player
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
		#animate player
		if %anim.animation != "Idle":
			%anim.animation = "Idle"
		
	move_and_slide()

func blackhole_pull():
	position += position.direction_to(Vector2(bh.position.x, bh.position.y)) * bh.scale / 2
