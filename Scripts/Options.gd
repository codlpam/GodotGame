extends Control


onready var global_vars = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready():
	if global_vars.useMouseAim == true:
		$Panel/VBoxContainer/HBoxContainer/CheckBox.pressed = true
	else:
		$Panel/VBoxContainer/HBoxContainer/CheckBox.pressed = false


func _on_MainMenu_pressed():
	get_tree().change_scene("res://Scenes/StartMenu.tscn")


func _on_CheckBox_toggled(button_pressed):
	if global_vars.useMouseAim == false:
		global_vars.useMouseAim = true
	else:
		global_vars.useMouseAim = false
