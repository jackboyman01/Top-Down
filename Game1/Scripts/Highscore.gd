extends Node2D

func _ready():
	get_node("Label").set_text("Highscore: " + str(SaveHighscore.read_savegame()))
	pass

