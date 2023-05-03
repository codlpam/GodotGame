extends Panel


export (String, FILE, "*.tscn") var skip_to_scene
export (String, FILE, "*txt") var story_line_file


onready var stsNode = get_node("SkipToScene")
onready var cbNode = get_node("ChatBox")

func _ready():
	stsNode._loadSkipToScene(skip_to_scene)
	cbNode._loadDialogFromFile(story_line_file)
	pass
