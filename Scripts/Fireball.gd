extends KinematicBody2D

onready var global_vars = get_node("/root/Global")
const speed = 250
var velocity = Vector2(0,0)

func _physics_process(delta):
	if velocity == Vector2(-1,0):
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	move_and_collide(velocity.normalized() * delta * speed)
	$Sprite.play("default")
	
func _on_Area2D_body_entered(body):
	if "CollisionTileMap" in body.name:
		queue_free()
	elif "Wall1" in body.name or "Wall2" in body.name or "Floor" in body.name:
		queue_free()
	elif "KinematicBody2D" in body.name:
		body.queue_free()
		queue_free()
