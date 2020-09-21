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
	var rand = RandomNumberGenerator.new()
	var screenpos = $Player/Camera.get_camera_position()
	var y = rand.randf_range(0, screenpos.y)
	rand.randomize()
	var x = rand.randf_range(0, screenpos.x)
	enemy.position.y = y
	enemy.position.x = x
	add_child(enemy)

func _on_Timer_timeout():
	spawn_enemy()

func _on_Points_timeout():
	points += 10
