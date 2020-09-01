extends Node2D

func _process(_delta):
	if Input.is_action_pressed("key_exit"):
		$FadeIn.show()
		$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	get_tree().change_scene("res://Menu/Main Menu.tscn")
