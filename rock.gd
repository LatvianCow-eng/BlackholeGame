extends CharacterBody2D

var delta_time = 0

var bh : Sprite2D

func _ready():
	scale.x = 1.6 + randf() * 0.8
	scale.y = scale.x
	if randf() < 0.5:
		$Sprite2D.flip_h = true

func _physics_process(delta):
	delta_time = delta
	bh = Global.blackhole_sprite
	blackhole_pull()
	
func blackhole_pull():
	position += position.direction_to(Vector2(bh.position.x, bh.position.y)) * pow(bh.scale.x + 0.5, 2) * 30 * delta_time
	var distance_to_bh = position.distance_to(Vector2(bh.position.x, bh.position.y))
	var bh_size = bh.scale.x * 100 - 6 * scale.x
	if distance_to_bh < bh_size:
		Global.grow_blackhole(6 * scale.x)
		queue_free()
