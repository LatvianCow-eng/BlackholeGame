extends Label

var transition_progress = 0

func _process(delta):
	text = "Your Score: " +str(Global.score)
	if Global.loss:
		transition_progress += delta
		visible_ratio = transition_progress
