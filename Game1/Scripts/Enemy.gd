extends KinematicBody2D

signal enemy_hit

var max_speed = 400
var motion = Vector2()
onready var obj = get_parent().get_node("Player")

func _physics_process(delta):
	var dir = (obj.global_position - global_position).normalized()
	rotation = dir.angle()
# warning-ignore:return_value_discarded
	move_and_collide(dir * max_speed * delta)

func _ready():
# warning-ignore:return_value_discarded
	connect("enemy_hit", get_parent(), "_on_Enemy_enemy_hit")

func _on_Player_Detection_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("enemy_hit")
