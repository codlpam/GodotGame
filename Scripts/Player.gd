extends KinematicBody2D


const FireBallPath = preload("res://Scenes/Fireball.tscn")
onready var global_vars = get_node("/root/Global")

onready var FireballDelayTimer = $FireballCooldown
export var FireballDelay: float = 2

const UP = Vector2(0, -1)
const MAX_SPEED = 150
const ACCELERATION = 20
const GRAVITY = 15
const JUMP_HEIGHT = -320
var motion = Vector2() 
var aimOutOfBound = false

func _physics_process(delta):
	aimOutOfBound = false
	motion.y += GRAVITY
	var friction = false
	if Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false #flip sprite to face direction
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.play("Run")
		$Node2D.rotation_degrees = 0 
	elif Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		$Sprite.play("Run")
		$Node2D.rotation_degrees = 180
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
	else:
		friction = true;		
		$Sprite.play("Idle")
		
	
	# Play running sound when player is moving and on floor
	if Input.is_action_pressed("ui_right"):
		if is_on_floor():
			if not $Running.is_playing():
				$Running.play()
	elif Input.is_action_pressed("ui_left"):
		if is_on_floor():
			if not $Running.is_playing():
				$Running.play()
	else:
		$Running.stop()
		
	
	# Code for jumping and friction in air
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
	motion = move_and_slide(motion, UP)
	
	global_vars.FireballTimer = $FireballCooldown.time_left
	if Input.is_action_just_pressed ("ui_select") and FireballDelayTimer.is_stopped(): 
		FireballDelayTimer.start(FireballDelay)
		shoot() #placed outside otherwise wont fire if other keys are pressed down
		$Node2D/Position2D.rotation_degrees = 0 # reset rotation otherwise can go above 360
	elif Input.is_action_just_pressed ("ui_select") and $FireballCooldown.time_left > 0: 
		global_vars.notification = ("Fireball on Cooldown")
	

func shoot():
	var Fireball = FireBallPath.instance()
	get_parent().add_child(Fireball)
	Fireball.position = $Node2D/Position2D.global_position
	
	if global_vars.useMouseAim == true:
		aimOutOfBound = false
		$Node2D/Position2D.look_at(get_global_mouse_position())
		Fireball.look_at(get_global_mouse_position())
		Fireball.velocity = get_global_mouse_position() - Fireball.position
		if $Sprite.flip_h == false:
			if $Node2D/Position2D.rotation_degrees > -45 and $Node2D/Position2D.rotation_degrees < 45:
				pass
			else:
				aimOutOfBound = true
				Fireball.queue_free()
		elif $Sprite.flip_h == true:
			if $Node2D/Position2D.rotation_degrees < 45 and $Node2D/Position2D.rotation_degrees > -45:
				pass
			else:
				aimOutOfBound = true
				Fireball.queue_free()	
		if aimOutOfBound == true:
			global_vars.notification = ("Cant Shoot! Aim out of Bound")
			$FireballCooldown.stop()
	else:
		if $Node2D.rotation_degrees == 180:
			Fireball.velocity = Vector2(-1,0)
		else:
			Fireball.velocity = Vector2(1,0)
		$Sprite.play("Shoot")	
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

