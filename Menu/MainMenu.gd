extends Control

onready var level_selector = get_node("LevelSelector")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Play_pressed():
	var selected_level = level_selector.selected_level
	if not selected_level: return
	get_parent().play(selected_level.level)
	self.hide()
	pass
