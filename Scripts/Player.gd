extends KinematicBody2D

var max_speed = 600
var acceleration = 3000
var motion = Vector2()
var mouse_postion

func _physics_process(delta):
	look_at_cursor()
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(acceleration*delta)
	else:
		apply_movement(axis * acceleration * delta)
	motion = move_and_slide(motion)

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("right")) -  int(Input.is_action_pressed("left"))
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
	
func look_at_cursor():
	mouse_postion = get_local_mouse_position()
	rotation +=  mouse_postion.angle()
