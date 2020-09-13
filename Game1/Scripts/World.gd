extends Node2D

var points = 0

func _process(_delta):
	get_node("CanvasLayer/Points_Counter").set_text("Score: " + str(points))
	if points > SaveHighscore.read_savegame():
		SaveHighscore.save(points)
	if Input.is_action_pressed("key_exit"):
		$CanvasLayer/FadeIn.show()
		$CanvasLayer/FadeIn.fade_in()

func _on_FadeIn_fade_finished():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu/Main Menu/Main Menu.tscn")

func _on_Enemy_enemy_hit():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()

func spawn_enemy():
	var enemyscene = load("res://Game1/Mini Scenes/Enemy.tscn")
	var enemy = enemyscene.instance()
# warning-ignore:unused_variable
	add_child(enemy)
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var x = rng.randi_range(0,3)+1
	match x:
		1:
			enemy.transform  = $Enemy_Spawner/Enemy_Spawner1.global_transform
		2:
			enemy.transform  = $Enemy_Spawner/Enemy_Spawner2.global_transform
		3:
			enemy.transform  = $Enemy_Spawner/Enemy_Spawner3.global_transform
		4:
			enemy.transform  = $Enemy_Spawner/Enemy_Spawner4.global_transform

func _on_Timer_timeout():
	spawn_enemy()

func _on_Points_timeout():
	points += 10
