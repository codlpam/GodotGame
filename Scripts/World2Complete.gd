extends Area2D

onready var global_vars = get_node("/root/Global")

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			if global_vars.steakCollected == true and global_vars.minceCollected == true and global_vars.butterChickenCollected == true:
				global_vars.notification = ("Press Enter to Proceed")
				if Input.is_action_pressed("ui_accept"):
					get_tree().change_scene("res://Scenes/Level3.tscn")
					global_vars.steakCollected = false
					global_vars.minceCollected = false
					global_vars.butterChickenCollected = false
			else:
				global_vars.notification = ("Collect All Pies to Proceed!")
