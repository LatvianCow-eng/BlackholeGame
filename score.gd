extends Label

var counter = 0
var phase = 1

var r = Color(1.0, 0.0, 0.0)
var g = Color(0.0, 1.0, 0.0)
var b = Color(0.0, 0.0, 1.0)
var color = Color(1.0, 0.0, 0.0)
var hype_color = Color(0.0, 0.0, 0.0)

func _process(delta):
	text = str(Global.score)
	
	hype_color = Color(1.0, 1.0, 1.0, 0.0) - Color(0.002, 0.002, 0.002, 0.0) * Global.score
	print(hype_color)
	
	counter += 1
	if phase == 1:
		color = r + g * counter / 100
	elif phase == 2:
		color = r * (100 - counter) / 100  + g
	elif phase == 3:
		color = g + b * counter / 100 
	elif phase == 4:
		color = g * (100 - counter) / 100  + b
	elif phase == 5:
		color = b + r * counter / 100 
	elif phase == 6:
		color = b * (100 - counter) / 100  + r
	
	if counter > 99:
		counter = 0
		phase += 1
		if phase == 7:
			phase = 1
	
	self_modulate = color + hype_color
