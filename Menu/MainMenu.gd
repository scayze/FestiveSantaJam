extends Control

onready var level_selector = get_node("LevelSelector")

func _ready():
	pass

func reset():
	self.show()

func _on_Play_pressed():
	var selected_level = level_selector.selected_level
	if not selected_level: return
	get_parent().play(selected_level.level)
	self.hide()
