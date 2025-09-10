extends Label

var delta_time = 0
var last_fps = 0
var fps = 1

func _ready():
	text = "FPS: Thinking..."


func _process(delta):
	delta_time = delta


func _on_score_timer_timeout():
	fps = 1 / delta_time
	if last_fps != fps:
		text = "FPS: " + str(int(fps))
	last_fps = fps
