extends Node2D

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_pressed("key_exit"):
		$FadeIn.show()
		$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu/Main Menu/Main Menu.tscn")
