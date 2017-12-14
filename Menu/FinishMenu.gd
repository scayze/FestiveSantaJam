extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Restart_pressed():
	get_parent().restart()
	pass # replace with function body


func _on_Back_pressed():
	get_parent().back()
	pass # replace with function body
