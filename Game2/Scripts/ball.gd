extends KinematicBody2D
var speed = 3000
var direction = Vector2()
onready var paddle = get_node("/root/World/paddle/hitbox")

func _process(delta: float) -> void:
	
   # Get velocity
	var velocity = speed * delta * direction*10 # move slow? increases speed or multiply this x 100
   # move and slide:
# warning-ignore:return_value_discarded
	move_and_slide(velocity)
   # check if there is a collision:
	if get_slide_count() > 0:
		var collision = get_slide_collision(0)
		if collision != null:
			speed+=100
			direction = direction.bounce(collision.normal) # do ball bounce
			get_node("/root/World/AudioStreamPlayer").play()

	if get_position()<Vector2(-860,20000):
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
		speed=0
	


func _ready():
	   randomize()
	   # start with random direction beetween -1 and 1
	   direction.x = rand_range(3, 1)
	   direction.y = rand_range(-1, 1)
