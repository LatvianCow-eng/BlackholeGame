extends CharacterBody2D

var speed := 300

var dash_goal : Vector2
var dashing = false
var dash_ready = true

var bh : Sprite2D

func _physics_process(delta):
	bh = Global.blackhole_sprite
	if !Global.loss:
		blackhole_pull()
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		if Input.is_action_just_pressed("Dash"):
			if !dashing and dash_ready:
				velocity.x = move_toward(velocity.x, 0, speed)
				velocity.y = move_toward(velocity.y, 0, speed)
				dash_goal = position + direction * 200
				dashing = true
				
		if dashing:
			%anim.speed_scale = 3
			position += position.direction_to(dash_goal) * 15
			if position.distance_to(dash_goal) < 20:
				dashing = false
				%anim.speed_scale = 1
				dash_ready = false
				$"Dash timer".start()
				
		else:
			if direction:
				#flip player
				if direction.x > 0:
					%anim.flip_h = false
				elif direction.x < 0:
					%anim.flip_h = true
					
				#move player
				velocity = direction * speed
				
				#animate player
				if %anim.animation != "Walking" or "Dash":
					%anim.animation = "Walking"
			else:
				#stop player
				velocity.x = move_toward(velocity.x, 0, speed)
				velocity.y = move_toward(velocity.y, 0, speed)
				#animate player
				if %anim.animation != "Idle" or "Dash":
					%anim.animation = "Idle"
				
			move_and_slide()

func blackhole_pull():
	position += position.direction_to(Vector2(bh.position.x, bh.position.y)) * bh.scale / 2

func _on_area_2d_body_entered(body):
	Global.loss = true
	z_index = 3
	%anim.animation = "Loss"
	for n in 125:
		await get_tree().create_timer(0.008).timeout
		bh.scale += Vector2(0.05, 0.05)


func _on_dash_timer_timeout():
	dash_ready = true
