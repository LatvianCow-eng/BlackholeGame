extends Node2D

var rock = preload("res://rock.tscn")

func _ready():
	new_game()
	Global.rock_destroy_sound = $Player/Rock_destroy_sound
	Global.blackhole_sprite = $Blackhole

func new_game():
	$rock_spawner.start()
	$score_timer.start()

func _on_rock_spawner_timeout():
	if !Global.loss:
		var summon = rock.instantiate()
		
		var summon_spawn_location = $SpawnPath/SpawnPathProgress
		summon_spawn_location.progress_ratio = randf()
		summon.position = summon_spawn_location.position
		
		add_child(summon)

func _on_score_timer_timeout():
	if !Global.loss:
		Global.score += 1

func _on_tick_timer_timeout():
	Global.increase_blackhole_size = true
	Global.tick += 1


func _on_play_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
	Global.reset_globals()


func _on_options_pressed():
	pass


func _on_quit_pressed():
	get_tree().quit()
