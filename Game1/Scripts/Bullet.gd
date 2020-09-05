extends Area2D

var velocity = Vector2()
var speed = 750
var shoot = false

func _ready():
	print("Shooting projectile")
	velocity.x = +600

# warning-ignore:unused_argument
func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Detection_body_entered(body):
	if body.is_in_group("enemy"):
		body.queue_free()
	queue_free()
