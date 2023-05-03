extends Control

onready var global_vars = get_node("/root/Global")
func _ready():
	OS.set_window_position(OS.get_screen_size()*0.5 - OS.get_window_size()*0.5)
	
func _on_QuitGameButton_pressed():
	get_tree().quit()
	

func _on_OptionsButton_pressed():
	get_tree().change_scene("res://Scenes/Options.tscn")


func _on_StartGameButton_pressed():
	get_tree().change_scene("res://Scenes/Intro.tscn")
	global_vars.minceCollected = false
	global_vars.steakCollected = false
	global_vars.butterChickenCollected = false
