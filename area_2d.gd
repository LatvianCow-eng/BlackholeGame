extends Area2D

@export var bh : Sprite2D

func _process(delta):
	scale = bh.scale - Vector2(0.05, 0.05)
