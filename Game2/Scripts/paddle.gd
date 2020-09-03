extends KinematicBody2D
var max_speed = 600
var acceleration = 3000
var motion = Vector2()

func _physics_process(delta):
	var axis = get_input_axis()
	if get_slide_count() > 0:
		var collision = get_slide_collision(0)
		if collision != null:
			get_node("/root/World/AudioStreamPlayer").play()
			get_node("/root/World").punkte += 5
	if axis == Vector2.ZERO:
		apply_friction(acceleration*delta)
	else:
		apply_movement(axis * acceleration * delta)
	motion = move_and_slide(motion)
	
	
	
func get_input_axis():
	var axis = Vector2.ZERO
	axis.y = int(Input.is_action_pressed("down")) -  int(Input.is_action_pressed("up"))
	return axis.normalized()

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

# warning-ignore:shadowed_variable
func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(max_speed)
