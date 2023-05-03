extends Node2D

onready var global_vars = get_node("/root/Global")

var notificationOffSet = 150

func _ready():
	defaultPies()
	global_vars.steakCollected == false
	global_vars.minceCollected == false
	global_vars.steakCollected == false
	


func _process(delta):
	if global_vars.notification != null:
		notify()
		global_vars.notification = null
	
	$HUD/FireBallPanel/FireballTimer.set_text(str(stepify(global_vars.FireballTimer, 0.1)))
	$HUD/Score.set_text("SCORE: "+str(global_vars.score))
	$HUD/LivesPanel/Lives.set_text("Lives: "+str(global_vars.lives))
	if global_vars.lives <= 0:
		get_tree().change_scene("res://Scenes/Dead.tscn")
	
	if global_vars.steakCollected == true:
		$HUD/PiesPanel/PieSteak.texture = load("res://Sprites/Pies/SteacknCheeseIdle2.png")
	if global_vars.minceCollected == true:
		$HUD/PiesPanel/PieMince.texture = load("res://Sprites/Pies/MincePieIdle1.png")
	if global_vars.butterChickenCollected == true:
		$HUD/PiesPanel/PieButterChicken.texture = load("res://Sprites/Pies/ButterChickenIdle1.png")
	
	if global_vars.lives == 3:
		defaultLives()
	elif global_vars.lives == 2:
		$HUD/LivesPanel/Heart3.texture = load("res://Sprites/Heart/Heart-Grey.png")
	elif global_vars.lives == 1:
		$HUD/LivesPanel/Heart2.texture = load("res://Sprites/Heart/Heart-Grey.png")
	elif global_vars.lives == 0:
		$HUD/LivesPanel/Heart1.texture = load("res://Sprites/Heart/Heart-Grey.png")
	pass
	
func defaultLives():
	global_vars.lives = 3
	$HUD/LivesPanel/Heart3.texture = load("res://Sprites/Heart/Heart.png")
	$HUD/LivesPanel/Heart2.texture = load("res://Sprites/Heart/Heart.png")
	$HUD/LivesPanel/Heart1.texture = load("res://Sprites/Heart/Heart.png")


func defaultPies():
	$HUD/PiesPanel/PieSteak.texture = load("res://Sprites/Pies/steak.png")
	$HUD/PiesPanel/PieMince.texture = load("res://Sprites/Pies/mince.png")
	$HUD/PiesPanel/PieButterChicken.texture = load("res://Sprites/Pies/butterChicken.png")
	


func _on_NotificationAnimation_animation_finished(anim_name):
	$HUD/PopupPanel.hide()
	
func notify():
	$HUD/PopupPanel/Notifications.text = global_vars.notification
	$HUD/PopupPanel.popup_centered()
	$HUD/PopupPanel/Notifications.margin_left - 50
	$HUD/PopupPanel.set_as_minsize() 
	$HUD/PopupPanel.popup_centered()
	$HUD/PopupPanel.rect_position.y = get_viewport().size.y - notificationOffSet
	$HUD/NotificationAnimation.play("modulate")
	
	
