extends Panel

export (String, FILE, "*txt") var story_line_file

onready var cbNode = get_node("ChatBox")

func _ready():
	cbNode._loadDialogFromFile(story_line_file)
	pass
