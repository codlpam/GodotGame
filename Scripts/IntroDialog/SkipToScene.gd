extends Button


var skip_to_scene

func _loadSkipToScene(scene):
	skip_to_scene = scene
	pass

func _pressed():
	get_tree().change_scene("res://Scenes/Level1.tscn")
	pass
