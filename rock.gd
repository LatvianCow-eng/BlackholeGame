extends CharacterBody2D

var bh : Sprite2D

func _physics_process(delta):
	bh = Global.blackhole_sprite
	blackhole_pull()
	
func blackhole_pull():
	position += position.direction_to(Vector2(bh.position.x, bh.position.y)) * bh.scale
