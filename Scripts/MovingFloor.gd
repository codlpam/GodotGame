extends KinematicBody2D

export var move_speed = 0.5
export var move_distance = 100
export var move_direction = Vector2(0,0)

var time_since_init = 0
var origin = Vector2(0,0)

func _ready():
	time_since_init = 0.0
	origin = position
	pass

func _physics_process(delta):
	time_since_init = time_since_init + delta
	var position_on_curve = sin(time_since_init * PI * move_speed)
	var offset = move_distance * position_on_curve * move_direction
	position = origin + offset
	pass
