extends KinematicBody2D

var max_speed = 600
var acceleration = 3000
var motion = Vector2()

func _physics_process(delta):
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(acceleration*delta)
	else:
		apply_movement(axis * acceleration * delta)
	motion = move_and_slide(motion)

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) -  int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) -  int(Input.is_action_pressed("ui_up"))
	return axis.normalized()

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(max_speed)
