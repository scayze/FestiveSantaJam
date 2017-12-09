extends Control

export(String,FILE) var level = "res://Levels/002.tscn"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_LevelButton_pressed():
	get_parent().select_level(self)
