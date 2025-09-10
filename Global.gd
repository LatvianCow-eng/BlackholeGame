extends Node

var tick = 0

var delta_time = 0

var target_blackhole_size_increase = 0
var increase_blackhole_size = false
var increased_blackole_size = 0

var blackhole_sprite : Sprite2D

var loss = false

var score = 0

var dash_time_left = 0
var dash_started = false

func grow_blackhole(grow_amount):
	target_blackhole_size_increase += pow(grow_amount, 2) / pow(blackhole_sprite.scale.x * 100, 2)

func _process(delta):
	delta_time = delta
	apply_growth_to_blackhole()

func apply_growth_to_blackhole():
	if increase_blackhole_size and target_blackhole_size_increase != 0:
		increase_blackhole_size = false
		blackhole_sprite.scale.x += target_blackhole_size_increase / 10
		blackhole_sprite.scale.y = blackhole_sprite.scale.x
		increased_blackole_size += target_blackhole_size_increase / 10
		if increased_blackole_size > target_blackhole_size_increase:
			target_blackhole_size_increase = 0
			increased_blackole_size = 0
