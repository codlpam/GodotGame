extends KinematicBody2D

onready var global_vars = get_node("/root/Global")

var speed = 50
var motion = Vector2.ZERO
var player = null
var health = 3

onready var AttackDelayTimer = $AttackCooldown
export var AttackDelay: float = 1


func _physics_process(delta):
	motion = Vector2.ZERO
	if AttackDelayTimer.time_left > 0:
		motion = (position.direction_to(player.position) * -1) * 20
		motion = move_and_slide(motion)
	if player != null and AttackDelayTimer.is_stopped():
		motion = position.direction_to(player.position) * speed
		motion = move_and_slide(motion)
		$Wizard.play("fly")
		$Wizard.look_at(player.position)
		if motion > Vector2(0,-1) and motion > Vector2(0,1): #Moving Right
			$Wizard.flip_h = true
			$Wizard.flip_v = false
		else: #Moving Left
			$Wizard.flip_v = true
			$Wizard.flip_h = true
		if $FloorCheck.is_colliding() and ($WallCheckLeft.is_colliding() or $WallCheckRight.is_colliding()):
			position.y = position.y - 10
	else:
		$Wizard.play("idle")
		$Wizard.flip_v = false
		$Wizard.rotation_degrees = 0 
	
	if health == 2:
		$Health.texture = load("res://Sprites/HealthBar/healthbar2.png")
	elif health == 1:
		$Health.texture = load("res://Sprites/HealthBar/healthbar1.png")
	elif health == 0:
		$Health.texture = load("res://Sprites/HealthBar/healthempty.png")
		motion = Vector2.ZERO
		$Wizard.visible = false
		$Health.visible = false
		

func _on_CollisionArea_body_entered(body):
	if "Fireball" in body.name:
		health -= 1
		$EnemyHurt.play()
		body.queue_free()
			
func _on_DetectionArea_body_entered(body):
	if "Player" in body.name:
		player = body

func _on_EscapeArea_body_exited(body):
	if "Player" in body.name:
		player = null


func _on_AttackArea_body_entered(body):
	if "Player" in body.name and health > 0:
		motion = Vector2.ZERO
		AttackDelayTimer.start(AttackDelay)
		global_vars.lives -= 1
		$PlayerHurt.play()
		player.get_node("AnimationPlayer").play("damageFlash")


func _on_EnemyHurt_finished():
	if health == 0:
		queue_free()
