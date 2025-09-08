extends CharacterBody2D

var bh : Sprite2D

func _physics_process(delta):
	bh = Global.blackhole_sprite
	blackhole_pull()
	
func blackhole_pull():
	position += position.direction_to(Vector2(bh.position.x, bh.position.y)) * bh.scale
	var distance_to_bh = position.distance_to(Vector2(bh.position.x, bh.position.y))
	var bh_size = bh.scale.x * 100 - 10
	if distance_to_bh < bh_size:
		bh.scale += Vector2(0.2, 0.2)
		queue_free()
