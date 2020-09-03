extends Node2D

var punkte = 0

# warning-ignore:unused_argument
func _process(delta):
	get_node("Score").set_text("Score: " + str(punkte))
	if Input.is_action_pressed("key_exit"):
		$FadeIn.show()
		$FadeIn.fade_in()

func points():
	punkte += 5

func _on_FadeIn_fade_finished():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menu/Main Menu/Main Menu.tscn")
