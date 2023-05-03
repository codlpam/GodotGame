extends Control

onready var global_vars = get_node("/root/Global")

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused


func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _on_Resume_pressed():
	self.is_paused = false


func _on_MainMenu_pressed():
	get_tree().change_scene("res://Scenes/StartMenu.tscn")
	global_vars.lives = 3
	global_vars.minceCollected = false
	global_vars.steakCollected = false
	global_vars.butterChickenCollected = false
	self.is_paused = false


func _on_QuitGame_pressed():
	get_tree().quit()
