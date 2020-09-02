extends KinematicBody2D
var punkte
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
	axis.y = int(Input.is_action_pressed("down")) -  int(Input.is_action_pressed("up"))
	#$AnimationPlayer.play("Idle")
	return axis.normalized()

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO

# warning-ignore:shadowed_variable
func apply_movement(acceleration):
	motion += acceleration
	#$AnimationPlayer.play("Run")
	motion = motion.clamped(max_speed)
