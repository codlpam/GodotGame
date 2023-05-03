extends Area2D

onready var global_vars = get_node("/root/Global")

export var move_speed = 1.5
export var move_distance = 150
export var move_direction = Vector2(0,1)


var time_since_init = 0
var origin = Vector2(0,0)

func _ready():
	time_since_init = 0.0
	origin = position
	pass

func _physics_process(delta):
	$Sprite.play("default")
	time_since_init = time_since_init + delta
	var position_on_curve = sin(time_since_init * PI * move_speed)
	var offset = move_direction * position_on_curve * move_direction
	position = origin + offset 
	pass


func _on_PieMince_body_entered(body):
	if body.name == "Player":
		global_vars.score += 5
		global_vars.minceCollected = true
		global_vars.notification = ("Mince Pie Collected!")
		queue_free()
	pass


func _on_PieSteak_body_entered(body):
	if body.name == "Player":
		global_vars.score += 5
		global_vars.steakCollected = true
		global_vars.notification = ("Steak Pie Collected!")
		queue_free()
	pass


func _on_PieButterChicken_body_entered(body):
	if body.name == "Player":
		global_vars.score += 5
		global_vars.butterChickenCollected = true
		global_vars.notification = ("Butter Chicken Pie Collected!")
		queue_free()
	pass
