extends Node


onready var lives setget set_lives, get_lives
onready var score setget set_score, get_score
var minceCollected setget set_mince, get_mince
var steakCollected setget set_steak, get_steak
var butterChickenCollected setget set_butterChicken, get_butterChicken
var useMouseAim setget set_MouseAim, get_MouseAim
var FireballTimer setget set_timer, get_timer
var notification setget set_notification, get_notification

# Called when the node enters the scene tree for the first time.
func _ready():
	lives = 3
	score = 0
	minceCollected = false
	steakCollected = false
	butterChickenCollected = false
	useMouseAim = false


func set_lives(value):
	lives = value
	pass
	
func get_lives():
	return lives
	pass

func set_score(value):
	score = value
	pass
	
func get_score():
	return score
	pass
	
func set_mince(value):
	minceCollected = value
	pass

func get_mince():
	return minceCollected
	pass
	
func set_steak(value):
	steakCollected = value
	pass

func get_steak():
	return steakCollected
	pass
	
func set_butterChicken(value):
	butterChickenCollected = value
	pass

func get_butterChicken():
	return butterChickenCollected
	pass

func set_MouseAim(value):
	useMouseAim = value
	pass
	
func get_MouseAim():
	return useMouseAim
	pass
	
func set_timer(value):
	FireballTimer = value
	pass

func get_timer():
	return FireballTimer
	pass
	
func set_notification(value):
	notification = value
	pass

func get_notification():
	return notification
	pass
