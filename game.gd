extends Node2D

var rock = preload("res://rock.tscn")

func _ready():
	new_game()

func new_game():
	$rock_spawner.start()

func _on_rock_spawner_timeout():
	var summon = rock.instantiate()
	
	var summon_spawn_location = $SpawnPath/SpawnPathProgress
	summon_spawn_location.progress_ratio = randf()
	summon.position = summon_spawn_location.position
	
	add_child(summon)
