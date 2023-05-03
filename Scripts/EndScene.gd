extends Node

onready var global_vars = get_node("/root/Global")


func _ready():
	global_vars.lives = 3 


func _on_MainMenu_pressed():
	get_tree().change_scene("res://Scenes/StartMenu.tscn")

func _on_QuitGame_pressed():
	get_tree().quit()

func _on_StoryTellerEnd_body_entered(body):
	if "Player" in body.name:
		$StoryTellerEnd/StoryBoxEnd.visible = true


func _on_StoryTellerEnd_body_exited(body):
	if "Player" in body.name:
		$StoryTellerEnd/StoryBoxEnd.visible = false



