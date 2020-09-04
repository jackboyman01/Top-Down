extends Node2D

var points = 0

func _process(_delta):
	get_node("Points_Counter").set_text("Score: " + str(points))
	if Input.is_action_pressed("key_exit"):
		$FadeIn.show()
		$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu/Main Menu/Main Menu.tscn")

func _on_Enemy_enemy_hit():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()

func spawn_enemy():
	var rand = RandomNumberGenerator.new()
	var enemyscene = load("res://Game1/Mini Scenes/Enemy.tscn")
	var screen_size = get_viewport().get_visible_rect().size
	var enemy = enemyscene.instance()
	rand.randomize()
	var x = rand.randf_range(0,screen_size.x)
	rand.randomize()
	var y = rand.randf_range(0,screen_size.y)
	enemy.position.y = y
	enemy.position.x = x
	add_child(enemy)


func _on_Timer_timeout():
	spawn_enemy()

func _on_Points_timeout():
	points += 5
