extends CharacterBody2D

var delta_time = 0

@onready var rock_hit_sound: AudioStreamPlayer2D = $Rock_hit_sound

var bh : Sprite2D
var player : PhysicsBody2D

var rock_hp = 3
var took_dash_damage = false
var target_destination : Vector2

func _ready():
	scale.x = 1.8 + randf() * 0.4
	scale.y = scale.x
	if randf() < 0.5:
		$AnimatedSprite2D.flip_h = true

func _physics_process(delta):
	if !Global.dash_started:
		took_dash_damage = false
	delta_time = delta
	bh = Global.blackhole_sprite
	player = Global.player_body 
	if target_destination:
		position.x += move_toward(0, target_destination.x, abs(target_destination.x) * 0.15)
		target_destination.x *= 0.85
		if abs(target_destination.x) < 10:
			target_destination.x = 0
		position.y += move_toward(0, target_destination.y, abs(target_destination.y) * 0.15)
		target_destination.y *= 0.85
		if abs(target_destination.y) < 10:
			target_destination.y = 0
	blackhole_pull()
	
func blackhole_pull():
	position += position.direction_to(Vector2(bh.position.x, bh.position.y)) * pow(bh.scale.x + 0.5, 2) * 30 * delta_time
	var distance_to_bh = position.distance_to(Vector2(bh.position.x, bh.position.y))
	var bh_size = bh.scale.x * 100 - 6 * scale.x
	if distance_to_bh < bh_size:
		if rock_hp == 1:
			Global.grow_blackhole(3 * scale.x)
		else:
			Global.grow_blackhole(6 * scale.x)
		queue_free()

func _on_rock_area_body_exited(player):
	if Global.dash_started and !took_dash_damage:
		take_damage(1)
		take_kb(100)
		took_dash_damage = true

func _on_rock_area_body_entered(player):
	if Global.dash_started and !took_dash_damage:
		take_damage(1)
		take_kb(100)
		took_dash_damage = true

func take_damage(damage):
	rock_hp -= damage
	if rock_hp == 2:
		$AnimatedSprite2D.animation = "chipped"
		rock_hit_sound.play()
	if rock_hp == 1:
		$AnimatedSprite2D.animation = "breaking"
		rock_hit_sound.play()
	if rock_hp < 1:
		Global.play_rock_destroy_sound()
		queue_free()

func take_kb(force):
	target_destination += Global.player_dash_direction * (force + Global.dash_force)
