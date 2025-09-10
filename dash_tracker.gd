extends Label


func _process(delta):
	text = "Dash cooldown: " + str(100 - roundi(Global.dash_time_left * 100)) + "%"
	if Global.dash_time_left == 0:
		self_modulate = Color(1.0, 1.0, 0.0)
	else:
		self_modulate = Color(1.0, 1.0, 1.0)
