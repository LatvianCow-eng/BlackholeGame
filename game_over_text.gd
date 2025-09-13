extends Label

var transition_progress = 0


func _process(delta):
	if Global.loss:
		transition_progress += delta
		visible_ratio = transition_progress
