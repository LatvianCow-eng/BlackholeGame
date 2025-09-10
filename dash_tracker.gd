extends Label


func _process(delta):
	if Global.dash_started:
		text = "Dash cooldown: 0%"
		Global.dash_time_left = 1
	elif Global.dash_time_left > 0.9:
		text = "Dash cooldown: " + str(10 - roundi(Global.dash_time_left * 10)) + "%"
	else:
		text = "Dash cooldown: " + str(10 - roundi(Global.dash_time_left * 10)) + "0%"
		
	if Global.dash_time_left == 0:
		self_modulate = Color(1.0, 1.0, 0.0)
	else:
		self_modulate = Color(1.0, 1.0, 1.0)
