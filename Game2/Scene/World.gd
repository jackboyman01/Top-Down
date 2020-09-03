extends Node2D

var punkte = 0

# warning-ignore:unused_argument
func _process(delta):
	get_node("Score").set_text("Score: " + str(punkte))

func points():
	punkte += 5
