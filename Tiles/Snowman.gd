extends MeshInstance

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func vanish():
	visible = false
	print("lol")

func spawn():
	visible = true
	print("dlol")
