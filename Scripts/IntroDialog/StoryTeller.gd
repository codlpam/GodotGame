extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _on_StoryTeller_body_entered(body):
	if "Player" in body.name:
		$StoryBox.visible = true
	pass

func _on_StoryTeller_body_exited(body):
	if "Player" in body.name:
		$StoryBox.visible = false
	pass
