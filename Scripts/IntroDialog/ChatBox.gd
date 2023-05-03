extends Label

var drawTextSpeed: int = 0
var chatterLimit: int = 100
var dialog = []

var page = 0

func _loadDialogFromFile(fname):
	var f = File.new()
	f.open(fname, File.READ)
	var index = 1
	while not f.eof_reached():
		var line = f.get_line()
		dialog.append(line)
		index += 1
	f.close()
	
	set_text(dialog[page])
	pass

func _ready():
	set_autowrap(true)

func _showChatter():
	if drawTextSpeed < chatterLimit:
		drawTextSpeed +=1
		self.visible_characters = drawTextSpeed
	pass
	
func _process(delta):
	_showChatter()
	pass

func _on_SkipLines_pressed():
	if page < dialog.size()-1:
		page +=1
		set_text(dialog[page])
	else:
		get_tree().change_scene("res://Scenes/Level1.tscn")
		#page = 0
		#set_text(dialog[page])
		
	drawTextSpeed = 0
	_showChatter()
	pass
