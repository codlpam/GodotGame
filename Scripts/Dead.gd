extends Control


onready var global_vars = get_node("/root/Global")

func _ready():
	global_vars.lives = 3
	pass
	
func _on_MainMenu_pressed():
	get_tree().change_scene("res://Scenes/StartMenu.tscn")


func _on_Retry_pressed():
	global_vars.minceCollected = false
	global_vars.steakCollected = false
	global_vars.butterChickenCollected = false
	get_tree().change_scene("res://Scenes/Level1.tscn")


func _on_QuitGame_pressed():
	get_tree().quit()
